#!/bin/bash

# Check for required number of arguments
if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <sql_file.gz> <database_name>"
  exit 1
fi

# Store arguments in variables
sql_file="$1"
database_name="$2"

# Check if the SQL.gz file exists
if [[ ! -f "$sql_file" ]]; then
  echo "Error: File '$sql_file' does not exist."
  exit 1
fi

# Execute the decompression and import command
echo "Decompressing and importing '$sql_file' into '$database_name'..."
zcat "$sql_file" | mysql -u root -proot "$database_name"

if [[ $? -eq 0 ]]; then
  echo "Import completed successfully."
else
  echo "Error occurred during import. Please check the output for details."
fi

