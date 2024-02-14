#!/bin/bash

# Config
db_user="user"
db_password="password"
db_name="database"
mysql_path="/your/mysql/path" # Mostly /usr/bin/mysql, may vary
sql_query="query"
retries=3
retry_interval=10

log_dir="/your/desired/log/folder"
running_log="$log_dir/result.log"

# Prepare date time matching timezone on argument
log_with_datetime() {
    local datetime
    datetime=$(TZ="$1" date +"%Y-%m-%d %H:%M:%S")
    echo "$datetime $2"
}

# Check and create log folder or file
create_log_files() {
    mkdir -p "$log_dir"
    touch "$running_log"
}

# Check timezone argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <timezone>"
    exit 1
fi

# Set timezone argument
timezone="$1"

# Execute check and create log
create_log_files

retry_count=0

while [ $retry_count -lt $retries ]; do
    # Run quert and save output
    query_output=$($mysql_path -u$db_user -p$db_password -D$db_name -e "$sql_query" 2>&1)

    # Check for exit status
    if [ $? -eq 0 ]; then
        # Log for successful query
        log_with_datetime "$timezone" "Query succeed. Output: $query_output" >> "$running_log"
        exit 0
    else
        # Log for failed query and retry
        log_with_datetime "$timezone" "Query failed. Output: $query_output. Retry in $retry_interval seconds..." >> "$running_log"
        sleep $retry_interval
        retry_count=$((retry_count + 1))
    fi
done

# Log for failed query after max retry
log_with_datetime "$timezone" "Query still failed after executing $retries times. Execution stopped." >> "$running_log"
exit 1