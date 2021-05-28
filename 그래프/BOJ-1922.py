# BOJ-1922.py
# 힙 :: 특정한 규칙을 가지는 트리
# 최댓값과 최솟값을 찾는 연산을 빠르게 하기 위해 고안된 완전 이진트리를 기본으로 한다.

# 파이썬 heapq 모듈은 heapq (priority queue) 알고리즘을 제공한다.
# heapq.heappush(heap, item) : item 을 heap 에 추가
# heapq.heappop(heap) : heap 에서 가장 작은 원소를 pop 해서 리턴
# 힙에 원소를 추가할 때 (item1, item2) 형태로 넣어주면, 첫번째 원소를 우선순위로 힙을 구성한다.

import heapq

def prim(node):
    heap = [] # 빠르게 최솟값을 찾기 위한 heap (리스트형태)
    visited[node] = True
    total = 0
    count = 1

    # 해당 노드에 연결된 연결선을 추가한다.
    for a in adj[node]:
        heapq.heappush(heap, a)
       
    while heap:
        cost, node = heapq.heappop(heap) # heap 중 최소 비용의 연결을 반환
        if not visited[node]:
            visited[node] = True
            total += cost
            count += 1

            # 해당 노드에 연결된 연결선을 추가한다.
            for a in adj[node]:
                heapq.heappush(heap, a)
        
        # 연결선이 N개 선택된 경우 종료한다.
        if count == N:
            return total
        
N = int(input())
M = int(input())

# 인접 노드를 저장하기 위한 배열
# adj[from_node] = [weight, to_node] -> heap 구성시 weight을 우선순위로 계산
adj = [[] for _ in range(N+1)]
visited = [False]*(N+1) # MST 에서는 방문체크를 해야함 (1번만 방문)

for i in range(M):
    a, b, c = map(int, input().split())
    adj[a].append([c, b])
    adj[b].append([c, a])

print(prim(1))