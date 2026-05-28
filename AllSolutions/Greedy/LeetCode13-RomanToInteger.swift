//
//  RomanToInteger.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 28/05/26.
//

import Foundation

// MARK: - LeetCode 13: Roman to Integer

/*
 Problem:
 Roman numerals are represented by seven symbols:

 I = 1
 V = 5
 X = 10
 L = 50
 C = 100
 D = 500
 M = 1000

 Given a roman numeral string,
 convert it to an integer.

 ----------------------------------------

 Example 1:

 Input:
 s = "III"

 Output:
 3

 Explanation:
 I + I + I = 3

 ----------------------------------------

 Example 2:

 Input:
 s = "LVIII"

 Output:
 58

 Explanation:
 L = 50
 V = 5
 III = 3

 Total = 58

 ----------------------------------------

 Example 3:

 Input:
 s = "MCMXCIV"

 Output:
 1994

 Explanation:
 M = 1000
 CM = 900
 XC = 90
 IV = 4

 Total = 1994

 ----------------------------------------

 Approach:
 - Store all roman numeral values
   inside a dictionary.
 
 - Traverse the string from left to right.
 
 - If current value is smaller than
   the next value,
   subtract it.
 
 - Otherwise,
   add it to the result.

 ----------------------------------------

 Time Complexity:
 O(n)

 Space Complexity:
 O(1)

 */

final class RomanToInteger {

    func romanToInt(_ s: String) -> Int {

        let romanMap: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]

        let chars = Array(s)

        var result = 0

        for index in 0..<chars.count {

            let currentValue = romanMap[chars[index]] ?? 0

            // Check next character
            if index + 1 < chars.count {

                let nextValue = romanMap[chars[index + 1]] ?? 0

                // Subtractive case
                if currentValue < nextValue {
                    result -= currentValue
                } else {
                    result += currentValue
                }

            } else {

                // Last character
                result += currentValue
            }
        }

        return result
    }
}

/*
 ----------------------------------------

 Dry Run:

 Input:
 s = "MCMXCIV"

 Step 1:
 M = 1000
 Next = C (100)

 1000 > 100
 Add

 result = 1000

 ----------------------------------------

 Step 2:
 C = 100
 Next = M (1000)

 100 < 1000
 Subtract

 result = 900

 ----------------------------------------

 Step 3:
 M = 1000
 Next = X (10)

 Add

 result = 1900

 ----------------------------------------

 Step 4:
 X = 10
 Next = C (100)

 Subtract

 result = 1890

 ----------------------------------------

 Step 5:
 C = 100
 Next = I (1)

 Add

 result = 1990

 ----------------------------------------

 Step 6:
 I = 1
 Next = V (5)

 Subtract

 result = 1989

 ----------------------------------------

 Step 7:
 V = 5

 Add

 result = 1994

 ----------------------------------------
 */
