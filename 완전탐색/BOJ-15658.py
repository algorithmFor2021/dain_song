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
ADD, SUB, MUL, DIV = 0, 1, 2, 3

def get_operator(ops):
    operators = []
    for i, op in enumerate(ops):
        operators.extend([i] * op)
    operators = list(permutations(operators, N-1))
    return operators

operators = get_operator(ops)

max_num = float('-inf')
min_num = float('inf')
for ops in operators:
    total = nums[0]
    #print(ops)
    for i, num in enumerate(nums[1:]):
        if ops[i] == ADD:
            total += num
        elif ops[i] == SUB:
            total -= num
        elif ops[i] == MUL:
            total *= num
        elif ops[i] == DIV:
            total //= num
    max_num = max(max_num, total)
    min_num = min(min_num, total)
    #print(nums, ops, total)
    
        
print(max_num)
print(min_num)