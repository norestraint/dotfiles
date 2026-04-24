function gd --description "Go to directory with fuzzy finder"
    set -l ignore_patterns ".git" node_modules ".cache" __pycache__ ".venv"

    set -l find_args $HOME -type d

    for pattern in $ignore_patterns
        set find_args $find_args "!" -path "*/$pattern/*" "!" -name "$pattern"
    end

    set -l selected_dir (find $find_args 2>/dev/null | fzf --height 40% --reverse --border --prompt="Select directory: ")

    if test -n "$selected_dir"
        cd "$selected_dir"
        echo "Changed to: $selected_dir"
    end
end
