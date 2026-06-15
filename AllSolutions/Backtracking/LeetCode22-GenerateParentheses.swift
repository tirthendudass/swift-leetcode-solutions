//
//  GenerateParentheses.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 15/06/26.
//

import Foundation

// MARK: - LeetCode 22: Generate Parentheses

/*
 Problem:

 Given n pairs of parentheses,
 write a function to generate
 all combinations of well-formed parentheses.

 Example 1:

 Input:
 n = 3

 Output:
 [
   "((()))",
   "(()())",
   "(())()",
   "()(())",
   "()()()"
 ]

 Example 2:

 Input:
 n = 1

 Output:
 [
   "()"
 ]

 Approach:

 - Use Backtracking.
 - Build the string one character at a time.

 - Keep track of:
    1. Number of opening brackets used.
    2. Number of closing brackets used.

 - Rules:

    1. Add "("
       if opening brackets used < n.

    2. Add ")"
       only if
       closing brackets used < opening brackets.

 - Once the string length becomes
   2 * n,
   add it to the result.

 - Backtrack automatically
   after every recursive call.
 */

func generateParenthesis(_ n: Int) -> [String] {

    var result: [String] = []

    func backtrack(
        _ current: String,
        _ open: Int,
        _ close: Int
    ) {

        // Valid combination completed
        if current.count == n * 2 {
            result.append(current)
            return
        }

        // Add opening bracket
        if open < n {
            backtrack(
                current + "(",
                open + 1,
                close
            )
        }

        // Add closing bracket
        if close < open {
            backtrack(
                current + ")",
                open,
                close + 1
            )
        }
    }

    backtrack("", 0, 0)

    return result
}

// MARK: - Time and Space Complexity

/*
 Time Complexity:

 O(4^n / √n)

 Number of valid combinations
 is the nth Catalan Number.

 Backtracking explores only
 valid possibilities.

 Space Complexity:

 O(n)

 Recursive call stack
 can go as deep as 2n.

 Ignoring the output array.
 */

// MARK: - Dry Run

/*
 Input:

 n = 2

 --------------------------------------------

 Start

 current = ""
 open = 0
 close = 0

 --------------------------------------------

 Add "("

 current = "("

 open = 1
 close = 0

 --------------------------------------------

 Add "("

 current = "(("

 open = 2
 close = 0

 Cannot add more "("

 Add ")"

 current = "(()"

 open = 2
 close = 1

 --------------------------------------------

 Add ")"

 current = "(())"

 Length = 4

 Add to result

 result = ["(())"]

 --------------------------------------------

 Backtrack

 From "("

 Try adding ")"

 current = "()"

 open = 1
 close = 1

 --------------------------------------------

 Add "("

 current = "()("

 open = 2
 close = 1

 --------------------------------------------

 Add ")"

 current = "()()"

 Length = 4

 Add to result

 result =

 [
   "(())",
   "()()"
 ]

 --------------------------------------------

 End

 Output:

 [
   "(())",
   "()()"
 ]
 */
