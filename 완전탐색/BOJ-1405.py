# BOJ-1405.py
# 미친로봇

# E 동 W 서 N 북 S 남
directions = (
    (0, 1, 1, 0, 0, 0),
    (0, -1, 0, 1, 0, 0),
    (-1, 0, 0, 0, 1, 0), 
    (1, 0, 0, 0, 0, 1))

def dfs(num, y, x, e, w, n, s):
    global total, probs
    if x < 0 or x > 29 or y < 0 or y > 29:
        return False

    if num == 0:
        p = pow(probs[0], e) * pow(probs[1], w) * pow(probs[2], n) * pow(probs[3], s)
        total += p
        return True

    visited[y][x] = True
    for d in directions:
        ny, nx = y+d[0], x+d[1]
        if visited[ny][nx]:
            continue
        dfs(num-1, ny, nx, e+d[2], w+d[3], n+d[4], s+d[5])
    visited[y][x] = False


visited = []
for _ in range(29):
    visited.append([False] * 29)

num, E, W, N, S = map(int, input().split())
probs = [E/100, W/100, N/100, S/100]
total = 0
dfs(num, 14, 14, 0, 0, 0, 0)
print(total)