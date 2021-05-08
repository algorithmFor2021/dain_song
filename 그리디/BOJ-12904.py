# BOJ-12904.py
# A와 B

S = list(input())
T = list(input())
length = len(T) - len(S)

for i in range(length):    
    # 문자열 뒤에서 A를 제거한다.
    if T[-1] == 'A':
        del T[-1]
    # 문자열 뒤에서 B를 제거하고 문자열을 뒤집는다.
    elif T[-1] == 'B':
        del T[-1]
        T.reverse()

if S == T:
    print(1)
else:
    print(0)
