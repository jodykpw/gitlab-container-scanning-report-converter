# GitLab Container Scanning Report JSON to CSV and Markdown Table Converter

This Bash script converts GitLab container scanning reports in JSON format (`gl-container-scanning-report.json`) into both CSV and Markdown table formats. It's designed specifically for processing GitLab container scanning reports and converting them into formats suitable for documentation, reporting, or analysis.

## Requirements

- Bash
- jq

## Todo

To utilise this script in a GitLab CI/CD pipeline, simply configure a job to execute the script, converting the GitLab container scanning report JSON to CSV and Markdown formats, and save the converted files as artifacts for easy download.

## Usage

To use the script, follow these steps:

1. **Ensure jq is Installed**: Make sure you have `jq` installed on your system. If not, you can install it using your package manager or by downloading it from [jq's official website](https://stedolan.github.io/jq/download/).

2. **Download the Script**: Clone or download the `gitlab-container-scanning-report-converter` repository from GitHub.

3. **Make the Script Executable**: If needed, make the script executable by running the following command:
    ```bash
    chmod +x converter.sh
    ```

4. **Run the Script**: Execute the script by providing the GitLab container scanning report file name as an argument.

    ```bash
    ./converter.sh example.json
    ```

## Example

Suppose you have a GitLab container scanning report named `example.json`. To convert it into CSV and Markdown table formats, you can run the script as follows:

```bash
./converter.sh example.json
```

This command will generate example.csv and example.md files in the same directory containing the converted data.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

Feel free to use this README.md for your repository.

## Donation
If this project has helped save you time during development, I'd greatly appreciate a gesture of gratitude in the form of a cup of coffee :)

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=R2GUUDA73BHQG)

## 🇬🇧🇭🇰 Author Information

* Author: Jody WAN
* Linkedin: https://www.linkedin.com/in/jodywan/
* Website: https://www.jodywan.com
