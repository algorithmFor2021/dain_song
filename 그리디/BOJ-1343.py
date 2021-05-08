# BOJ-1343.py
# 폴리오미노

board = list(input())
board_x4 = ['X'] * 4
board_x2 = ['X'] * 2
board_a = ['A'] * 4
board_b = ['B'] * 2

i = 0
result = []
while i < len(board):
    if board[i] == '.':
        result.append('.')
        i += 1
        continue
    elif board[i] == 'X':
        if board[i:i+4] == board_x4:
            result.extend(board_a)
            i += 4
        elif board[i:i+2] == board_x2:
            result.extend(board_b)
            i += 2
        else:
            print(-1)
            break

if i == len(board):
    print(''.join(map(str, result)))