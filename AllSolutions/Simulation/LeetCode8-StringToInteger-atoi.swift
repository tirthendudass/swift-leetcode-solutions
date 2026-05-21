//
//  StringToIntegerAtoi.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 21/05/26.
//

import Foundation

// MARK: - LeetCode 8: String to Integer (atoi)

/*
 Problem:
 Implement the atoi() function.

 The function converts a string
 into a 32-bit signed integer.

 ----------------------------------------

 Rules:

 1. Ignore leading whitespaces

 2. Check optional sign:
    '+' or '-'

 3. Read digits until:
    - non-digit appears
    - string ends

 4. Clamp result within:
    [-2^31, 2^31 - 1]

 ----------------------------------------

 Example 1:

 Input:
 s = "42"

 Output:
 42

 ----------------------------------------

 Example 2:

 Input:
 s = "   -42"

 Output:
 -42

 ----------------------------------------

 Example 3:

 Input:
 s = "4193 with words"

 Output:
 4193

 ----------------------------------------

 Example 4:

 Input:
 s = "words and 987"

 Output:
 0

 ----------------------------------------

 Example 5:

 Input:
 s = "-91283472332"

 Output:
 -2147483648

 ----------------------------------------

 Pattern:
 - String Parsing
 - Simulation

 ----------------------------------------

 Approach:

 1. Skip leading spaces

 2. Detect sign

 3. Parse digits

 4. Check overflow before:
    result * 10 + digit

 5. Return final number

 ----------------------------------------
 */

func myAtoi(_ s: String) -> Int {

    // Convert string into array
    // for easy indexing

    let chars = Array(s)

    let n = chars.count

    // Pointer

    var index = 0

    // Sign tracker

    var sign = 1

    // Final result

    var result = 0

    // Integer limits

    let intMax = Int(Int32.max)
    let intMin = Int(Int32.min)

    /*
     ----------------------------------------
     STEP 1:
     Skip leading whitespaces
     ----------------------------------------
     */

    while index < n &&
            chars[index] == " " {

        index += 1
    }

    /*
     ----------------------------------------
     STEP 2:
     Check sign
     ----------------------------------------
     */

    if index < n {

        if chars[index] == "-" {

            sign = -1
            index += 1

        } else if chars[index] == "+" {

            index += 1
        }
    }

    /*
     ----------------------------------------
     STEP 3:
     Process digits
     ----------------------------------------
     */

    while index < n,
          let digit =
            chars[index].wholeNumberValue {

        /*
         ----------------------------------------
         STEP 4:
         Overflow check
         ----------------------------------------

         Before:

         result * 10 + digit

         because multiplication
         itself can overflow
         */

        if result > intMax / 10 ||

            (result == intMax / 10 &&
             digit > (sign == 1 ? 7 : 8)) {

            return sign == 1
            ? intMax
            : intMin
        }

        /*
         Build number

         Example:

         12

         12 * 10 + 3
         = 123
         */

        result = result * 10 + digit

        index += 1
    }

    /*
     ----------------------------------------
     STEP 5:
     Apply sign
     ----------------------------------------
     */

    return result * sign
}

/*
 ----------------------------------------
 DRY RUN
 ----------------------------------------

 Input:
 s = "   -42abc"

 ----------------------------------------

 STEP 1:
 Skip spaces

 index moves to '-'

 ----------------------------------------

 STEP 2:
 Detect sign

 sign = -1

 index moves to '4'

 ----------------------------------------

 STEP 3:
 Parse digits

 result = 0

 digit = 4

 result =
 0 * 10 + 4
 = 4

 ----------------------------------------

 digit = 2

 result =
 4 * 10 + 2
 = 42

 ----------------------------------------

 Next character:
 'a'

 Not a digit

 Stop parsing

 ----------------------------------------

 STEP 4:
 Apply sign

 result * sign

 42 * -1
 = -42

 ----------------------------------------

 Final Answer:
 -42

 ----------------------------------------
 */


/*
 ----------------------------------------
 VISUALIZATION
 ----------------------------------------

 Input:
 "   -123abc"

 ----------------------------------------

 Skip Spaces:

 "   -123abc"
     ^

 ----------------------------------------

 Detect Sign:

 "-123abc"
  ^

 sign = -1

 ----------------------------------------

 Parse Digits:

 result = 1

 result = 12

 result = 123

 ----------------------------------------

 Stop at:

 "abc"

 ----------------------------------------

 Final:

 -123

 ----------------------------------------
 */


/*
 ----------------------------------------
 EDGE CASES
 ----------------------------------------

 Input:
 "+"

 Output:
 0

 ----------------------------------------

 Input:
 "words123"

 Output:
 0

 ----------------------------------------

 Input:
 "00000123"

 Output:
 123

 ----------------------------------------

 Input:
 "-91283472332"

 Output:
 -2147483648

 ----------------------------------------
 */


/*
 ----------------------------------------
 COMPLEXITY
 ----------------------------------------

 Time Complexity:
 O(n)

 - Traverse string once

 ----------------------------------------

 Space Complexity:
 O(n)

 - Due to Array(s)

 ----------------------------------------

 Optimized Version:
 O(1) extra space

 if directly traversing String.Index

 ----------------------------------------
 */
