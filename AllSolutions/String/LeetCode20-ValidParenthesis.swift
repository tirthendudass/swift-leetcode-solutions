//
//  ValidParentheses.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 11/06/26.
//

import Foundation

// MARK: - LeetCode 20: Valid Parentheses

/*
 Problem:

 Given a string containing just the characters:

 (), {}, []

 determine if the input string is valid.

 A string is valid if:

 1. Open brackets are closed
    by the same type of brackets.

 2. Open brackets are closed
    in the correct order.

 3. Every closing bracket has
    a corresponding opening bracket.

 Example 1:
 Input: "()"
 Output: true

 Example 2:
 Input: "()[]{}"
 Output: true

 Example 3:
 Input: "(]"
 Output: false

 Example 4:
 Input: "([)]"
 Output: false

 Example 5:
 Input: "{[]}"
 Output: true

 Approach:

 - Use a stack to store opening brackets.
 - Traverse every character.
 - If it's an opening bracket,
   push it into the stack.
 - If it's a closing bracket:
      • Stack must not be empty.
      • Top of stack must be
        the matching opening bracket.
      • Otherwise return false.
 - At the end,
   stack must be empty.
 */

func isValid(_ s: String) -> Bool {

    // Stack for opening brackets
    var stack: [Character] = []

    // Matching brackets
    let pairs: [Character: Character] = [
        ")": "(",
        "]": "[",
        "}": "{"
    ]

    for char in s {

        // Opening bracket
        if char == "(" || char == "[" || char == "{" {

            stack.append(char)

        } else {

            // Stack cannot be empty
            guard let last = stack.last else {
                return false
            }

            // Must match opening bracket
            if last != pairs[char] {
                return false
            }

            stack.removeLast()
        }
    }

    // Stack should be empty
    return stack.isEmpty
}

// MARK: - Time and Space Complexity

/*
 Time Complexity:
 O(n)

 n = number of characters

 Each character is processed once.

 Space Complexity:
 O(n)

 In the worst case,
 every character is an opening bracket
 and gets stored in the stack.
 */

// MARK: - Dry Run

/*
 Input:
 s = "{[]}"

 --------------------------------------------

 Initial State:

 stack = []

 --------------------------------------------

 Character = "{"

 Opening bracket

 stack = ["{"]

 --------------------------------------------

 Character = "["

 Opening bracket

 stack = ["{", "["]

 --------------------------------------------

 Character = "]"

 Top of stack = "["

 Matches

 Remove "["

 stack = ["{"]

 --------------------------------------------

 Character = "}"

 Top of stack = "{"

 Matches

 Remove "{"

 stack = []

 --------------------------------------------

 End of string

 Stack is empty

 Return true

 --------------------------------------------

 Output:
 true
 */
