func BOJ_19539() {
    let _ = Int(readLine()!)!
    let array = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    // 전체 성장 합이 3으로 나눠떨어저야 2개의 물뿌리개를 전부 사용한 것이다.
    let total = array.reduce(0, +) // 사과나무의 전체 성장 합
    if total % 3 != 0 {
        print("NO")
        return
    }
    
    // 물뿌리개 2개짜리를 최소 몇개 사용했는지 비교하기
    // 2성장 물뿌리개는 1+2물뿌리개 사용횟수(total/3)보다 크거나 같아야한다.
    var count = 0
    for a in array {
        count += a / 2
    }
    if count < total / 3 {
        print("NO")
    } else {
        print("YES")
    }
}
//BOJ_19539()