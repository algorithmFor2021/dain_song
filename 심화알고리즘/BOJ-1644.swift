// 소수의 연속합
func checkPrimes(n: Int, isPrimes: inout [Bool]) {
    // 2 부터 n 까지 소수인지 확인한다.
    for i in 2...n {
        if isPrimes[i] == false { continue }
        var j = i * 2 // i 의 배수를 소수목록에서 제외한다.
        while j <= n {
            isPrimes[j] = false
            j += i // i 의 배수만 확인한다
        }
    }
}

func findSeries(n: Int, primes: [Int]) -> Int {
    // 하나 이상 연속된 소수의 합으로 자연수를 나타낼 수 있는 경우의 수 세기
    // 투 포인트 :: 일차원 배열에서 두 개의 포인트를 움직이며 체크하는 것
    var start = 0, end = 0
    var sum = 0
    var count = 0
    
    while end <= primes.count {
        if sum >= n {
            // sum 이 목표값보다 크면 start 값을 제외하고, 오른쪽으로 한칸 이동
            sum -= primes[start]
            start += 1
        } else {
            // sum 이 목표값보다 작으면 end 값을 추가하고, 오른쪽으로 한칸 이동
            if end < primes.count { sum += primes[end] }
            end += 1
        }
        if sum == n {
            // 새로 계산한 sum 값이 목표와 같으면 경우의 수 카운트
            count += 1
        }
    }
    return count
}

func BOJ_1644() {
    let N = Int(readLine()!)!
    guard N > 1 else {
        print(0)
        return
    }
    
    var isPrimes = Array(repeating: true, count: N+1)//1000001)
    checkPrimes(n: N, isPrimes: &isPrimes)
    var primes: [Int] = []
    
    for i in 2 ... N {
        if isPrimes[i] == true {
            //print(i)
            primes.append(i)
        }
    }
    print(findSeries(n: N, primes: primes))
}