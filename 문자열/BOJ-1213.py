# BOJ-1213.py
# 팰린드롬 만들기

# ABAB -> AABB -> A .. A -> B .. B
# AABCABC -> A .. A -> A B .. B A ->  A B C .. C B A -> A B C A C B A
# AAABBB -> A .. A -> AB .. BA -> x

string = input()
alphabets = [0] * 26
for s in string:
    alphabets[ord(s) - ord('A')] += 1

# 두개 이상인 문자들을 사전순대로 양쪽에 배치
result = []
for i in range(26):
    mid = len(result) // 2
    if alphabets[i] >= 2:
        c = alphabets[i] // 2
        result.insert(mid, chr(65 + i)*c)
        result.insert(mid+1, chr(65 + i)*c)
        alphabets[i] -= 2*c

remain = sum(alphabets)
if remain == 0:
    # 남은 문자가 없는 경우 바로 출력
    print(''.join(result))
elif remain == 1:
    # 남은 문자가 한개인 경우 가운데에 배치 후 출력
    mid = len(result) // 2
    idx = alphabets.index(1)
    result.insert(mid, chr(65 + idx))
    print(''.join(result))
else:
    # 남은 문자가 두개 이상인 경우 불가능
    print("I'm Sorry Hansoo")
