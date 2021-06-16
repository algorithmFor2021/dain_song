/// 두개의 스택으로 큐 구현 - applebuddy 님 풀이 참고
struct DoubleStackQueue<T:Comparable> {
    
    var leftStack = [T]() // left 는 마지막 값이 가장 먼저 pop 될 값. [n .. n-1 .. 0]
    var rightStack = [T]() // right 는 맨 처음 값이 가장 먼저 pop 될 값 [0 .. 1 .. n]
    
    /// rightStack 에 push 한다.
    mutating func push(_ value: T) {
        rightStack.append(value) // 시간복잡도 O(1)
    }
    
    mutating func pop() -> T? {
        if leftStack.isEmpty { // 왼쪽스택이 비어있는 경우에만 반전시킨다.
            leftStack = rightStack.reversed() // 시간복잡도 O(n)
            rightStack.removeAll()
        }
        return leftStack.removeLast() // 시간복잡도 O(1)
    }
    
    mutating func front() -> T? {
        return leftStack.isEmpty ? rightStack.first : leftStack.last
    }
    
    func isEmpty() -> Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
}

func solve() {
    
    let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = NM[0], M = NM[1]
    
    var indegree = Array(repeating: 0, count: N+1) // 진입차수 0으로 초기화
    var graph = Array(repeating: [Int](), count: N+1) // graph[i] = 노드 i에서 이동가능한 노드들
    var semester = Array(repeating: 1, count: N+1) // semester[i] = i번째 수업이 수강가능한 학기
    
    for _ in 1...M {
        let line = readLine()!.split(separator: " ").map{Int(String($0))!}
        let a = line[0], b = line[1]
        graph[a].append(b)
        indegree[b] += 1
    }
    
    // 진입차수가 0인 노드를 큐에 추가
    var queue = DoubleStackQueue<Int>()
    for i in 1...N {
        if indegree[i] == 0 {
            queue.push(i)
        }
    }
    
    // 큐가 빌 때까지 반복 => 모든 노드를 방문하도록
    while !queue.isEmpty() {
        let node = queue.pop()!
        for nextNode in graph[node] {
            indegree[nextNode] -= 1 // 진입차수 감소
            semester[nextNode] = semester[node] + 1 // 현재노드의 다음학기에 수강
            if indegree[nextNode] == 0 {
                queue.push(nextNode) // 진입차수가 0인 노드를 큐에 추가
            }
        }
    }
    
    var answer = ""
    for i in 1...N {
        answer.append("\(semester[i]) ")
    }
    print(answer)
}

solve()