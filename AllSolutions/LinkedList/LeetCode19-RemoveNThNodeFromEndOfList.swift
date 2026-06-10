//
//  RemoveNthNodeFromEndOfList.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 10/06/26.
//

import Foundation

// MARK: - Definition for singly-linked list.

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

// MARK: - LeetCode 19: Remove Nth Node From End of List

/*
 Problem:

 Given the head of a linked list,
 remove the nth node from the end of the list
 and return its head.

 Example:

 Input:
 head = [1,2,3,4,5]
 n = 2

 Output:
 [1,2,3,5]

 Approach:

 Use the Two Pointer technique.

 1. Create a dummy node before head.
    This helps handle deletion of the first node.

 2. Keep two pointers:
      - fast
      - slow

 3. Move fast pointer n + 1 steps ahead.

 4. Move both pointers together until
    fast reaches the end.

 5. slow will now be just before
    the node to remove.

 6. Skip the target node by changing pointers.

 7. Return dummy.next.
 */

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {

    // Dummy node simplifies edge cases
    let dummy = ListNode(0, head)

    var fast: ListNode? = dummy
    var slow: ListNode? = dummy

    // Move fast pointer n + 1 steps ahead
    for _ in 0...n {
        fast = fast?.next
    }

    // Move both pointers together
    while fast != nil {
        fast = fast?.next
        slow = slow?.next
    }

    // Remove nth node
    slow?.next = slow?.next?.next

    return dummy.next
}

// MARK: - Time and Space Complexity

/*
 Time Complexity:

 O(L)

 L = Number of nodes

 - One traversal of the linked list.

 Space Complexity:

 O(1)

 - Only pointers are used.
 */

// MARK: - Dry Run

/*
 Input:

 head = [1,2,3,4,5]

 n = 2

 --------------------------------------------------

 Initial Linked List:

 dummy -> 1 -> 2 -> 3 -> 4 -> 5

 fast = dummy
 slow = dummy

 --------------------------------------------------

 Step 1:
 Move fast (n + 1 = 3 steps)

 Move 1:
 fast -> 1

 Move 2:
 fast -> 2

 Move 3:
 fast -> 3

 Current:

 dummy -> 1 -> 2 -> 3 -> 4 -> 5
           ^
         slow

                    ^
                  fast

 --------------------------------------------------

 Step 2:
 Move both together

 Move 1:

 slow -> 1
 fast -> 4

 --------------------------------------------------

 Move 2:

 slow -> 2
 fast -> 5

 --------------------------------------------------

 Move 3:

 slow -> 3
 fast -> nil

 Stop.

 slow is just before
 the node to delete.

 --------------------------------------------------

 Step 3:

 slow.next = slow.next.next

 Before:

 3 -> 4 -> 5

 After:

 3 ------> 5

 --------------------------------------------------

 Final Linked List:

 1 -> 2 -> 3 -> 5

 Return:

 [1,2,3,5]
 */
