# Symmetric cryptography

1. **Symmetric cryptography.** Encrypt a file with AES encryption, using
   [OpenSSL](https://www.openssl.org/): `openssl aes-256-cbc -salt -in {input
filename} -out {output filename}`. Look at the contents using `cat` or
   `hexdump`. Decrypt it with `openssl aes-256-cbc -d -in {input filename} -out
{output filename}` and confirm that the contents match the original using
   `cmp`.

**Step 1: Create a Sample Input File**

```bash
echo "This is a secret message for AES encryption demo." > 3_original_message.txt
```

This command creates a file named `3_original_message.txt` containing the
sentence "This is a secret message for AES encryption demo." You can verify its
contents with:

```bash
cat 3_original_message.txt
```

**Step 2: Encrypt the File**

Now, let's encrypt `3_original_message.txt` using AES in CBC (Cipher Block
Chaining) mode with a 256-bit key. The `-salt` option adds a salt to the key
derivation process, which enhances security.

In your terminal, run the following command:

```bash
openssl aes-256-cbc -salt -in 3_original_message.txt -out 3_encrypted_message.enc
```

- `openssl`: Invokes the OpenSSL toolkit.
- `aes-256-cbc`: Specifies the cipher to use (AES with a 256-bit key in CBC
  mode).
- `-salt`: Instructs OpenSSL to use a salt. The salt itself is written to the
  output file along with the encrypted data so it can be used for decryption. It
  protects against dictionary attacks on the password.
- `-in 3_original_message.txt`: Specifies the input file to be encrypted.
- `-out 3_encrypted_message.enc`: Specifies the name of the output file where the
  encrypted content will be stored.

**Important:** After running this command, OpenSSL will prompt you to enter and
then verify an encryption password (I chose `asdasd`):

```
enter aes-256-cbc encryption password:
Verifying - enter aes-256-cbc encryption password:
```

Choose a strong password and remember it, as you'll need the exact same
password for decryption.

**Step 3: Examine the Encrypted File**

If you try to view the contents of the encrypted file
(`3_encrypted_message.enc`), you'll see that it's not human-readable.

Try these commands:

```bash
cat 3_encrypted_message.enc
```

This will likely output garbled characters to your terminal. For a more
structured view of the binary data, use `hexdump`:

```bash
hexdump -C 3_encrypted_message.enc
```

- `hexdump -C`: Displays the file's content in hexadecimal format alongside its
  ASCII representation (if printable).

You should observe that the first few bytes of the file might start with
"Salted\_\_" (if a salt was used and stored in this format by your OpenSSL
version), followed by the salt itself, and then the encrypted data, none of
which will resemble your original message.

**Step 4: Decrypt the File**

To get your original message back, you need to decrypt `3_encrypted_message.enc`.

Use the following command:

```bash
openssl aes-256-cbc -d -in 3_encrypted_message.enc -out 3_decrypted_message.txt
```

- `-d`: This flag tells OpenSSL to perform decryption.
- `-in 3_encrypted_message.enc`: Specifies the encrypted input file.
- `-out 3_decrypted_message.txt`: Specifies the name of the file where the
  decrypted content will be stored.

OpenSSL will again prompt you for a password. **You must enter the exact same
password you used during the encryption step.**

```
enter aes-256-cbc decryption password:
```

If you enter the correct password, the command will execute, and
`3_decrypted_message.txt` will be created.

**Step 5: Verify the Decrypted File**

Finally, let's confirm that the decrypted file is identical to the original
file.

You can first view its contents:

```bash
cat 3_decrypted_message.txt
```

This should display: "This is a secret message for AES encryption demo."

For a definitive check, use the `cmp` (compare) command:

```bash
cmp 3_original_message.txt 3_decrypted_message.txt
```

- `cmp`: Compares two files byte by byte.

If the files are identical, `cmp` will produce no output and simply return to
the command prompt. If there are differences (e.g., you used the wrong
password, or the file got corrupted), `cmp` will report the byte and line
number where the first difference occurs.

If `cmp` gives no output, you have successfully encrypted and then decrypted your file\!

**Key Takeaways:**

- **Symmetric Encryption:** The same key (derived from your password) is used for both encryption and decryption.
- **Password Security:** The security of this encryption heavily relies on the strength and secrecy of your password. If an attacker gets your password, they can decrypt your files.
- **Salt:** Using a salt makes it harder for attackers to use precomputed tables (like rainbow tables) to crack passwords. The salt is stored with the ciphertext and does not need to be kept secret separately from the ciphertext.
- **CBC Mode:** Cipher Block Chaining is a mode of operation for block ciphers. It introduces a dependency on the previous block, meaning identical plaintext blocks will encrypt to different ciphertext blocks, which is a good security property.
