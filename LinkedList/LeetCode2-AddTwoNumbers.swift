//
//  AddNumbers.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 16/05/26.
//

import Foundation

// MARK: - LeetCode 2: Add Two Numbers

/*
 Problem:
 You are given two non-empty linked lists representing two non-negative integers.
 The digits are stored in reverse order, and each node contains a single digit.

 Add the two numbers and return the sum as a linked list.

 Example:
 l1 = [2,4,3]
 l2 = [5,6,4]

 342 + 465 = 807

 Output:
 [7,0,8]

 Approach:
 - Traverse both linked lists simultaneously
 - Add corresponding digits along with carry
 - Create a new node for each digit of the result
 - Use a dummy node to simplify linked list construction
 */

// Definition for singly-linked list
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

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

    // Pointers for traversing linked lists
    var p = l1
    var q = l2

    // Dummy node helps simplify result list creation
    let dummy = ListNode(0)

    // Pointer used to build the result list
    var current = dummy

    // Stores carry generated after addition
    var carry = 0

    // Continue until:
    // 1. Both lists are completely traversed
    // 2. No carry remains
    while p != nil || q != nil || carry != 0 {

        // Extract values from nodes
        // Use 0 if node is nil
        let x = p?.val ?? 0
        let y = q?.val ?? 0

        // Calculate total sum
        let sum = x + y + carry

        // Update carry value
        carry = sum / 10

        // Create new node with single digit value
        current.next = ListNode(sum % 10)

        // Move current pointer forward
        current = current.next!

        // Move linked list pointers
        p = p?.next
        q = q?.next
    }

    // Return result list
    // Skip dummy node
    return dummy.next
}

//MARK: - Time and Space Complexity

/*
 Time Complexity:
 O(max(m, n))

 - We traverse both linked lists once
 - m = length of first list
 - n = length of second list

 Space Complexity:
 O(max(m, n))

 - New linked list is created to store result
 */

//MARK: - Dry Run

/*
 Input:
 l1 = [2,4,3]
 l2 = [5,6,4]

 Represents:
 342 + 465

 --------------------------------------------------

 Initial State:

 carry = 0

 dummy -> 0

 p points to:
 2 -> 4 -> 3

 q points to:
 5 -> 6 -> 4

 --------------------------------------------------

 Iteration 1:

 x = 2
 y = 5
 carry = 0

 sum = 2 + 5 + 0
 sum = 7

 digit = 7 % 10 = 7
 carry = 7 / 10 = 0

 Create node:
 7

 Result List:
 dummy -> 7

 Move pointers forward

 p -> 4
 q -> 6

 --------------------------------------------------

 Iteration 2:

 x = 4
 y = 6
 carry = 0

 sum = 4 + 6 + 0
 sum = 10

 digit = 10 % 10 = 0
 carry = 10 / 10 = 1

 Create node:
 0

 Result List:
 dummy -> 7 -> 0

 Move pointers forward

 p -> 3
 q -> 4

 --------------------------------------------------

 Iteration 3:

 x = 3
 y = 4
 carry = 1

 sum = 3 + 4 + 1
 sum = 8

 digit = 8 % 10 = 8
 carry = 8 / 10 = 0

 Create node:
 8

 Result List:
 dummy -> 7 -> 0 -> 8

 Move pointers forward

 p -> nil
 q -> nil

 --------------------------------------------------

 Loop Ends:
 p == nil
 q == nil
 carry == 0

 --------------------------------------------------

 Final Result:

 dummy -> 7 -> 0 -> 8

 Return:
 [7,0,8]

 Represents:
 807

 --------------------------------------------------

 Final Calculation:

 342 + 465 = 807
 */
