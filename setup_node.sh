setup_nvm_lts() {
  # NVM base dir
  export NVM_DIR="$HOME/.nvm"

  # Load NVM if available (Homebrew-installed or manually installed)
  if [ -s "$(brew --prefix nvm)/nvm.sh" ]; then
    \. "$(brew --prefix nvm)/nvm.sh"
  elif [ -s "$NVM_DIR/nvm.sh" ]; then
    \. "$NVM_DIR/nvm.sh"
  else
    echo "⚠️  nvm is not installed. Run 'brew install nvm' first."
    return 0
  fi

  # If node exists but not from nvm, skip
  # if command -v node >/dev/null 2>&1 && ! command -v nvm >/dev/null 2>&1; then
  #   echo "⚠️  Node.js is already installed outside of nvm. Skipping nvm setup."
  #   return 0
  # fi

  # Get latest LTS
  # local latest_lts
  # latest_lts=$(nvm version-remote --lts)
  #
  # # Ensure it’s installed
  # nvm install --lts >/dev/null
  #
  # Resolve installed version
  local installed_version=$(nvm version "$latest_lts")
  echo "$installed_version"

  # If another nvm version is active, abort
  local current_version=$(nvm current)
  if [[ "$current_version" != "system" && "$current_version" != "$installed_version" ]]; then
    echo "❌ Error: Another Node.js version is already active ($current_version)."
    echo "   Run 'nvm use $installed_version' to switch to latest LTS."
    return 1
  fi


  # Export paths for latest LTS
  if [[ "$installed_version" != "N/A" ]]; then
    local npm_path="$NVM_DIR/versions/node/$installed_version/lib/node_modules"
    export NPM_PATH="$npm_path"
    # export PATH="$NVM_DIR/versions/node/$installed_version/bin:$PATH"


    local added_path="$NVM_DIR/versions/node/$installed_version/bin"
    # export NPM_PATH="$(npm_path)"
    echo "added NPM_PATH: $added_path"
  fi
}

# Run at shell startup
setup_nvm_lts


