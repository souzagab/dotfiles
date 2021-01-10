#!/bin/bash
echo "======= Installing VSCode ======"
downloads_path="$HOME/Downloads"

if ! which "code" ; then
  microsoft_gpg_download_path="$downloads_path"/microsoft.gpg
  curl https://packages.microsoft.com/keys/microsoft.asc \
  | gpg --dearmor > "$microsoft_gpg_download_path"
  sudo cp "$microsoft_gpg_download_path" "/etc/apt/trusted.gpg.d/microsoft.gpg"
  sudo sh -c 'echo "deb [arch=amd64] \
  https://packages.microsoft.com/repos/vscode stable main" \
  > /etc/apt/sources.list.d/vscode.list'
  sudo apt-get update
  sudo apt-get install -y code
else
  echo vscode installed at $(which code)
fi

# TODO: Add extensions via cli
# https://stackoverflow.com/questions/34286515/how-to-install-visual-studio-code-extensions-from-command-line
