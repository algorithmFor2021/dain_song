# BOJ-4485.py
# 녹색 옷 입은 애가 젤다지?
import heapq

def shortest_path(graph, visited, N):
    dy = [-1, 1, 0, 0]
    dx = [0, 0, -1, 1]
    heap = [] # 최솟값을 찾기 위해 heapq 에 이용할 리스트
    
    # 첫번째 노드 값 저장
    y, x = 0, 0
    dist[y][x] = graph[y][x]
    heapq.heappush(heap, [graph[y][x], y, x])

    while heap:
        # 최소 비용의 y, x 를 꺼낸다.
        cost, y, x = heapq.heappop(heap)
        for i in range(4):
            # 동굴의 상하좌우로 이동한다.
            ny, nx = y + dy[i], x + dx[i]
            # 좌표의 범위내에 있는 경우 비용을 비교한다.
            if 0 <= nx < N and 0 <= ny < N:
                ncost = graph[ny][nx]
                # 기존에 계산했던 비용이 새로 계산한 비용보다 크면, 
                # 최소비용으로 변경하고 heap 에 추가한다. 
                if dist[ny][nx] > dist[y][x] + ncost:
                    dist[ny][nx] = dist[y][x] + ncost
                    heapq.heappush(heap, [dist[ny][nx], ny, nx])

    return dist[N-1][N-1]

n = 1
N = int(input())
while N:
    graph = [] # 좌표의 비용을 저장한다
    dist = [] # 좌표까지의 최소비용을 저장한다. 초기값 'inf'
    for _ in range(N):
        graph.append(list(map(int, input().split())))
        dist.append([float('inf')] * N)

    result = shortest_path(graph, dist, N)
    print("Problem {}: {}".format(n, result))
    N = int(input()) # next
    n += 1