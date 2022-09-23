## dbt models for `github`

`Github` is how people build software and is home to the largest community of open source developers in the world, with over 12 million people contributing to 31 million projects on GitHub since 2008.

This 3TB+ dataset comprises the largest released source of GitHub activity to date. It contains a full snapshot of the content of more than 2.8 million open source GitHub repositories including more than 145 million unique commits, over 2 billion different file paths, and the contents of the latest revision for 163 million files, all of which are searchable with regular expressions.

This public dataset is hosted in Google BigQuery and is included in BigQuery's 1TB/mo of free tier processing. This means that each user receives 1TB of free BigQuery processing every month, which can be used to run queries on this public dataset. Watch this short video to learn how to get started quickly using BigQuery to access public datasets. What is BigQuery .


This [dbt](https://www.getdbt.com/) project has a split personality:
* **Tutorial**: The [tutorial](https://github.com/fishtown-analytics/jaffle_shop/tree/master)
  branch is a useful minimum viable dbt project to get new dbt users up and
  running with their first dbt project. It includes [seed](https://docs.getdbt.com/reference#seed)
  files with generated data so a user can run this project on their own warehouse.
* **Demo**: The [demo](https://github.com/fishtown-analytics/jaffle_shop/tree/demo/master)
  branch is used to illustrate how we (Fishtown Analytics) would structure a dbt
  project. The project assumes that your raw data is already in your warehouse,
  so therefore the repo cannot be run as a standalone project. The demo is more
  complex than the tutorial as it is structured in a way that can be extended for
  larger projects.

### Using this project as a tutorial
To get up and running with this project:
1. Install dbt using [these instructions](https://docs.getdbt.com/docs/installation).

2. Clone this repository. If you need extra help, see [these instructions](https://docs.getdbt.com/docs/use-an-existing-project).

3. Change into the `github` directory from the command line:
```bash
$ cd github
```

4. Set up a profile called `github` to connect to a data warehouse by
  following [these instructions](https://docs.getdbt.com/docs/configure-your-profile).
  If you have access to a data warehouse, you can use those credentials – we
  recommend setting your [target schema](https://docs.getdbt.com/docs/configure-your-profile#section-populating-your-profile)
  to be a new schema (dbt will create the schema for you, as long as you have
  the right priviliges). If you don't have access to an existing data warehouse,
  you can also setup a local postgres database and connect to it in your profile.

5. Ensure your profile is setup correctly from the command line:
```bash
$ dbt debug
```

6. Load the CSV with the origin names data set. This materializes the CSVs as tables in
  your target schema. Note that a typical dbt project **does not require this
  step** since dbt assumes your raw data is already in your warehouse.
```bash
$ dbt seed
```

7. Run the models:
```bash
$ dbt run
```

> **NOTE:** If this steps fails, it might be that you need to make small changes to the SQL in the models folder to adjust for the flavor of SQL of your target database. Definitely consider this if you are using a community-contributed adapter.

8. Test the output of the models:
```bash
$ dbt test
```

9. Generate documentation for the project:
```bash
$ dbt docs generate
```

10. View the documentation for the project:
```bash
$ dbt docs serve
```
