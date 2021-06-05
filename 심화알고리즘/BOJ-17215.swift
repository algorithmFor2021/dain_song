func addScore(_ scores: inout [Int], _ additional: inout [Int],
              _ frame: Int, _ score: Int, _ isFinal: Bool) {
    let last = 9
    if isFinal && additional.contains(1) {
        scores[last] += score
        scores[last-1] += score
        additional[last-1] -= 1
    } else if isFinal {
        scores[last] += score
    } else {
        scores[frame] += score
        for j in frame-2...frame-1 {
            if j >= 0 && additional[j] > 0 {
                scores[j] += score
                additional[j] -= 1
            }
        }
    }
}

func BOJ_17215() {
    let line = readLine()!
    var frame = 0
    let lastFrame = 9
    //var score = 0
    var i = 0
    var additional = Array(repeating: 0, count: 10)
    var scores = Array(repeating: 0, count: 10)
    var isFinal = false
    while i < line.count {
        var bowlings = 10
        // 각 프레임의 첫번째 기회
        var char = line[(line.index(line.startIndex, offsetBy: i))]
        if char == "S" {
            // 스트라이크
            addScore(&scores, &additional, frame, bowlings, isFinal)
            //print("\(frame) : Strike \(scores[frame])")

            if frame == lastFrame && !isFinal {
                isFinal = true
                frame -= 2
            } else if !isFinal {
                additional[frame] = 2 // 2번의 추가점수
            }
            i += 1
            frame += 1
            continue
        } else if char == "-" {
            // 하나도 쓰러뜨리지 못함
            addScore(&scores, &additional, frame, 0, isFinal)
        } else {
            // char 만큼 핀을 쓰러뜨림
            let pin = Int(String(char))!
            bowlings -= pin
            addScore(&scores, &additional, frame, pin, isFinal)
        }
        i += 1
        if i == line.count { break }
        // 각 프레임의 두번째 기회
        char = line[(line.index(line.startIndex, offsetBy: i))]
        if char == "P" {
            // 스페어 : 두 번째 기회까지 사용해 10개의 핀을 쓰러뜨리는 것
            addScore(&scores, &additional, frame, bowlings, isFinal)
            if frame == lastFrame && !isFinal {
                isFinal = true
                frame -= 1
            } else if !isFinal {
                additional[frame] = 1 // 1번의 추가점수
            }
        } else if char == "-" {
            addScore(&scores, &additional, frame, 0, isFinal)
        } else {
            // char 만큼 핀을 쓰러뜨림
            let pin = Int(String(char))!
            bowlings -= pin
            addScore(&scores, &additional, frame, pin, isFinal)
        }
        i += 1
        frame += 1
        //print("\(frame) : score => \(scores)")
    }
    print(scores.reduce(0, +))
}
BOJ_17215()