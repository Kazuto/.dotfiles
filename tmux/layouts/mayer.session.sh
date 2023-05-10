session_root "~/Development/private/mayer.ws"

if initialize_session "mayer"; then
  new_window "neovim"

  split_v 20
  run_cmd "yarn && yarn dev"

  select_pane 1
  run_cmd "nvim ."
fi

finalize_and_go_to_session
