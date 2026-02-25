function ll --wraps eza --description 'eza long format with git'
    eza -la --icons --group-directories-first --git $argv
end
