//
//  PalindromeNumber.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 22/05/26.
//

import Foundation

// MARK: - LeetCode 9: Palindrome Number

/*
 Problem:
 Determine whether an integer
 is a palindrome.

 A palindrome number reads
 the same forward and backward.

 ----------------------------------------

 Example 1:

 Input:
 x = 121

 Output:
 true

 ----------------------------------------

 Example 2:

 Input:
 x = -121

 Output:
 false

 Explanation:

 From left to right:
 -121

 From right to left:
 121-

 Not same

 ----------------------------------------

 Example 3:

 Input:
 x = 10

 Output:
 false

 Explanation:

 Reverse becomes:
 01

 Not same as 10

 ----------------------------------------

 Pattern:
 - Math
 - Digit Manipulation

 ----------------------------------------

 Optimal Approach:

 Reverse only HALF of the number.

 Why?

 If we reverse the full number,
 extra work is done.

 Also avoids overflow issues.

 ----------------------------------------

 Approach:

 1. Negative numbers
    are never palindrome

 2. Numbers ending with 0
    cannot be palindrome
    except 0 itself

 3. Reverse half of digits

 4. Compare both halves

 ----------------------------------------
 */

func isPalindrome(_ x: Int) -> Bool {

    /*
     ----------------------------------------
     STEP 1:
     Handle edge cases
     ----------------------------------------
     */

    // Negative numbers
    // are not palindrome

    // Numbers ending with 0
    // cannot be palindrome
    // unless number itself is 0

    if x < 0 ||
        (x % 10 == 0 && x != 0) {

        return false
    }

    /*
     ----------------------------------------
     STEP 2:
     Reverse half of number
     ----------------------------------------
     */

    var number = x

    var reversedHalf = 0

    /*
     Keep reversing digits
     until reversedHalf
     becomes greater than
     or equal to remaining number
     */

    while number > reversedHalf {

        // Extract last digit

        let digit = number % 10

        /*
         Build reversed half

         Example:

         12

         12 * 10 + 3
         = 123
         */

        reversedHalf =
        reversedHalf * 10 + digit

        // Remove last digit

        number /= 10
    }

    /*
     ----------------------------------------
     STEP 3:
     Compare both halves
     ----------------------------------------

     EVEN digits:

     1221

     number = 12
     reversedHalf = 12

     ----------------------------------------

     ODD digits:

     12321

     number = 12
     reversedHalf = 123

     Ignore middle digit:

     123 / 10 = 12
     */

    return number == reversedHalf ||

           number == reversedHalf / 10
}

/*
 ----------------------------------------
 DRY RUN
 ----------------------------------------

 Input:
 x = 1221

 ----------------------------------------

 Initial:

 number = 1221
 reversedHalf = 0

 ----------------------------------------

 ITERATION 1:

 digit = 1

 reversedHalf =
 0 * 10 + 1
 = 1

 number =
 1221 / 10
 = 122

 ----------------------------------------

 ITERATION 2:

 digit = 2

 reversedHalf =
 1 * 10 + 2
 = 12

 number =
 122 / 10
 = 12

 ----------------------------------------

 STOP:

 number == reversedHalf

 12 == 12

 ----------------------------------------

 Final Answer:
 true

 ----------------------------------------
 */


/*
 ----------------------------------------
 VISUALIZATION
 ----------------------------------------

 Input:
 12321

 ----------------------------------------

 Forward:

 1 2 3 2 1

 ----------------------------------------

 Reverse Half:

 1
 12
 123

 ----------------------------------------

 Remaining Half:

 1232
 123
 12

 ----------------------------------------

 Ignore middle digit:

 123 / 10
 = 12

 ----------------------------------------

 Compare:

 12 == 12

 true

 ----------------------------------------
 */


/*
 ----------------------------------------
 EDGE CASES
 ----------------------------------------

 Input:
 x = 0

 Output:
 true

 ----------------------------------------

 Input:
 x = -121

 Output:
 false

 ----------------------------------------

 Input:
 x = 10

 Output:
 false

 ----------------------------------------

 Input:
 x = 11

 Output:
 true

 ----------------------------------------

 Input:
 x = 12321

 Output:
 true

 ----------------------------------------
 */


/*
 ----------------------------------------
 COMPLEXITY
 ----------------------------------------

 Time Complexity:
 O(log n)

 - Process half of digits

 ----------------------------------------

 Space Complexity:
 O(1)

 - No extra data structure used

 ----------------------------------------
 */
