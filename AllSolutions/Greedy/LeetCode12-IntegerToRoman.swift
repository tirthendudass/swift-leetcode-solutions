//
//  IntegerToRoman.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 27/05/26.
//

import Foundation

// MARK: - LeetCode 12: Integer to Roman

/*
 Problem:
 Convert an integer to a Roman numeral.

 Roman numerals are represented by:

 I   = 1
 V   = 5
 X   = 10
 L   = 50
 C   = 100
 D   = 500
 M   = 1000

 Special cases:

 IV  = 4
 IX  = 9
 XL  = 40
 XC  = 90
 CD  = 400
 CM  = 900

 Example 1:
 num = 3

 Output:
 "III"

 --------------------------------------------------

 Example 2:
 num = 58

 Output:
 "LVIII"

 Explanation:
 50 = L
 5  = V
 3  = III

 --------------------------------------------------

 Example 3:
 num = 1994

 Output:
 "MCMXCIV"

 Explanation:
 1000 = M
 900  = CM
 90   = XC
 4    = IV

 --------------------------------------------------

 Approach:
 - Store all Roman numeral values in descending order
 - Start from the largest value
 - While current number is greater than or equal to value:
      - Append corresponding Roman symbol
      - Subtract value from number
 - Continue until number becomes 0

 This works because Roman numerals are built
 greedily from largest to smallest values.
 */

func intToRoman(_ num: Int) -> String {

    // Remaining number to convert
    var number = num

    // Final Roman numeral string
    var result = ""

    // Roman numeral mappings
    let romanValues: [(value: Int, symbol: String)] = [

        (1000, "M"),
        (900,  "CM"),
        (500,  "D"),
        (400,  "CD"),
        (100,  "C"),
        (90,   "XC"),
        (50,   "L"),
        (40,   "XL"),
        (10,   "X"),
        (9,    "IX"),
        (5,    "V"),
        (4,    "IV"),
        (1,    "I")
    ]

    // Traverse all Roman numeral values
    for roman in romanValues {

        // Keep using symbol while possible
        while number >= roman.value {

            // Append Roman symbol
            result += roman.symbol

            // Reduce number
            number -= roman.value
        }
    }

    return result
}

// MARK: - Time and Space Complexity

/*
 Time Complexity:
 O(1)
 - Roman numeral mappings are fixed
 - Maximum operations are constant

 Space Complexity:
 O(1)
 - Only fixed extra space used
 */

// MARK: - Dry Run

/*
 Input:
 num = 1994

 --------------------------------------------------

 Initial State:

 number = 1994
 result = ""

 --------------------------------------------------

 Step 1:

 number >= 1000

 Append "M"

 result = "M"

 number = 1994 - 1000
 number = 994

 --------------------------------------------------

 Step 2:

 number >= 900

 Append "CM"

 result = "MCM"

 number = 994 - 900
 number = 94

 --------------------------------------------------

 Step 3:

 94 >= 90

 Append "XC"

 result = "MCMXC"

 number = 94 - 90
 number = 4

 --------------------------------------------------

 Step 4:

 4 >= 4

 Append "IV"

 result = "MCMXCIV"

 number = 4 - 4
 number = 0

 --------------------------------------------------

 Final Output:
 "MCMXCIV"
 */
