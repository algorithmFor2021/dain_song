// BOJ 1647 도시 분할 계획 - 그래프 MST 

/// 노드 x 의 최상단 부모를 찾는 함수
func getParent(_ parent: inout [Int], _ x: Int) -> Int {
    if parent[x] == x { return x }
    parent[x] = getParent(&parent, parent[x])
    return parent[x]
}

/// a, b 의 parent 를 합치는 함수 - 일반적으로 작은 값으로 설정
func unionParent(_ parent: inout [Int], _ a: Int, _ b: Int) {
    let a = getParent(&parent, a)
    let b = getParent(&parent, b)
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}

/// a, b 가 같은 부모를 가지는지 확인하는 함수 - 같은 그룹인지
func findParent(_ parent: inout [Int], _ a: Int, _ b: Int) -> Bool {
    let a = getParent(&parent, a)
    let b = getParent(&parent, b)
    return a == b
}

// Input
let line = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = line[0], m = line[1]

typealias Edge = (a: Int, b: Int, cost: Int)
var edges = [Edge]()
for _ in 1...m {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    edges.append(Edge(a: line[0], b: line[1], cost: line[2]))
}
edges.sort(by: { $0.cost < $1.cost }) // 경로가 여러개일수 있으므로 오름차순 정렬

// 유니온파인드로 경로 연결하면서 비용 계산하기
var parent = [Int]()
for i in 0...n {
    parent.append(i)
}
var connectCost = 0
var maxCost = 0
for (a, b, cost) in edges {
    if findParent(&parent, a, b) == false {
        unionParent(&parent, a, b)
        connectCost += cost
        maxCost = cost
    }
}
// 가장 비용이 큰 경로를 제외하기
print(connectCost - maxCost)