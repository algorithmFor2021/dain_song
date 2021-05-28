# BOJ-11779.py
# 최소비용 구하기2

import heapq
import copy

def shortest_path(graph, dist, start, end):
    # 최소비용을 구하기 위해 heapq (priority queue) 와 함께 사용할 heap 리스트
    heap = []

    # 시작 노드의 인접 노드들을 heap 에 추가. 시작위치의 비용은 0
    node = start
    dist[start] = 0
    heapq.heappush(heap, [0, node])

    # 경로를 저장하기 위한 배열
    path = [[] for _ in range(n + 1)]

    while heap:
        # 최단거리의 노드를 꺼낸다.
        cost, node = heapq.heappop(heap)
        # 현재까지 계산된 최단거리보다 크다면 진행하지않음
        if dist[node] < cost:
            continue

        # 최단거리가 갱신되는 경우, 경로에 자기자신 추가 (이전경로 + 자기자신)
        path[node].append(node)

        # 현재 노드가 end 와 같다면 종료한다.
        if node == end:
            print(dist[end]) # 최소비용
            print(len(path[node])) # 경로의 개수
            print(' '.join(map(str, path[node]))) # 경로 순서대로 출력
            return

        # 현재 노드와 연결된 인접 노드를 반복한다. 
        for new_cost, new_node in graph[node]:
            # 현재 노드의 비용 + 인접 노드로 이동비용이 기존 인접 노드 최소비용보다 작다면 
            # 인접 노드의 최소 비용 값(dist[new_node])을 바꾸고, heap 에 추가하고, 현재 까지의 경로를 복사한다.
            if dist[new_node] > new_cost + cost:
                dist[new_node] = new_cost + cost
                heapq.heappush(heap, [dist[new_node], new_node])
                path[new_node] = copy.deepcopy(path[node])


n = int(input())
m = int(input())
graph = [[] for _ in range(n+1)] # 연결된 버스 -- 인접 노드 그래프
dist = [float('inf')] * (n+1) # 노드에 대한 최소 비용

for _ in range(m):
    a, b, cost = map(int, input().split())
    graph[a].append([cost, b])

start, end = map(int, input().split())
shortest_path(graph, dist, start, end)
