# sb-zsh Installation

This README provides instructions on how to install the ```sb-zsh``` scripts using the provided installation script.

## Prerequisites

- Ensure that you have ```zsh``` installed on your system.
- Make sure you have the necessary permissions to create directories and copy files in your home directory.

## Installation

1. Download the installation script and the ```sb-zsh``` scripts to your local machine.

2. Open a terminal and navigate to the directory where the installation script is located.

3. Run the installation script by executing the following command:

   ```zsh
   ./install.zsh
   ```

4. The script will prompt you to confirm the installation. Enter ```y``` to proceed or ```n``` to cancel the installation.

5. If you choose to proceed, the script will perform the following actions:
   - Check if the ```$HOME/.sb-zsh``` directory exists. If it doesn't, the script will create it.
   - If the ```$HOME/.sb-zsh``` directory already exists, the script will delete it and recreate it to ensure a clean installation.
   - Copy the ```sb-zsh.zsh``` script and the ```scripts*``` directories to the ```$HOME/.sb-zsh``` directory.

6. After copying the files, the script will source the ```.zshrc``` file to ensure that the changes take effect.

7. If the installation is successful, you will see the message "Scripts installed successfully, sourcing the .zshrc file..." followed by "Sourcing complete."

## Post-Installation

Once the installation is complete, you can start using the ```sb-zsh``` scripts in your ```zsh``` environment. The scripts will be available in the ```$HOME/.sb-zsh``` directory.

If you want to customize the scripts or add your own, you can modify the files in the ```$HOME/.sb-zsh``` directory.

## Uninstalling

To uninstall the ```sb-zsh``` scripts, simply delete the ```$HOME/.sb-zsh``` directory and remove any references to it from your ```.zshrc``` file.

## Troubleshooting

If you encounter any issues during the installation or while using the ```sb-zsh``` scripts, please check the following:

- Ensure that you have the necessary permissions to create directories and copy files in your home directory.
- Make sure that the installation script and the ```sb-zsh``` scripts are located in the correct directory.
- Verify that your ```.zshrc``` file is properly configured and sourced.

If the issue persists, please contact the script maintainer or seek further assistance.
