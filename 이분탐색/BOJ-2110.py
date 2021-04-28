# BOJ-2110.py
# 공유기 설치
# 집의 좌표 (0 ≤ xi ≤ 1,000,000,000) 이므로 이분 탐색 이용해야함! 이분탐색 log(2)N
# 공유기 사이의 거리를 이진 탐색을 통해 구한다.

from sys import stdin
input = stdin.readline
N, C = map(int, input().split())
houses = []
for n in range(N):
    houses.append(int(input()))

# 이진탐색을 수행하기 위해서 정렬을 먼저 해야함
houses.sort()

# mid = 공유기 사이의 거리
# 집과 집사이의 거리마다 비교한다.

left = 0
right = houses[-1]-houses[0]
while(left <= right):
    mid = (left + right) // 2
    installed = houses[0]
    count = 1

    print(left, right, mid)
    for house in houses:
        if house >= installed + mid:
            print("house->", house)
            installed = house
            count += 1
    print("=>", count)

    # left, right 조건문 비교 / 결과값 left, right 헷갈리는 것 고민하기
    # 공유기 개수보다 많이 설치한 경우 -> mid 가 작음 -> 오른쪽 범위에서 탐색
    # 공유기 개수보다 더 적게 설치한 경우 -> mid 가 너무 큼 -> 왼쪽 범위에서 탐색
    if count >= C:
        left = mid + 1
    else:
        right = mid - 1
 
print(right)