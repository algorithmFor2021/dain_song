# BOJ-1477.py
# 휴게소 세우기

# 휴게소 N개 + M개 더 짓기
# 휴게소가 없는 구간의 길이의 최댓값을 최소로 하려고 한다.
# 휴게소 사이 거리(휴게소가 없는 구간의 길이)를 이진탐색을 통해 구한다.

N, M, L = map(int, input().split())
places = list(map(int, input().split()))
places.extend([0, L]) # 시작과 끝 지점을 추가한다.
places.sort()

left = 0
right = L
while(left <= right):
    total = 0
    mid = (left + right) // 2

    for i in range(1, N+2):
        diff = places[i] - places[i-1]
        # 세울 수 있는 휴게소 세기
        # diff : 휴게소간 거리, mid : 새로 세울 휴게소간 거리
        if diff > mid:
            total += (diff - 1) // mid
    
    print(left, right, mid, total)
    # 세울 수 있는 휴게소보다 더 많이 생긴 경우
    if total > M:
        left = mid + 1
    # 세울 수 있는 휴게소보다 더 적거나 같은 경우
    # 같은 경우에도 최소값을 찾기 위해 구간을 줄인다.
    else:
        right = mid - 1
    
# left 가 right 보다 커지면 반복을 종료하므로, left 가 최종값이다. 
print(left)