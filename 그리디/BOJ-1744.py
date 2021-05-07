# BOJ-1744.py
# 수 묶기

N = int(input())
nums = []
for _ in range(N):
    nums.append(int(input()))

nums.sort()
isZero = 0 in nums # 마이너스의 개수가 홀수일때 곱해주기
minus_nums = list(filter(lambda x: x < 0, nums))
minus_nums.reverse()
plus_nums = list(filter(lambda x: x > 0, nums))

total = 0
len_plus = len(plus_nums) 
if len_plus % 2 :
    # 홀수개 있을 경우
    total += plus_nums[0]
    for i in range(1, len_plus, 2):
        add = plus_nums[i] + plus_nums[i+1]
        mul = plus_nums[i] * plus_nums[i+1]
        total += max(add, mul)
else:
    for i in range(0, len_plus, 2):
        add = plus_nums[i] + plus_nums[i+1]
        mul = plus_nums[i] * plus_nums[i+1]
        total += max(add, mul)

len_minus = len(minus_nums)
if len_minus % 2 :
    # 홀수개 있을 경우
    # 0 이 있는 경우면 0 * -n = 0 으로 더하지 않음
    if not isZero:
        total += minus_nums[0]
    for i in range(1, len_minus, 2):
        total += minus_nums[i] * minus_nums[i+1]
else:
    for i in range(0, len_minus, 2):
        total += minus_nums[i] * minus_nums[i+1]

print(total)


# 예시
# 4
# -1
# 2
# 1
# 3
# 6

# 6
# 0
# 1
# 2
# 3
# 4
# 5
# 27

# 2
# 1
# 2
# 3

# 5
# 1
# 1
# 1
# 1
# 1
# 5

# 5
# -3
# -2
# -1
# 1
# 2
# 8