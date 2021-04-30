# BOJ-2805.py
# 나무 자르기

N, M = map(int, input().split())
trees = list(map(int, input().split()))

left = 0
right = max(trees)
result = 0
while left <= right:
    # mid : 절단기에 설정할 수 있는 높이
    mid = (left + right) // 2
    total = 0
    # print(left, right, mid)

    # 단순 for문은 시간초과
    total = sum([x-mid for x in trees if x > mid])
    
    # 적어도 M미터의 나무를 가져가야함
    if total >= M:
        left = mid + 1
        result = mid
    elif total < M:
        right = mid - 1

print(result)

""" 
반례1 (mid = 7)
1 10
17

반례2 (mid = 1)
6 1
0 2 0 0 0 2

반례3 (mid = 0)
2 3 
2 2
"""