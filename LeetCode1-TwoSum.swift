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

/*
 Time Complexity:
 O(n)
 - We traverse the array only once
 - Dictionary lookup is O(1)

 Space Complexity:
 O(n)
 - Extra dictionary storage
 */



