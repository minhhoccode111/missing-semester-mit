# Asymmetric cryptography

1.  Set up [SSH
    keys](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2)
    on a computer you have access to (not Athena, because Kerberos interacts
    weirdly with SSH keys). Make sure
    your private key is encrypted with a passphrase, so it is protected at
    rest.
1.  [Set up GPG](https://www.digitalocean.com/community/tutorials/how-to-use-gpg-to-encrypt-and-sign-messages)
1.  Send Anish an encrypted email ([public key](https://keybase.io/anish)).
1.  Sign a Git commit with `git commit -S` or create a signed Git tag with
    `git tag -s`. Verify the signature on the commit with `git show
--show-signature` or on the tag with `git tag -v`.
