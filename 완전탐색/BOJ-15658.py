# BOJ-15658.py
# 연산자 끼워넣기(2)

# N개의 수와 연산자가 주어졌을 때, 만들 수 있는 식의 결과가 최대 / 최소인 것을 구하기
# 주어진 수의 순서를 바꾸면 안된다.

from sys import stdin
from itertools import permutations
input = stdin.readline

N = int(input())
nums = list(map(int, input().split()))
ops = list(map(int, input().split()))
max_num = float('-inf')
min_num = float('inf')

def dfs(nums, i, add, sub, mul, div, total):
    global N, max_num, min_num
    i += 1
    if i == N:
        # 초기화
        i = 0
        add, sub, mul, div = ops[0], ops[1], ops[2], ops[3]
        # 계산 값과 최대/최소 값비교 
        max_num = max(max_num, total)
        min_num = min(min_num, total)
        return
        
    if add > 0:
        dfs(nums, i, add-1, sub, mul, div, total+nums[i])
    if sub > 0:
        dfs(nums, i, add, sub-1, mul, div, total-nums[i])
    if mul > 0:
        dfs(nums, i, add, sub, mul-1, div, total*nums[i])
    if div > 0:
        if total < 0:
            total = (abs(total) // nums[i]) * (-1)
        else:
            total = total // nums[i]
        dfs(nums, i, add, sub, mul, div-1, total)
    else:
        return

dfs(nums, 0, ops[0], ops[1], ops[2], ops[3], nums[0])
print(max_num)
print(min_num)