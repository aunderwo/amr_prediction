include './processes' params(params)
workflow ariba {
  take: reads
        database_dir
        summary_arguments

  main:
    // database_dir = file(params.database_dir)
    ariba_reports = run_ariba(reads, database_dir)
    all_ariba_reports = ariba_reports.collect { it }

    ariba_summary_output = ariba_summary(all_ariba_reports, database_dir, summary_arguments)
  emit:
    ariba_summary_output.summary_csv

}