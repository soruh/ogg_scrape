#!/bin/bash

# Input file containing URLs
input_file="links.txt"
output_config="curl_config.txt"

# Create or clear the output configuration file
echo "# curl configuration file" > "$output_config"

# Create the results directory if it doesn't exist
mkdir -p results

# Read each line from the input file and append to the config file
while IFS= read -r url
do
  # Extract the filename from the URL
  name=$(echo "$url" | cut -d "/" -f5)
  
  # Define the path where the result should be saved
  output_file="results/$name"

  # Append the URL and output option to the config file
  echo "url = \"$url\"" >> "$output_config"
  echo "output = \"$output_file\"" >> "$output_config"
  echo >> "$output_config"  # Add a blank line between entries

done < "$input_file"

echo "Generated curl config file: $output_config"

