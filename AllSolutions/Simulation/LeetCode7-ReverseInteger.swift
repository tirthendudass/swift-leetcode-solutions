//
//  ReverseInteger.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 20/05/26.
//

import Foundation

// MARK: - LeetCode 7: Reverse Integer

/*
 Problem:
 Given a signed 32-bit integer x,
 return x with its digits reversed.

 If reversing x causes the value
 to go outside the signed
 32-bit integer range,
 then return 0.

 ----------------------------------------

 32-bit signed integer range:

 -2^31 to 2^31 - 1

 ----------------------------------------

 Example 1:
 Input:
 x = 123

 Output:
 321

 ----------------------------------------

 Example 2:
 Input:
 x = -123

 Output:
 -321

 ----------------------------------------

 Example 3:
 Input:
 x = 120

 Output:
 21

 ----------------------------------------

 Example 4:
 Input:
 x = 1534236469

 Output:
 0

 Reason:
 Overflow occurs

 ----------------------------------------

 Pattern:
 - Simulation
 - Math
 - Digit Manipulation

 ----------------------------------------

 Approach:
 - Extract last digit
 - Append into reversed number
 - Remove last digit
 - Check overflow

 ----------------------------------------

 Formula:

 digit = x % 10

 rev = rev * 10 + digit

 x = x / 10

 ----------------------------------------
 */

func reverse(_ x: Int) -> Int {

    // Store original number

    var number = x

    // Final reversed result

    var reversedNumber = 0

    /*
     32-bit Integer Range

     Int32.min = -2147483648
     Int32.max =  2147483647
     */

    let maxLimit = Int(Int32.max)
    let minLimit = Int(Int32.min)

    // Process until number becomes 0

    while number != 0 {

        // Extract last digit

        let digit = number % 10

        /*
         Overflow Check

         Example:

         reversedNumber = 214748364

         If we multiply by 10
         and add digit,
         it may overflow
         */

        if reversedNumber > maxLimit / 10 ||
            (reversedNumber == maxLimit / 10 &&
             digit > 7) {

            return 0
        }

        if reversedNumber < minLimit / 10 ||
            (reversedNumber == minLimit / 10 &&
             digit < -8) {

            return 0
        }

        // Build reversed number

        reversedNumber =
        reversedNumber * 10 + digit

        // Remove last digit

        number /= 10
    }

    return reversedNumber
}

/*
 ----------------------------------------
 DRY RUN
 ----------------------------------------

 Input:
 x = 123

 ----------------------------------------

 Initial:

 number = 123
 reversedNumber = 0

 ----------------------------------------
 Iteration 1
 ----------------------------------------

 digit = 123 % 10
       = 3

 reversedNumber =
 0 * 10 + 3
 = 3

 number = 123 / 10
        = 12

 ----------------------------------------

 number = 12
 reversedNumber = 3

 ----------------------------------------
 Iteration 2
 ----------------------------------------

 digit = 12 % 10
       = 2

 reversedNumber =
 3 * 10 + 2
 = 32

 number = 12 / 10
        = 1

 ----------------------------------------

 number = 1
 reversedNumber = 32

 ----------------------------------------
 Iteration 3
 ----------------------------------------

 digit = 1 % 10
       = 1

 reversedNumber =
 32 * 10 + 1
 = 321

 number = 1 / 10
        = 0

 ----------------------------------------

 Loop Ends

 Final Answer:
 321

 ----------------------------------------
 */


/*
 ----------------------------------------
 VISUALIZATION
 ----------------------------------------

 x = 123

 ----------------------------------------

 Step 1:

 123 % 10 = 3

 reversedNumber:
 0 → 3

 ----------------------------------------

 Step 2:

 12 % 10 = 2

 reversedNumber:
 3 → 32

 ----------------------------------------

 Step 3:

 1 % 10 = 1

 reversedNumber:
 32 → 321

 ----------------------------------------

 Final:
 321

 ----------------------------------------
 */


/*
 ----------------------------------------
 EDGE CASES
 ----------------------------------------

 Case 1:
 x = 0

 Output:
 0

 ----------------------------------------

 Case 2:
 x = 120

 Reverse:
 021

 Output:
 21

 ----------------------------------------

 Case 3:
 x = -123

 Output:
 -321

 ----------------------------------------

 Case 4:
 x = 1534236469

 Reverse exceeds
 32-bit integer range

 Output:
 0

 ----------------------------------------
 */


/*
 ----------------------------------------
 TIME COMPLEXITY
 ----------------------------------------

 O(log n)

 - Process each digit once

 ----------------------------------------

 SPACE COMPLEXITY
 ----------------------------------------

 O(1)

 - No extra space used

 ----------------------------------------
 */
