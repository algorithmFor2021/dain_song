# BOJ-1543.py
# 문서 검색
# 문자열에서 특정 단어 중복되지 않고 검색 -> 총 몇 번인지 구하기

from sys import stdin
input = stdin.readline

document = input().strip()
word = input().strip()
n = len(word)
i = 0
count = 0

while i < len(document):
    print(i, i+n, document[i:i+n] == word, document[i:i+n], count)

    if document[i:i+n] == word:
        count += 1
        i += n
    else:
        i += 1

print(count)