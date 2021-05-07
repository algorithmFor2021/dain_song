# BOJ-1092.py
# ㅂㅐ

def find_times(boxes, cranes):
    if cranes[0] < boxes[0]:
        return -1

    count = 0
    while boxes:
        count += 1
        for crane in cranes:
            # 현재 크레인보다 작은 박스중 가장 큰 값을 담기
            for i in range(len(boxes)):
                # 역순으로 정렬되어 있으므로 break 하게되면 가장 큰값만 빠르게 제거
                if boxes[i] <= crane:
                    boxes.pop(i)
                    break
    return count

N = int(input())
cranes = list(map(int, input().split()))
cranes.sort(reverse=True)

M = int(input())
boxes = list(map(int, input().split()))
boxes.sort(reverse=True)

print(find_times(boxes, cranes))