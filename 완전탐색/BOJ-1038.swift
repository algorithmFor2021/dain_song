struct BOJ_1038 {
    
    var decreasingNumbers: [Int] = []
    
    /// j 번째 자리의 값을 채워가며 number 배열을 완성하는 함수, i 번째 자리까지 다 차면 decreasingNumbers 에 추가한다.
    mutating func dfs(_ i: Int, _ j: Int, number: [Int]) {
        // i 는 숫자의 자리수, j 는 현재까지 채워진 자리수
        if j >= i {
            let intNumber = number.reduce(0, {$0*10 + $1})
            decreasingNumbers.append(intNumber)
            return
        }
        for k in (0..<number[j]).reversed() {
            var newNumber = number
            newNumber[j+1] = k
            dfs(i, j+1, number: newNumber)
        }
    }
    
    /// N 번째 감소하는 수를 찾는 함수
    mutating func findDecreasingNumbers(_ N: Int) {
        // i 는 숫자의 자리수, num 은 0번재 숫자로 지정할 값
        for i in 0...9 {
            for num in 0...9 {
                var number = Array(repeating: 0, count: i+1)
                number[0] = num
                dfs(i, 0, number: number)
            }
        }
        decreasingNumbers.sort()
        if N >= decreasingNumbers.count {
            print(-1)
        } else {
            print(decreasingNumbers[N])
        }
    }

    mutating func run() {
        let N = Int(readLine()!)!
        findDecreasingNumbers(N)
    }
}
//var boj = BOJ_1038()
//boj.run()
