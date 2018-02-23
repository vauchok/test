class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service {'sshd':
    ensure => 'running',
    enable => 'true',
  }
  ssh_authorized_key {'root@master.puppet.vm':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDX2QCn9rGTenlNfm/xjlgWtbn/gm7hI3K1nE9K8Udl5WAkunl8N66f+PFdV5aQFCEBsfbhCIpoOithWBJ2abRCa7K9NNK80ggbt2oy/Ou58ZG9EBlHFgIQCfcgYLRde5Trbesch68MwWOx/k3kDJhSCR6cvuaKjLr2C2N2X+/32R+rf+VSGwBUDvLkKOc4WlsjcP+oa2vxfTExQCDCIvjLlY4xR0RUe3+Oz94mzD1mBZLSwhhTFNWJ/NEbQjr2K/gcW3tlgP98zhxCg00BnSNsy3C7H8DBJdz0dpKTSizhVbLqgT76vygvTmQDF9OepZq/5N3N5cZuMy4c+m0lJAu+fZSgrwzx+ZczjlnvMSspb82tHPxXnxrYirLPM8IJbvQKR3SmE8GbKJuKT/s1CQu0AaYQXll+LxD1FfqWUOvKW5bwkIzL46+r71Zj5rTcRU97HEQBg0Jq634Z1NcOTzRKCHzm+FZNKuEtMd1H1xcJyP7zYJRh/8bjlshjbU/C9jc5HLUpH6gSarjItTHRUnO2javlTzOumAXqV3plTeWz/Rff79UiI293+j0n0KrLatHGE59dctNg1T+xii/uv8TITBrfCR9weTnD+Q4vSCxvvYCvw79LcpeA8tc9eZip2LBowtLHP4VxImiglwgN8cWeceWw79leBnzitBPbd006ow==',
  }
}
