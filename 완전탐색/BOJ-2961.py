# BOJ-2961.py
# 도영이가 만든 맛있는 음식

# 재료 N개, 각 재료마다 신맛 S, 쓴맛 B
# 신맛 S = 사용한 재료의 신맛의 곱
# 쓴맛 B = 사용한 재료의 쓴맛의 합
# 신맛과 쓴맛의 차이가 작게 만드는게 목표

from sys import stdin
from itertools import combinations
input = stdin.readline
N = int(input())
food = []
for n in range(N):
    s, b = map(int, input().split())
    food.append([s, b])

min_flavor = float('inf')
for n in range(1, N+1):
    combs = list(combinations(range(N), n))
    for comb in combs:
        S = 1
        B = 0
        for c in comb:
            S *= food[c][0]
            B += food[c][1]
        flavor = abs(S - B)
        min_flavor = min(min_flavor, flavor)
        #print(comb, S, B, flavor)
        
print(min_flavor)