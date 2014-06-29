function ssh_key_for {
  curl -i https://api.github.com/users/${1}/keys
}

function symlink_ssh_auth_sock {
  ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
}

function export_ssh_auth_sock {
  export SSH_AUTH_SOCK=/home/vagrant/.ssh/ssh_auth_sock
}

if [ -z "$TMUX" ]; then
  symlink_ssh_auth_sock
else
  export_ssh_auth_sock
fi
