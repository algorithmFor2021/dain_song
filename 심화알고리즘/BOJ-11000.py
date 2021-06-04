# BOJ-11000.py
# 강의실 배정

import heapq

N = int(input())
lessons = [] 
# 수업 시간을 입력받은 후, 시작 시간 기준으로 정렬
for _ in range(N):
    lessons.append(list(map(int, input().split())))
lessons.sort(key = lambda x: x[0])

# 정렬된 수업을 반복하며 끝나는 시간을 힙에 추가한다.
heap = []
for lesson in lessons:
    # 힙에 있는 끝나는 시간보다 현재 수업이 시작하는 시간이 크거나 같으면
    # 기존의 힙에 있는 끝나는 시간을 제외하고, 새로운 값으로 갱신한다.
    # 기존 끝나는 시간보다 작다면, 제외하지 않고 여러개의 값이 존재한다. 
    if heap and heap[0] <= lesson[0]:
        heapq.heappop(heap)
    heapq.heappush(heap, lesson[1])
    
# 힙의 요소 개수는 강의실 개수를 의미함.
print(len(heap))

