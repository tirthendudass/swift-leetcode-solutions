//
//  MergeTwoSortedLists.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 12/06/26.
//

import Foundation

// MARK: - LeetCode 21: Merge Two Sorted Lists

/*
 Problem:

 You are given the heads of two
 sorted linked lists.

 Merge the two lists into one
 sorted linked list.

 The merged list should be made by
 splicing together the nodes of the
 first two lists.

 Return the head of the merged list.

 Example 1:

 Input:
 list1 = [1,2,4]
 list2 = [1,3,4]

 Output:
 [1,1,2,3,4,4]

 Example 2:

 Input:
 list1 = []
 list2 = []

 Output:
 []

 Example 3:

 Input:
 list1 = []
 list2 = [0]

 Output:
 [0]

 Approach:

 - Create a dummy node.

 - Maintain a current pointer.

 - Compare values from both lists.

 - Attach the smaller node to
   the merged list.

 - Move the pointer of the list
   from which the node was taken.

 - Continue until one list
   becomes empty.

 - Attach the remaining nodes.

 - Return dummy.next.
 */

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

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {

    let dummy = ListNode(-1)
    var current = dummy

    var l1 = list1
    var l2 = list2

    while let node1 = l1,
          let node2 = l2 {

        if node1.val <= node2.val {

            current.next = node1
            l1 = node1.next

        } else {

            current.next = node2
            l2 = node2.next
        }

        current = current.next!
    }

    // Attach remaining nodes

    current.next = l1 ?? l2

    return dummy.next
}

// MARK: - Time and Space Complexity

/*
 Time Complexity:

 O(n + m)

 n = number of nodes in list1

 m = number of nodes in list2

 Every node is visited exactly once.

 Space Complexity:

 O(1)

 Only a few pointers are used.

 No extra linked list is created.
 */

// MARK: - Dry Run

/*
 Input:

 list1 = 1 -> 2 -> 4

 list2 = 1 -> 3 -> 4

 ----------------------------------------

 Initial State

 dummy -> nil

 current = dummy

 ----------------------------------------

 Compare

 1 and 1

 Choose list1

 dummy -> 1

 current -> 1

 l1 -> 2

 ----------------------------------------

 Compare

 2 and 1

 Choose list2

 dummy -> 1 -> 1

 current -> second 1

 l2 -> 3

 ----------------------------------------

 Compare

 2 and 3

 Choose list1

 dummy -> 1 -> 1 -> 2

 current -> 2

 l1 -> 4

 ----------------------------------------

 Compare

 4 and 3

 Choose list2

 dummy -> 1 -> 1 -> 2 -> 3

 current -> 3

 l2 -> 4

 ----------------------------------------

 Compare

 4 and 4

 Choose list1

 dummy -> 1 -> 1 -> 2 -> 3 -> 4

 current -> 4

 l1 -> nil

 ----------------------------------------

 Attach remaining list2

 dummy -> 1 -> 1 -> 2 -> 3 -> 4 -> 4

 ----------------------------------------

 Return

 dummy.next

 Output:

 1 -> 1 -> 2 -> 3 -> 4 -> 4
 */
