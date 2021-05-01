# BOJ-1654.py
# 랜선 자르기

K, N = map(int, input().split())
array = []
for _ in range(K):
    array.append(int(input()))

left, right = 1, max(array)
while left <= right:
    mid = (left + right) // 2
    total = 0

    for a in array:
        total += a // mid

    if total >= N:
        left = mid + 1
        answer = mid
    else:
        right = mid - 1

print(answer)