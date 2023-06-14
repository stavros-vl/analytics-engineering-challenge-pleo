# analytics-engineering-challenge-pleo

This repository is used for the Analytics Engineering challenge @Pleo

## Structure

The decision was to organize this project loosely following the practices described in this [dbt document](https://docs.getdbt.com/guides/best-practices/how-we-structure/1-guide-overview). One of the main reasons for this choice is that it strikes a balance between simplicity and allowing for better modularity plus a logical and clear separation of each layer's purpose.
You can find a visual representation of the structure [here](https://tree.nathanfriend.io/?s=(%27oZ!(%27fancyI~fullPath!false~trailGgSlashI~rootDotI)~F!(%27F!%27analytics-engGeCGg-challenge-pleo0README.md0analyseY9busGess_defGitKjalculate_O7TutilityjonvCt_currency7l*X0modelsHGtCmediate27l2BV7VBU7UBTNs_WagGgH*FsB373BL7LBTmarts5sql5ym6sq6ymJ7JBl0seedYsnapshotYteWY%27)~vCsK!%271%27)X%200%5Cn*2H*Gt_subscriZ3T*Wg_N4T*O_5H*8_O_drill_down.64Qcompany_Qmonth.7.sq8cuWomC9macrosHB.ymCerFsourceGinH0*I!trueJ4QpCiodKionL3_itemsNGvoiceOmrrQpC_TlHU4baseVl2_8sWstX*%20Ys0ZptKsj_9*c%01jZYXWVUTQONLKJIHGFCB987654320*)

More details about the folder structure:
- The `invoices_staging` folder is used to source from the raw tables in BigQuery and perform some light cleaning, renaming or recasting. In this case only renaming is performed.
- The `intermediate` subfolder is where business logic and modeling principles are starting to be applied. This also includes joins to between on staging models or joining between intermediate models
- The `marts` subfolder is where the models for consumption by end users (primarily analysts) are created by combining data from intermediate models. This mean that they provide a clean interface and are there to serve specific analytical needs expressed by stakeholders with no additional logic.
- The `macros` folder contains business definitions and utility functions that can be reused across other models, so we minimize repeated code and we have a single place where we make changes to e.g. definitions
