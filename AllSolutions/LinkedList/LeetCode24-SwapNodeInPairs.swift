//
//  SwapNodesInPairs.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 19/06/26.
//

import Foundation

// MARK: - LeetCode 24: Swap Nodes in Pairs

/*
 Problem:

 Given a linked list,
 swap every two adjacent nodes
 and return its head.

 You must solve the problem
 without modifying the values
 inside the nodes.

 Only the nodes themselves
 may be changed.

 Example 1:

 Input:

 head = [1,2,3,4]

 Output:

 [2,1,4,3]

 Example 2:

 Input:

 head = []

 Output:

 []

 Example 3:

 Input:

 head = [1]

 Output:

 [1]

 Approach (Iterative):

 - Create a dummy node
   before the head.

 - Keep a pointer called
   "prev" before every pair.

 - Identify

   first = prev.next

   second = first.next

 - Swap the links

   prev -> second

   second -> first

   first -> nextPair

 - Move prev
   to the end of
   the swapped pair.

 Repeat until fewer than
 two nodes remain.

 Why Dummy Node?

 It makes swapping
 the first pair
 much easier because
 the head may change.
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

func swapPairs(_ head: ListNode?) -> ListNode? {

    let dummy = ListNode(0)
    dummy.next = head

    var prev: ListNode? = dummy

    while let first = prev?.next,
          let second = first.next {

        let nextPair = second.next

        prev?.next = second
        second.next = first
        first.next = nextPair

        prev = first
    }

    return dummy.next
}

// MARK: - Time and Space Complexity

/*
 Let:

 n = number of nodes

 Time Complexity:

 O(n)

 Each node is visited once.

 Space Complexity:

 O(1)

 Only a few pointers
 are used.
 */

// MARK: - Dry Run

/*
 Input:

 1 -> 2 -> 3 -> 4

 ----------------------------------------

 Initial

 dummy -> 1 -> 2 -> 3 -> 4

 prev = dummy

 ----------------------------------------

 First Pair

 first = 1

 second = 2

 nextPair = 3

 Swap

 dummy -> 2 -> 1 -> 3 -> 4

 prev moves to 1

 ----------------------------------------

 Second Pair

 first = 3

 second = 4

 nextPair = nil

 Swap

 dummy -> 2 -> 1 -> 4 -> 3

 prev moves to 3

 ----------------------------------------

 No more pairs.

 Return

 2 -> 1 -> 4 -> 3

 Output:

 [2,1,4,3]
 */
