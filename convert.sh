#!/bin/bash

# Get input file name from command-line argument
input_file="${1}"

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed. Please install jq to run this script."
    exit 1
fi

# Check if input file is provided
if [ -z "$input_file" ]; then
    echo "Error: Please provide the input JSON file name."
    exit 1
elif [ ! -f "$input_file" ]; then
    echo "Error: Input file $input_file does not exist."
    exit 1
fi

# Extract base name of input file
base_name=$(basename "$input_file" .json)

# Define output file names
output_csv="${base_name}.csv"
output_md="${base_name}.md"

# Function to parse JSON and convert to CSV
parse_json_to_csv() {
    echo "ID,Severity,Package,Version,Operating System,Docker Image,CVE Identifier,CVE URL,Description,Solution" > "$output_csv"
    jq -r '.vulnerabilities[] | [
        .id,
        .severity,
        .location.dependency.package.name,
        .location.dependency.version,
        .location.operating_system,
        .location.image,
        .identifiers[0].value,
        .identifiers[0].url,
        .description,
        (.solution // "No solution provided")
    ] | @csv' "$input_file" >> "$output_csv"
}

# Function to parse JSON and convert to Markdown table
parse_json_to_md_table() {
    echo "| ID | Severity | Package | Version | Operating System | Docker Image | CVE Identifier | CVE URL | Description | Solution |" > "$output_md"
    echo "|----|----------|---------|---------|------------------|--------------|----------------|---------|-------------|----------|" >> "$output_md"
    jq -r '.vulnerabilities[] | [
        .id,
        .severity,
        .location.dependency.package.name,
        .location.dependency.version,
        .location.operating_system,
        .location.image,
        .identifiers[0].value,
        .identifiers[0].url,
        .description,
        (.solution // "No solution provided")
    ] | "| \(.[0]) | \(.[1]) | \(.[2]) | \(.[3]) | \(.[4]) | \(.[5]) | \(.[6]) | \(.[7]) | \(.[8]) | \(.[9]) |"' "$input_file" >> "$output_md"
}

# Execute the function to parse JSON and convert to CSV
if parse_json_to_csv; then
    echo "Conversion to CSV complete. CSV file created at: $output_csv"
else
    echo "Error: Failed to parse JSON and convert to CSV."
    exit 1
fi

# Execute the function to parse JSON and convert to Markdown table
if parse_json_to_md_table; then
    echo "Conversion to Markdown table complete. Markdown table file created at: $output_md"
else
    echo "Error: Failed to parse JSON and convert to Markdown table."
    exit 1
fi
