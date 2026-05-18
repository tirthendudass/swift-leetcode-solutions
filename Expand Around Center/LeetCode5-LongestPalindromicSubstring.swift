//
//  LongestPalindromicSubstring.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 18/05/26.
//

import Foundation

// MARK: - LeetCode 5: Longest Palindromic Substring

/*
 Problem:
 Given a string s, return the longest palindromic substring in s.

 A palindrome reads the same forward and backward.

 Example 1:
 Input: s = "babad"
 Output: "bab"

 Explanation:
 "aba" is also a valid answer.

 Example 2:
 Input: s = "cbbd"
 Output: "bb"

 Approach:
 - Use Expand Around Center pattern
 - Every character can act as a palindrome center
 - Expand in both directions while characters match
 - Check:
    1. Odd length palindrome
    2. Even length palindrome
 - Track the longest palindrome boundaries

 Example:
 "aba"
   ^

 "abba"
   ^^

 */

func longestPalindrome(_ s: String) -> String {

    // Convert String into Array
    // for easier index access
    let chars = Array(s)

    // Edge case:
    // Empty string or single character
    if chars.count < 2 {
        return s
    }

    // Stores starting index
    // of longest palindrome
    var start = 0

    // Stores ending index
    // of longest palindrome
    var end = 0

    // Try every index as center
    for i in 0..<chars.count {

        // Odd length palindrome
        // Example: "aba"
        let oddLength = expand(chars, i, i)

        // Even length palindrome
        // Example: "abba"
        let evenLength = expand(chars, i, i + 1)

        // Take maximum palindrome length
        let maxLength = max(oddLength, evenLength)

        // Update answer if longer palindrome found
        if maxLength > end - start {

            // Calculate new boundaries

            start = i - (maxLength - 1) / 2
            end = i + maxLength / 2
        }
    }

    // Return longest palindrome substring
    return String(chars[start...end])
}


// MARK: - Expand Around Center

/*
 Expands from center while characters match

 Example:
 "racecar"
     ^

 Expands:
 "cec"
 "aceca"
 "racecar"
 */

func expand(_ chars: [Character],
            _ left: Int,
            _ right: Int) -> Int {

    var l = left
    var r = right

    // Expand while:
    // 1. inside bounds
    // 2. characters are equal
    while l >= 0 &&
          r < chars.count &&
          chars[l] == chars[r] {

        l -= 1
        r += 1
    }

    // Loop stops AFTER one extra move
    // Actual palindrome length:
    return r - l - 1
}


/*
 ----------------------------------------
 DRY RUN
 ----------------------------------------

 Input:
 s = "babad"

 chars = ["b", "a", "b", "a", "d"]

 Initial:
 start = 0
 end = 0

 ----------------------------------------
 i = 0
 ----------------------------------------

 Odd Palindrome:
 expand(0, 0)

 "b"

 length = 1

 Even Palindrome:
 expand(0, 1)

 "ba" -> not palindrome

 length = 0

 maxLength = 1

 Update:
 start = 0
 end = 0

 Current Answer:
 "b"

 ----------------------------------------
 i = 1
 ----------------------------------------

 Odd Palindrome:
 expand(1, 1)

 Step 1:
 "a"

 Step 2:
 "bab"

 length = 3

 Even Palindrome:
 expand(1, 2)

 "ab" -> not palindrome

 length = 0

 maxLength = 3

 Update:
 start = 0
 end = 2

 Current Answer:
 "bab"

 ----------------------------------------
 i = 2
 ----------------------------------------

 Odd Palindrome:
 expand(2, 2)

 Step 1:
 "b"

 Step 2:
 "aba"

 length = 3

 Even Palindrome:
 expand(2, 3)

 "ba" -> not palindrome

 length = 0

 maxLength = 3

 Update:
 start = 1
 end = 3

 Current Answer:
 "aba"

 ----------------------------------------
 i = 3
 ----------------------------------------

 Odd length = 1
 Even length = 0

 No update

 ----------------------------------------
 i = 4
 ----------------------------------------

 Odd length = 1
 Even length = 0

 No update

 ----------------------------------------
 Final Answer:
 "aba"

 ("bab" is also correct)
 ----------------------------------------
 */


/*
 Time Complexity:
 O(n²)

 - For every character,
   expand left and right

 Worst case:
 "aaaaaa"

 Space Complexity:
 O(n)

 - Because of Array(s)

 where:
 n = length of string
 */
