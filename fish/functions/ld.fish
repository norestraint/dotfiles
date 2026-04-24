function ld --description "Load directory in editor with fuzzy finder"
    # List of patterns to ignore (add more as needed)
    set -l ignore_patterns ".git" node_modules ".cache" __pycache__ ".venv" ".cargo" ".asdf"

    # Build find arguments as a proper list (no eval needed)
    set -l find_args $HOME -type d

    for pattern in $ignore_patterns
        set find_args $find_args "!" -path "*/$pattern/*" "!" -name "$pattern"
    end

    # Execute find directly (no eval, no string join)
    set -l selected_dir (find $find_args 2>/dev/null | fzf --height 40% --reverse --border --prompt="Select directory: ")

    if test -n "$selected_dir"
        cd "$selected_dir"
        $EDITOR .
    end
end
