//
//  LetterCombinationsOfPhoneNumber.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 06/06/26.
//

import Foundation

// MARK: - LeetCode 17: Letter Combinations of a Phone Number

/*
 Problem:

 Given a string containing digits
 from 2-9 inclusive,

 return all possible letter combinations
 that the number could represent.

 Return the answer in any order.

 The mapping is the same as
 telephone buttons.

 Example:

 digits = "23"

 Output:

 [
 "ad","ae","af",
 "bd","be","bf",
 "cd","ce","cf"
 ]

 --------------------------------------------------

 Phone Mapping:

 2 -> abc
 3 -> def
 4 -> ghi
 5 -> jkl
 6 -> mno
 7 -> pqrs
 8 -> tuv
 9 -> wxyz

 --------------------------------------------------

 Approach:

 - Create a dictionary for
   digit to letters mapping

 - If input is empty,
   return empty array

 - Use Backtracking (DFS)

 - At every digit:
      Try every possible letter

 - Add one letter
 - Move to next digit
 - After recursion,
   remove last letter
   (Backtracking)

 - When current combination
   length equals digits length,

   store the answer

 Time Complexity becomes O(4ⁿ)
 because each digit can have
 at most 4 possible letters.
 */

func letterCombinations(
    _ digits: String
) -> [String] {

    guard !digits.isEmpty else {
        return []
    }

    let phoneMap: [Character: String] = [

        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz"

    ]

    let digits = Array(digits)

    var result = [String]()
    var current = ""

    func backtrack(
        _ index: Int
    ) {

        // One complete combination
        if index == digits.count {

            result.append(current)
            return

        }

        let letters =
        phoneMap[digits[index]]!

        for letter in letters {

            current.append(letter)

            backtrack(index + 1)

            current.removeLast()
        }
    }

    backtrack(0)

    return result
}

// MARK: - Time and Space Complexity

/*
 Time Complexity:

 O(4ⁿ)

 n = number of digits

 Every digit has
 up to 4 possible letters.

 --------------------------------------------------

 Space Complexity:

 O(n)

 Recursion stack

 (Ignoring output array)

 Output itself can contain
 O(4ⁿ) combinations.
 */

// MARK: - Dry Run

/*
 Input:

 digits = "23"

 --------------------------------------------------

 Phone Mapping

 2 -> abc
 3 -> def

 --------------------------------------------------

 Start

 current = ""

 index = 0

 --------------------------------------------------

 Choose 'a'

 current = "a"

 Move to next digit

 --------------------------------------------------

 Choose 'd'

 current = "ad"

 index == digits.count

 Store:

 ["ad"]

 Backtrack

 current = "a"

 --------------------------------------------------

 Choose 'e'

 current = "ae"

 Store

 ["ad","ae"]

 Backtrack

 current = "a"

 --------------------------------------------------

 Choose 'f'

 current = "af"

 Store

 ["ad","ae","af"]

 Backtrack

 current = ""

 --------------------------------------------------

 Choose 'b'

 current = "b"

 --------------------------------------------------

 Choose 'd'

 current = "bd"

 Store

 ["ad","ae","af","bd"]

 Continue...

 --------------------------------------------------

 Choose

 be
 bf
 cd
 ce
 cf

 --------------------------------------------------

 Final Output

 [

 "ad",
 "ae",
 "af",
 "bd",
 "be",
 "bf",
 "cd",
 "ce",
 "cf"

 ]

 */
