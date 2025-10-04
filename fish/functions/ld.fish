function ld --description "Load directory in editor with fuzzy finder"
    # List of patterns to ignore (add more as needed)
    set -l ignore_patterns ".git" node_modules ".cache" __pycache__ ".venv" ".cargo" ".asdf"

    # Build find command with exclusions
    set -l find_cmd find "$HOME" -type d

    # Add exclusion patterns (properly quoted to avoid Fish wildcard expansion)
    for pattern in $ignore_patterns
        set find_cmd $find_cmd "!" -path "'*/$pattern/*'" "!" -name "'$pattern'"
    end

    # Execute find and pipe to fzf
    set -l selected_dir (eval (string join " " -- $find_cmd) 2>/dev/null | fzf --height 40% --reverse --border --prompt="Select directory: ")

    # Check if a directory was selected (Enter pressed)
    if test -n "$selected_dir"
        cd "$selected_dir"
        $EDITOR .
    end
    # If Esc pressed, $selected_dir is empty and nothing happens
end
