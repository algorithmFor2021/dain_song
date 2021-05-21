# BOJ-14725.py
# 개미굴
# 트리구조? Trie 트리

class Node:
    # key - 노드의 키, data : 전체 문자열
    # depth - 노드의 깊이(출력을 위함), children : 자식 노드 딕셔너리
    def __init__(self, key, data=None):
        self.key = key
        self.data = data
        self.depth = 0
        self.children = {}

class Trie:
    def __init__(self):
        self.head = Node(None)
    
    def insert(self, string):
        current_node = self.head
        depth = 0
        for s in string.split(' '):
            # 새로운 문자가 노드의 하위에 없는 경우, 딕셔너리를 생성
            if s not in current_node.children:
                current_node.children[s] = Node(s)
            # 현재 노드를 변경
            current_node = current_node.children[s]
            current_node.depth = depth
            depth += 1
        # 하단 노드에 전체 문자열을 저장
        current_node.data = string

    def traversal(self, current_node):
        # 데이터가 있으면, 마지막 노드임을 뜻하므로 순환종료.
        if current_node.data:
            return
        # 사전순으로 시각화된 구조 출력
        children = sorted(current_node.children.keys()) 
        for c in children:
            depth = current_node.children[c].depth
            print('--'*depth, end='')
            print(c)
            self.traversal(current_node.children[c])

N = int(input())
trie = Trie()
for _ in range(N):
    data = input().split()
    data = ' '.join(data[1:])
    trie.insert(data)

trie.traversal(trie.head)