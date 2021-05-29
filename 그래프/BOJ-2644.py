# BOJ-2644.py
# 촌수계산

result = 0
def dfs(tree, visited, a, b, degree):
    global result
    if visited[a]:
        return 0
    #print(a, tree[a])
    if a == b:
        result = degree
        return 
    visited[a] = True
    for v in tree[a]:
        dfs(tree, visited, v, b, degree+1)
    

n = int(input())
a, b = map(int, input().split())
m = int(input())
tree = [[] for _ in range(n+1)]
visited = [False] * (n+1)
for _ in range(m):
    x, y = map(int, input().split()) # x 부모 - y 자식
    tree[x].append(y)
    tree[y].append(x)

dfs(tree, visited, a, b, 0)
if result > 0:
    print(result)
else:
    dfs(tree, visited, b, a, 0)
    if result > 0:
        print(result)
    else:
        print(-1)