space = "8'h20"
string = input()
word_by_word = string.split()
count = line = 0

for word in word_by_word:
    for letter in word:
        print("5'h" + str(line) + str(hex(count)[-1].upper()) + ": out <= 8'h" + hex(ord(letter))[2:] + ';')
        count += 1
        if count == 16:
            line += 1
    print("5'h" + str(line) + str(hex(count)[-1].upper()) + ': out <= ' + space + ';')
    count += 1
    if count == 16:
        line += 1
'''
___BIOS USAGE___
'''
