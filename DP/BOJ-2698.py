# BOJ-2698.py
# 인접한 비트의 개수
# n개의 수열(비트 0or1), 인접한 비트의 개수 k < n

N = 101
series = [[[0, 0] for k in range(N)] for n in range(N)]
series[1][0][0] = 1 # n=1, k=0, 마지막자리 0 -> 하나
series[1][0][1] = 1 # n=1, k=0, 마지막자리 1 -> 하나

for n in range(2, N):
    for k in range(n):
        series[n][k][0] = series[n-1][k][0] + series[n-1][k][1]
        if k > 0:
            series[n][k][1] = series[n-1][k][0] + series[n-1][k-1][1]
        else:
            series[n][k][1] = series[n-1][k][0]


n = int(input())
for _ in range(n):
    n, k = map(int, input().split())
    print(series[n][k][0] + series[n][k][1])
