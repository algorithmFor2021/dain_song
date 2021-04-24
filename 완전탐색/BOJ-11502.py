# BOJ-11502.py
# 세 개의 소수 문제

# 소수 구하는 법 "에라토스테네스의 체" 참고
def get_primes(n):
    a = [False,False] + [True]*(n-1)
    primes=[]

    for i in range(2,n+1):
        if a[i]:
            primes.append(i)
            for j in range(2*i, n+1, i):
                a[j] = False
    return primes

def find_primes(target, primes):
    for x in primes:
        total = 0
        for y in primes:
            for z in primes:
                total = x + y + z
                if total == target:
                    print(x, y, z)
                    return

T = int(input())
primes = get_primes(1000)

for t in range(T):
    target = int(input())
    filtered_primes = list(filter(lambda x: x<target, primes))
    find_primes(target, filtered_primes)
