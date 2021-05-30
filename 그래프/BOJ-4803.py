# BOJ-4803.py
# 트리

import sys
input = sys.stdin.readline

def dfs(prev, node, graph, visited):
    visited[node] = True
    for next_node in graph[node]:
        if next_node == prev:
            continue
        if visited[next_node]:
            return False
        if not dfs(node, next_node, graph, visited):
            return False
    return True

i = 1
n, m = map(int, input().split())
while n + m != 0:
    graph = [[] for _ in range(n+1)]
    visited = [False] * (n+1)
    for _ in range(m):
        a, b = map(int, input().split())
        graph[a].append(b)    
        graph[b].append(a)

    t = 0
    for v in range(1, n+1):
        if not visited[v]:
            if dfs(0, v, graph, visited):
                t += 1
    if t == 0:
        print("Case {}: No trees.".format(i))
    elif t == 1:
        print("Case {}: There is one tree.".format(i))
    else:
        print("Case {}: A forest of {} trees.".format(i, t))

    n, m = map(int, input().split())
    i += 1