# BOJ-2002.py
# 추월
# FIFO, Queue를 이용
# 들어온 순서대로 추가
# 나갈때 0번째 순서가 아니면 추월한 경우이므로 카운트

N = int(input())
cars = list()
for i in range(N):
    cars.append(input())

count = 0
for i in range(N):
    car = input()
    if cars[0] == car:
        cars.pop(0)
    else:
        count += 1
        cars.remove(car)

print(count)

# 들어가는 순서 / 나가는 순서
# A B C / A B C -> 0
# A B C / B A C -> 1 [B]
# A B C / B C A -> 2 [B, C]
# A B C / C A B -> 1 [C]
# A B C / C B A -> 2 [C, B]