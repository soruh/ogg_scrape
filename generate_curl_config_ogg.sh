#!/bin/bash

# Input file containing URLs
output_config="$PWD/curl_config_ogg.txt"

# Create or clear the output configuration file
echo "# curl configuration file" > "$output_config"

# Create the audio directory if it doesn't exist
mkdir -p audio

# Read each line from the input file and append to the config file
pushd links

for name in *; do 
  
  # Define the path where the result should be saved
  output_file="audio/$name.ogg"
  url="$(cat "$name" | xargs)"

  # Append the URL and output option to the config file
  echo "url = \"$url\"" >> "$output_config"
  echo "output = \"$output_file\"" >> "$output_config"
  echo >> "$output_config"  # Add a blank line between entries

done

popd

echo "Generated curl config file: $output_config"

