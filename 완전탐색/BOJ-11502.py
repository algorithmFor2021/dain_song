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

def find_primes(total, count, primes):
    global target, result

    if total > target:
        return False
    if count == 3:
        if total == target:
            return True
        return False

    for p in primes:
        if find_primes(total + p, count + 1, primes):
            result.append(p)
            return True

T = int(input())
primes = get_primes(1000)

for t in range(T):
    target = int(input())
    result = []
    filtered_primes = list(filter(lambda x: x<target, primes))
    for prime in filtered_primes:
        if find_primes(prime, 1, filtered_primes):
            result.append(prime)
            break

    result.sort()
    print(' '.join(map(str, result)))