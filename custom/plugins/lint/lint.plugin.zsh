setup_eslint_prettier() {
  package_manager=${PACKAGE_MANAGER:-yarn}

  dependencies=(
    eslint
    eslint-plugin-import
    eslint-plugin-simple-import-sort
    eslint-plugin-unused-imports
    eslint-plugin-prettier
    eslint-config-prettier
    prettier
    @typescript-eslint/eslint-plugin
    @typescript-eslint/parser
  )

  configs=(
    .eslintrc.json
    .eslintignore
    .prettierrc.json
    .prettierignore
  )

  gen_config() {
    local template="$1"
    cp $ZSH/custom/plugins/lint/templates/$template $template
  }

  for config in $configs; do
    echo gen_config $config
  done

  echo "$package_manager add --dev ${dependencies[@]}"

  unset dependencies configs package_manager
}
