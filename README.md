# analytics-engineering-challenge-pleo

This repository is used for the Analytics Engineering challenge @Pleo

## Data model & project structure

The decision was to organize this project loosely following the practices described in this [dbt document](https://docs.getdbt.com/guides/best-practices/how-we-structure/1-guide-overview). One of the main reasons for this choice is that it strikes a balance between simplicity and allowing for better modularity plus a logical and clear separation of each layer's purpose.
You can find a visual representation of the structure [here](https://tree.nathanfriend.io/?s=(%27oZ!(%27fancyI~fullPath!false~trailGgSlashI~rootDotI)~F!(%27F!%27analytics-engGeCGg-challenge-pleo0README.md0analyseY9busGess_defGitKjalculate_O7TutilityjonvCt_currency7l*X0modelsHGtCmediate27l2BV7VBU7UBTNs_WagGgH*FsB373BL7LBTmarts5sql5ym6sq6ymJ7JBl0seedYsnapshotYteWY%27)~vCsK!%271%27)X%200%5Cn*2H*Gt_subscriZ3T*Wg_N4T*O_5H*8_O_drill_down.64Qcompany_Qmonth.7.sq8cuWomC9macrosHB.ymCerFsourceGinH0*I!trueJ4QpCiodKionL3_itemsNGvoiceOmrrQpC_TlHU4baseVl2_8sWstX*%20Ys0ZptKsj_9*c%01jZYXWVUTQONLKJIHGFCB987654320*)

More details about the folder structure:
- The `invoices_staging` folder is used to source from the raw tables in BigQuery and perform some light cleaning, renaming or recasting. In this case, only renaming is performed.
- The `intermediate` subfolder is where business logic and modeling principles are starting to be applied. This also includes joins to  staging models or joining between intermediate models
- The `marts` subfolder is where the models for consumption by end users (primarily analysts) are created by combining data from intermediate models. This means that they provide a clean interface and are there to serve specific analytical needs expressed by stakeholders with no additional logic.
- The `macros` folder contains business definitions and utility functions that can be reused across other models, so we minimize repeated code and we have a single place where we make changes to e.g. definitions
- The `tests` folder contains custom tests that are used to ensure data reliability/quality

## Data Quality & testing

Since the MRR models are critical for the organization as important company-wide decisions are made based on them we need to ensure the reliability through a testing/monitoring framework. 
The following tests have been implemented to ensure that any issues are caught as early as possible:

- Out-of-the-box tests:
  - Unique & not null test on the staging models *stg_invoice* & *stg_invoice_items*
  - Source freshness test based on the synced_at column to ensure that we don't have stale data in these crucial models and if we do we can catch them early on
  - Accepted values tests on the subscription and currency columns of the *invoice_items* that assert that only valid values are contained in these fields
    
- Custom tests:
  - A custom test is_not_negative on the *int_subscriptions* model that ensures there are no subscription invoice items with negative values which are crucial for data quality.

### Other suggested tests

For a more complete and robust set of testing, these are the ones suggested ranked by priority (after making sure the tests mentioned above are already implemented):
1. Source Freshness tests in **all** source tables that are used to construct the MRR downstream models. Data freshness is probably the most important step in the quest for data reliability and trust. It's important to catch those issues as early as possible. It can also help significantly cut down on debugging time. 
2. A test that checks that e.g. the MRR amount column is within a specified interval. This should be implemented downstream on the mart level to ensure that outliers are caught by the data team. A good example of such a test would be the [expect_column_values_to_be_within_n_stdevs](https://github.com/calogica/dbt-expectations/tree/0.8.5/#expect_column_values_to_be_within_n_stdevs) from dbt_expectations package

It should be noted that for the testing suite to be truly effective ownership has to be defined, otherwise, even a comprehensive testing suite might not fulfill its full potential and issues might go unnoticed and not be resolved on time.

  
