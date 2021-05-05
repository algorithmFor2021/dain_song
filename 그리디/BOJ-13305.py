# BOJ-13305.py
# 주유소

N = int(input())
length = list(map(int, input().split()))
length.append(0)
prices = list(map(int, input().split()))

cost = 0
min_price = max(prices)
for i in range(N):
    min_price = min(min_price, prices[i])
    cost += length[i] * min_price

print(cost)
