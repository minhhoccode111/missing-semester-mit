# Entropy

1.  Suppose a password is chosen as a concatenation of four lower-case
    dictionary words, where each word is selected uniformly at random from a
    dictionary of size 100,000. An example of such a password is
    `correcthorsebatterystaple`. How many bits of entropy does this have?

N = 100000 \* 100000 \* 100000 \* 100000

N = 100000^4

N = (10^5)^4

N = 10^20

H = log_2(N)

H = log_2(10^20)

H ~ 66.438 bits

2.  Consider an alternative scheme where a password is chosen as a sequence
    of 8 random alphanumeric characters (including both lower-case and
    upper-case letters). An example is `rg8Ql34g`. How many bits of entropy
    does this have?

Size of the character set (R)

26 lowercase + 26 uppercase + 10 digits

R = 62 (characters)

N = 62^8

H = log_2(N)

H = log_2(62^8)

H = 47.633568 bits

3.  Which is the stronger password?

The password scheme with higher entropy is considered stronger. This is because
higher entropy means there are more possible combinations, making it harder for
an attacker to guess the password.

Therefore, the password formed by concatenating four lower-case dictionary
words from a 100,000-word dictionary (66.44 bits) is the stronger password
compared to an 8-character alphanumeric password (47.63 bits)

4.  Suppose an attacker can try guessing 10,000 passwords per second. On
    average, how long will it take to break each of the passwords?

Time ≈ 158.4 million years for 66.44 bits

Time ≈ 345.9 years for 47.63 bits
