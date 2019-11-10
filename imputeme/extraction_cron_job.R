


# sudo crontab -u shiny -e
# 00 20 * * * Rscript /srv/shiny-server/impute-me/imputeme/extraction_cron_job.R > /home/ubuntu/misc_files/cron_logs/`date +\%Y\%m\%d\%H\%M\%S`-extract-cron.log 2>&1


source("/srv/shiny-server/impute-me/functions.R")


crawl_for_snps_to_analyze()