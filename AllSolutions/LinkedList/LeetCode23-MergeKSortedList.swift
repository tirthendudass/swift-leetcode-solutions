//
//  MergeKSortedLists.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 17/06/26.
//

import Foundation

// MARK: - LeetCode 23: Merge k Sorted Lists

/*
 Problem:

 You are given an array of k linked lists.

 Each linked list is sorted
 in ascending order.

 Merge all the linked lists
 into one sorted linked list
 and return it.

 Example 1:

 Input:
 lists = [[1,4,5],[1,3,4],[2,6]]

 Output:
 [1,1,2,3,4,4,5,6]

 Example 2:

 Input:
 lists = []

 Output:
 []

 Example 3:

 Input:
 lists = [[]]

 Output:
 []

 Approach (Divide & Conquer):

 - If there are no lists,
   return nil.

 - Repeatedly merge
   two linked lists.

 - After every round,
   halve the number of lists.

 - Continue until only
   one list remains.

 Why Divide & Conquer?

 Instead of merging every list
 one by one (which is slower),
 we merge pairs of lists,
 similar to Merge Sort.

 This gives much better performance.
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

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {

    guard !lists.isEmpty else {
        return nil
    }

    var lists = lists
    var interval = 1

    while interval < lists.count {

        var index = 0

        while index + interval < lists.count {

            lists[index] = mergeTwoLists(
                lists[index],
                lists[index + interval]
            )

            index += interval * 2
        }

        interval *= 2
    }

    return lists[0]
}

// MARK: - Merge Two Sorted Lists

private func mergeTwoLists(
    _ l1: ListNode?,
    _ l2: ListNode?
) -> ListNode? {

    let dummy = ListNode(0)
    var tail: ListNode? = dummy

    var first = l1
    var second = l2

    while let node1 = first,
          let node2 = second {

        if node1.val <= node2.val {

            tail?.next = node1
            first = node1.next

        } else {

            tail?.next = node2
            second = node2.next
        }

        tail = tail?.next
    }

    tail?.next = first ?? second

    return dummy.next
}

// MARK: - Time and Space Complexity

/*
 Let:

 k = number of linked lists

 n = total number of nodes
 across all lists

 Time Complexity:

 O(n log k)

 Each node participates
 in log k merge rounds.

 Space Complexity:

 O(1)

 Only pointers are used.

 (Ignoring recursion stack,
 since this solution is iterative.)
 */

// MARK: - Dry Run

/*
 Input:

 [
   1 -> 4 -> 5,
   1 -> 3 -> 4,
   2 -> 6
 ]

 ----------------------------------------

 Round 1

 Merge

 (1->4->5)

 with

 (1->3->4)

 Result:

 1->1->3->4->4->5

 Lists become

 [
   1->1->3->4->4->5,
   2->6
 ]

 ----------------------------------------

 Round 2

 Merge

 1->1->3->4->4->5

 with

 2->6

 Result

 1->1->2->3->4->4->5->6

 ----------------------------------------

 Only one list remains.

 Return it.

 Output:

 1 -> 1 -> 2 -> 3 -> 4 -> 4 -> 5 -> 6
 */
