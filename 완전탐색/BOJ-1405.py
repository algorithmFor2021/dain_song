# BOJ-1405.py
# 미친로봇

# E 동 W 서 N 북 S 남
dy = [0, 0, -1, 1]
dx = [1, -1, 0, 0]
visited = [[False] * 29 for _ in range(29)]
num, E, W, N, S = map(int, input().split())
probs = [E/100, W/100, N/100, S/100]
total = 0

def dfs(num, y, x, p):
    global total, probs
    if num == 0:
        total += p
        return

    visited[y][x] = True
    for i in range(4):
        ny, nx = y+dy[i], x+dx[i]
        if not visited[ny][nx]:
            dfs(num-1, ny, nx, p * probs[i])
    visited[y][x] = False

dfs(num, 14, 14, 1)
print(total)