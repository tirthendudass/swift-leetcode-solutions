//
//  LeetcodeProblems
//
//  Created by Tirthendu on 02/04/26.
//

import Foundation

// MARK: - LeetCode 1: Two Sum

/*
 Problem:
 Given an array of integers and a target value,
 return the indices of the two numbers such that they add up to the target.

 Example:
 nums = [2,7,11,15], target = 9
 Output = [0,1]

 Approach:
 - Use a dictionary (HashMap) to store:
      number : index
 - For each number:
      1. Find the required complement
      2. Check if complement already exists in dictionary
      3. If found, return indices
 - This avoids nested loops and gives O(n) performance
 */

func twoSums(_ nums: [Int], _ target: Int) -> [Int] {

    // Dictionary to store:
    // key   -> number
    // value -> index
    var map: [Int: Int] = [:]

    // Traverse array with index and value
    for (index, num) in nums.enumerated() {

        // Calculate complement needed to reach target
        let needed = target - num

        // Check if complement already exists
        if let foundIndex = map[needed] {

            // Pair found
            return [foundIndex, index]
        }

        // Store current number and index
        map[num] = index
    }

    // Return empty array if no solution exists
    return []
}

//MARK: - Time and Space Complexity

/*
 Time Complexity:
 O(n)
 - We traverse the array only once
 - Dictionary lookup is O(1)

 Space Complexity:
 O(n)
 - Extra dictionary storage
 */

//MARK: - Dry Run 

/*
 Input:
 nums = [2,7,11,15]
 target = 26

 --------------------------------------------------

 Initial State:
 map = [:]

 --------------------------------------------------

 Iteration 1:

 index = 0
 num = 2

 needed = 26 - 2
 needed = 24

 Check:
 map[24] -> not found

 Store current number:
 map = [2:0]

 --------------------------------------------------

 Iteration 2:

 index = 1
 num = 7

 needed = 26 - 7
 needed = 19

 Check:
 map[19] -> not found

 Store current number:
 map = [2:0, 7:1]

 --------------------------------------------------

 Iteration 3:

 index = 2
 num = 11

 needed = 26 - 11
 needed = 15

 Check:
 map[15] -> not found

 Store current number:
 map = [2:0, 7:1, 11:2]

 --------------------------------------------------

 Iteration 4:

 index = 3
 num = 15

 needed = 26 - 15
 needed = 11

 Check:
 map[11] -> FOUND at index 2

 Pair Found:
 nums[2] + nums[3]
 11 + 15 = 26

 Return:
 [2, 3]

 --------------------------------------------------

 Final Output:
 [2,3]
 */







