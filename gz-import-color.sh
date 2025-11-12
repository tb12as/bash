#!/bin/bash

# ANSI color codes for background
BG_GREEN='\033[42m'
BG_RED='\033[41m'
BG_BLUE='\033[44m'
NC='\033[0m' # No Color
NB='\033[49m' # No Background

# Check for required number of arguments
if [[ $# -ne 2 ]]; then
  echo -e "${BG_RED}Usage: $0 <sql_file.gz> <database_name>${NC}${NB}"
  exit 1
fi

# Store arguments in variables
sql_file="$1"
database_name="$2"

# Check if the SQL.gz file exists
if [[ ! -f "$sql_file" ]]; then
  echo -e "${BG_RED}Error: File '$sql_file' does not exist.${NC}${NB}"
  exit 1
fi

# Execute the decompression and import command with timing
# echo "Importing '$sql_file' into '$database_name'..."
start_time=$(date +%s)
zcat "$sql_file" | mysql "$database_name"
end_time=$(date +%s)

# Calculate the duration
duration=$((end_time - start_time))

if [[ $? -eq 0 ]]; then
  # echo -e "${BG_GREEN}Import completed in ${NC}${NB}${BG_BLUE}${duration}s.${NC}${NB}"
  echo -e "${BG_BLUE}Import completed in ${duration}s.${NC}${NB} to ${BG_GREEN}${database_name}${NC}${NB}"
else
  echo -e "${BG_RED}Error occurred during import. Please check the output for details.${NC}${NB}"
fi

