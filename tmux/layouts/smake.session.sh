session_root "~/Development/work/smake"

if initialize_session "smake"; then
  new_window "neovim"
  split_v 20
  select_pane 1
  run_cmd "nvim ."
fi

finalize_and_go_to_session
