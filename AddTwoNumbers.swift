//
//  AddNumbers.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 16/05/26.
//

import Foundation

//MARK: - Leet Code 2 -

extension ViewController {
    
    //     * Definition for singly-linked list.
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // Traversal pointers
        var p = l1
        var q = l2
        
        // Dummy node to simplify result creation
        let dummy = ListNode(0)
        
        // Current pointer for building result list
        var current = dummy
        
        // Carry value
        var carry = 0
        
        // Continue until both lists and carry are finished
        while p != nil || q != nil || carry != 0 {
            
            // Take value or 0 if node is nil
            let x = p?.val ?? 0
            let y = q?.val ?? 0
            
            // Total sum
            let sum = x + y + carry
            
            // Update carry
            carry = sum / 10
            
            // Create node with single digit
            current.next = ListNode(sum % 10)
            
            // Move current pointer
            current = current.next!
            
            // Move linked list pointers
            p = p?.next
            q = q?.next
        }
        
        // Skip dummy node
        return dummy.next
    }
}
