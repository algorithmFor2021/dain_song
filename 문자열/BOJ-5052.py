# BOJ-5052.py
# 전화번호 목록
# 풀이1 (정렬)
# 전화번호 정렬시, 해당 번호에 접두어 전화번호에 있다면 바로앞에 배치됨
# => 전화번호를 반복하며, 바로 앞 번호로 현재 번호가 시작되는지 확인한다.
# 풀이2 (트라이 알고리즘 - 정리예정)
# 문자열을 트리형태로 저장 

def check_number(nums):
    for i in range(1, len(nums)):
        if nums[i].startswith(nums[i-1]):
            return "NO"
    return "YES"

t = int(input())
for _ in range(t):
    nums = []
    n = int(input())
    for _ in range(n):
        nums.append(input())
    
    nums.sort()
    print(check_number(nums))
