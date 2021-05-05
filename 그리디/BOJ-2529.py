# BOJ-2529.py
# 부등호

k = int(input())
marks = input().split()
marks.append(' ') # 부등호개수 < 자릿수이므로 한개추가

# 최대값
count, MAX = 0, 9
max_num = ''
for i in range(k+1):
    # < 부등호가 나온 경우에는 가능한 최대수보다 더 작은 수를 앞에 배치해야함
    # 7 < 8 < 9 ...
    if marks[i] == '<':
        count += 1
    else:
        next_max = MAX - count - 1
        # 연속된 < 개수보다 작은 수를 앞에 배치
        while count > 0:
            max_num += str(MAX - count)
            count -= 1
        max_num += str(MAX) # 현재 가장 큰 수를 배치
        MAX = next_max # 가능한 최대수를 변경

print(max_num)

# 최소값
count, MIN = 0, 0
min_num = ''
for i in range(k+1):
    if marks[i] == '>':
        count += 1
    else:
        next_min = MIN + count + 1
        while count > 0:
            min_num += str(MIN + count)
            count -= 1
        min_num += str(MIN)
        MIN = next_min

print(min_num)
