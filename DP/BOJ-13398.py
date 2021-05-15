# BOJ-13398.py
# 연속합 2

n = int(input())
nums = list(map(int, input().split()))

# 수열에서 한 개를 제거했을때, 제거하지 않았을 때로 나누어서 푼다.
# dp[i][0] = 한 개를 제거하지 않고 i번째 까지의 가장 큰 연속합
# dp[i][1] = 한 개를 제거하고 i번째 까지의 가장 큰 연속합
dp = [[0, 0] for _ in range(n)]
dp[0][0] = nums[0]
dp[0][1] = nums[0]

answer = max(dp[0][0], dp[0][1])
for i in range(1, n):
    # 이전값이 0보다 작다면, i부터 연속합을 구한다.
    dp[i][0] = max(0, dp[i-1][0]) + nums[i]

    # 이미 한개를 제거한 수열에서 이어지는 연속합 vs 현재의 값을 제거한 연속합
    dp[i][1] = max(dp[i-1][1] + nums[i], dp[i-1][0])
    answer = max(dp[i][0], dp[i][1], answer)

print(answer)