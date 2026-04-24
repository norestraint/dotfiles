function lf --description "Load file in editor with fuzzy finder"
    set -l ignore_patterns ".git" node_modules ".cache" __pycache__ ".venv" ".cargo" ".asdf"

    set -l find_args $HOME -type f

    for pattern in $ignore_patterns
        set find_args $find_args "!" -path "*/$pattern/*" "!" -name "$pattern"
    end

    set -l selected_file (find $find_args 2>/dev/null | fzf --height 40% --reverse --border --prompt="Select file: ")

    if test -n "$selected_file"
        $EDITOR "$selected_file"
    end
end
