//
//  ZigzagConversion.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 19/05/26.
//

import Foundation

// MARK: - LeetCode 6: Zigzag Conversion

/*
 Problem:
 The string "PAYPALISHIRING"
 is written in a zigzag pattern
 on a given number of rows.

 Example:

 numRows = 3

 P   A   H   N
 A P L S I I G
 Y   I   R

 Read row by row:
 "PAHNAPLSIIGYIR"

 ----------------------------------------

 Example 1:
 Input:
 s = "PAYPALISHIRING"
 numRows = 3

 Output:
 "PAHNAPLSIIGYIR"

 ----------------------------------------

 Example 2:
 Input:
 s = "PAYPALISHIRING"
 numRows = 4

 Zigzag:

 P     I     N
 A   L S   I G
 Y A   H R
 P     I

 Output:
 "PINALSIGYAHRPI"

 ----------------------------------------

 Pattern:
 - Simulation
 - String Traversal

 Approach:
 - Create rows
 - Traverse characters
 - Move:
    DOWN
    then
    UP diagonally

 Track:
 - currentRow
 - direction

 Finally:
 combine all rows

 ----------------------------------------
 */

func convert(_ s: String,
             _ numRows: Int) -> String {

    // Edge case:
    // If only 1 row,
    // zigzag is same string

    if numRows == 1 ||
        numRows >= s.count {

        return s
    }

    // Create rows

    var rows =
    Array(repeating: "",
          count: numRows)

    // Current row pointer
    var currentRow = 0

    // Direction tracker
    var goingDown = false

    // Traverse characters
    for char in s {

        // Add character
        // into current row

        rows[currentRow].append(char)

        /*
         Change direction
         when:
         - top reached
         - bottom reached
         */

        if currentRow == 0 ||
            currentRow == numRows - 1 {

            goingDown.toggle()
        }

        // Move row pointer

        currentRow += goingDown ? 1 : -1
    }

    // Combine all rows
    return rows.joined()
}


/*
 ----------------------------------------
 DRY RUN
 ----------------------------------------

 Input:
 s = "PAYPALISHIRING"
 numRows = 3

 ----------------------------------------

 Initial:

 rows = ["", "", ""]

 currentRow = 0
 goingDown = false

 ----------------------------------------
 char = P
 ----------------------------------------

 rows[0] = "P"

 Top reached
 change direction

 goingDown = true

 Move:
 currentRow = 1

 rows:
 ["P", "", ""]

 ----------------------------------------
 char = A
 ----------------------------------------

 rows[1] = "A"

 Move:
 currentRow = 2

 rows:
 ["P", "A", ""]

 ----------------------------------------
 char = Y
 ----------------------------------------

 rows[2] = "Y"

 Bottom reached
 change direction

 goingDown = false

 Move:
 currentRow = 1

 rows:
 ["P", "A", "Y"]

 ----------------------------------------
 char = P
 ----------------------------------------

 rows[1] = "AP"

 Move:
 currentRow = 0

 rows:
 ["P", "AP", "Y"]

 ----------------------------------------
 Continue...

 Final rows:

 Row 0:
 "PAHN"

 Row 1:
 "APLSIIG"

 Row 2:
 "YIR"

 ----------------------------------------

 Final Answer:

 "PAHNAPLSIIGYIR"

 ----------------------------------------
 */


/*
 ----------------------------------------
 VISUALIZATION
 ----------------------------------------

 numRows = 4

 Row 0      P       I       N

 Row 1      A    L  S    I  G

 Row 2      Y A     H R

 Row 3      P       I

 ----------------------------------------
 */


/*
 Time Complexity:
 O(n)

 - Traverse each character once

 Space Complexity:
 O(n)

 - Store rows

 where:
 n = length of string
 */
