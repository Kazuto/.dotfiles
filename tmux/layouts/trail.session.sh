session_root "~/Development/work/laravel-trail/"

if initialize_session "trail"; then
  new_window "neovim"

  split_v 20
  run_cmd "yarn && yarn dev"

  select_pane 1
  run_cmd "nvim ."
fi

finalize_and_go_to_session
