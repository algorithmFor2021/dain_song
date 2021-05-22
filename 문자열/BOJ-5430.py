# BOJ-5430.py
# AC
# R : 배열의 순서 뒤집기
# D : 첫번째 숫자 버리기 (배열 비어있는 경우 에러)
# 시간초과를 고려해야함

def operateAC(p_list, n, nums):
    is_reverse = False
    for p in p_list:
        if p == 'R':
            is_reverse = not is_reverse
        elif p == 'D':
            if is_reverse:
                nums.pop()
            else:
                nums.pop(0)
    if is_reverse:
        nums.reverse()
    return "[{}]".format(','.join(nums))

T = int(input()) # 테스트 케이스
for _ in range(T):
    p_list = input() # 수행할 함수
    n = int(input()) # 배열의 길이
    nums = input()[1:-1].split(',')
    
    # RR 연속으로 나오는 경우 무시
    p_list = p_list.replace('RR', '') 
    # error 가 발생하는 경우 미리 확인
    if p_list.count('D') > n:
        print("error")
    else:
        print(operateAC(p_list, n, nums))
    