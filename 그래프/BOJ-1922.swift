// BOJ 1922 네트워크연결 - 그래프 MST 


func getParent(_ parent: inout [Int], _ x: Int) -> Int {
    if parent[x] == x { return x }
    parent[x] = getParent(&parent, parent[x])
    return parent[x]
}

func unionParent(_ parent: inout [Int], _ a: Int, _ b: Int) {
    let parentA = getParent(&parent, a)
    let parentB = getParent(&parent, b)
    if parentA < parentB {
        parent[parentB] = parentA
    } else {
        parent[parentA] = parentB
    }
}

func findParent(_ parent: inout [Int], _ a: Int, _ b: Int) -> Bool {
    let parentA = getParent(&parent, a)
    let parentB = getParent(&parent, b)
    return parentA == parentB
}

let n = Int(readLine()!)! // 컴퓨터의 수
let m = Int(readLine()!)! // 연결할 수 있는 선의 수
var parent = [Int]()
for i in 0...n {
    parent.append(i)
}

typealias Edge = (a: Int, b: Int, cost: Int)
var edges = [Edge]()
for _ in 1...m {
    let line = readLine()!.split(separator: " ").map({Int(String($0))!})
    edges.append(Edge(line[0], line[1], line[2]))
}
edges.sort(by: { $0.cost < $1.cost })

var connectCost = 0
for (a, b, cost) in edges {
    if findParent(&parent, a, b) == false {
        unionParent(&parent, a, b)
        connectCost += cost
    }
}
print(connectCost)