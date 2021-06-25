# BOJ-1062.py 가르침

words = []
alphabets = 0 # 학습한 알파벳에 대한 비트마스킹
max_count = 0 # 학생들이 읽을 수 있는 단어의 최댓값
base_ascii = 97 # 'a'

def find_max_words():
    global words, alphabets, max_count
    count_of_words = 0
    for word in words:
        flag = True
        for char in word:
            index = ord(char) - base_ascii
            if (alphabets & (1 << index)) == 0:
                flag = False
                break
        if flag:
            count_of_words += 1
    if max_count < count_of_words:
        max_count = count_of_words

def dfs(index, count, K):
    global alphabets
    if count == K:
        find_max_words()
        return
    for i in range(index, 26):
        if (alphabets & (1 << i)) == 0:
            alphabets |= (1 << i)
            dfs(i+1, count+1, K)
            alphabets &= ~(1 << i)


N, K = map(int, input().split())
for _ in range(N):
    words.append(input()[4:-4])

if K < 5:
    print(0) # Case1. anta - tica 조차 배울수 없는 경우
elif K == 26:
    print(N) # Case2. 모든 단어를 배울수 있는 경우
else:
    for char in "antic":
        index = ord(char) - base_ascii
        alphabets |= (1 << index)
    dfs(1, 5, K)
    print(max_count)
    


