//
//  ReverseNodesInKGroup.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 21/06/26.
//

import Foundation

// MARK: - LeetCode 25: Reverse Nodes in k-Group

/*
 Problem:

 Given the head of a linked list
 and an integer k,

 reverse the nodes of the list
 k at a time and return
 the modified list.

 If the number of nodes left
 is less than k,

 leave them as they are.

 You may not alter
 node values.

 Only node connections
 can be changed.

 Example 1:

 Input:

 head = [1,2,3,4,5]
 k = 2

 Output:

 [2,1,4,3,5]

 Example 2:

 Input:

 head = [1,2,3,4,5]
 k = 3

 Output:

 [3,2,1,4,5]

 Approach (Iterative):

 - Create a dummy node
   before the head.

 - For each group:

   1. Check whether
      k nodes exist.

   2. Reverse exactly
      k nodes.

   3. Connect the
      reversed group
      back to the list.

 - Move to the next group
   and repeat.

 Why Dummy Node?

 It simplifies handling
 the first group because
 the head changes after
 reversal.
 */

// MARK: - ListNode

public class ListNode {

    public var val: Int
    public var next: ListNode?

    public init() {
        self.val = 0
        self.next = nil
    }

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

// MARK: - Main Solution

func reverseKGroup(
    _ head: ListNode?,
    _ k: Int
) -> ListNode? {

    guard k > 1 else {
        return head
    }

    let dummy = ListNode(0)
    dummy.next = head

    var groupPrev: ListNode? = dummy

    while true {

        var kth = groupPrev

        for _ in 0..<k {
            kth = kth?.next

            if kth == nil {
                return dummy.next
            }
        }

        let groupNext = kth?.next

        var prev = groupNext
        var curr = groupPrev?.next

        for _ in 0..<k {

            let temp = curr?.next

            curr?.next = prev

            prev = curr
            curr = temp
        }

        let oldGroupStart = groupPrev?.next

        groupPrev?.next = prev

        groupPrev = oldGroupStart
    }
}

// MARK: - Time and Space Complexity

/*
 Let:

 n = number of nodes

 Time Complexity:

 O(n)

 Each node is processed
 once during reversal.

 Space Complexity:

 O(1)

 Only a few pointers
 are used.
 */

// MARK: - Dry Run

/*
 Input:

 1 -> 2 -> 3 -> 4 -> 5

 k = 2

 ----------------------------------------

 Initial

 dummy -> 1 -> 2 -> 3 -> 4 -> 5

 groupPrev = dummy

 ----------------------------------------

 First Group

 1 -> 2

 Reverse

 2 -> 1

 Connect

 dummy -> 2 -> 1 -> 3 -> 4 -> 5

 groupPrev = 1

 ----------------------------------------

 Second Group

 3 -> 4

 Reverse

 4 -> 3

 Connect

 dummy -> 2 -> 1 -> 4 -> 3 -> 5

 groupPrev = 3

 ----------------------------------------

 Remaining Nodes

 Only node 5 remains.

 Less than k nodes.

 Stop.

 ----------------------------------------

 Return

 2 -> 1 -> 4 -> 3 -> 5

 Output:

 [2,1,4,3,5]
 */
