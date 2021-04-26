# BOJ-10815.py
# 숫자 카드

from sys import stdin
from bisect import bisect_left, bisect_right
input = stdin.readline

def binary_search(arr, a):
    left = bisect_left(arr, a)
    right = bisect_right(arr, a)
    if left == right:
        print("0", end= " ")
    else:
        print("1", end= " ")

N = int(input())
arr1 = list(map(int, input().split()))
arr1.sort() # 이진탐색 수행시 정렬 필수

M = int(input())
arr2 = list(map(int, input().split()))

for a in arr2:
    binary_search(arr1, a)
