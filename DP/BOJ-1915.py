# BOJ-1915.py
# 가장 큰 정사각형

n, m = map(int, input().split())
array = []
for i in range(n):
    array.append(list(map(int, input().rstrip())))

# 아래&오른쪽으로 이동하면서 정사각형의 크기를 세서 배열의 값을 계산
# 최상단 & 좌측은 제외 (무조건 기존값 0 or 1)
for y in range(1, n):
    for x in range(1, m):
        # 대각선위, 좌측, 상단의 배열은 이미 정사각형의 값이 더해져있는 상태
        if array[y][x] == 1:
            # 현재좌표 기준 정사각형 배열 중 가장 작은 값에 1을 더함
            array[y][x] += min(array[y-1][x-1], array[y-1][x], array[y][x-1])

print(array)

max_d = 0
for row in array:
    max_d = max(max_d, max(row))
print(max_d*max_d)


# 예시       
# 5 5   ->  [y][x] 기준 최대 정사각형의 길이 -> 이 값중 최대값!
# 11111     11111  
# 11111     12222
# 11011     12012
# 11111     12112
# 11111     12222