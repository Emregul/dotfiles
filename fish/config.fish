if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Created by `pipx` on 2022-08-06 03:51:21
set PATH $PATH /Users/edg/.local/bin

fish_vi_key_bindings
bind -M insert -m default jk backward-char force-repaint

starship init fish | source
