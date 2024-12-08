charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()_+-=\'"<>?/.,[]{}\\| '
x = charset.find('x')
for i in range(256):
    idx = charset.find(chr(i))
    if idx != -1:
        print(f"{idx:08b}")
    else:
        print(f"{x:08b}")
