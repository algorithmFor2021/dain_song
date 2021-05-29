# BOJ-1647.py
# 도시 분할 계획

import heapq

def prim(node):
    heap = [] # 빠르게 최솟값을 찾기 위한 heap (리스트형태)
    visited[node] = True
    total = 0
    count = 1
    max_cost = 0

    # 해당 노드에 연결된 연결선을 추가한다.
    for a in adj[node]:
        heapq.heappush(heap, a)
       
    while heap:
        cost, node = heapq.heappop(heap) # heap 중 최소 비용의 연결을 반환
        if not visited[node]:
            print(cost, node)
            visited[node] = True
            max_cost = max(max_cost, cost)
            total += cost
            count += 1

            # 해당 노드에 연결된 연결선을 추가한다.
            for a in adj[node]:
                heapq.heappush(heap, a)
        
        # 연결선이 N개 선택된 경우 종료한다.
        if count == N:
            return total - max_cost
        
N, M = map(int, input().split())

# 인접 노드를 저장하기 위한 배열
# adj[from_node] = [weight, to_node] -> heap 구성시 weight을 우선순위로 계산
adj = [[] for _ in range(N+1)]
visited = [False]*(N+1) # MST 에서는 방문체크를 해야함 (1번만 방문)

for i in range(M):
    a, b, c = map(int, input().split())
    adj[a].append([c, b])
    adj[b].append([c, a])

print(prim(1))