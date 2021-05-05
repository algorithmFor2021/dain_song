# BOJ-2529.py
# 부등호

k = int(input())
marks = input().split()

nums = [False] * 10
min_num = '9876543210'
max_num = '0123456789'

def dfs(i, nums, num, total):
    global min_num, max_num, marks, k

    if i == k:
        min_num = min(min_num, total)
        max_num = max(max_num, total)
        return
    
    nums[num] = True
    for n in range(10):
        # 아직 선택되지 않은 숫자인 경우에만 진행
        if nums[n]:
            continue
        if marks[i] == '<' and num < n:
            dfs(i+1, nums, n, total + str(n))            
        elif marks[i] == '>' and num > n:
            dfs(i+1, nums, n, total + str(n))
    nums[num] = False

for n in range(10):
    dfs(0, nums, n, str(n))

print(max_num)
print(min_num)