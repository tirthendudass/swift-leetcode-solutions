//
//  ThreeSum.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 04/06/26.
//

import Foundation

// MARK: - LeetCode 15: 3Sum

/*
 Problem:
 Given an integer array nums,
 return all unique triplets [nums[i], nums[j], nums[k]]
 such that:

 nums[i] + nums[j] + nums[k] == 0

 The solution set must not contain duplicate triplets.

 Example:

 nums = [-1,0,1,2,-1,-4]

 Output:
 [[-1,-1,2],[-1,0,1]]

 --------------------------------------------------

 Approach:

 - Sort the array first
 - Fix one element at a time using a loop
 - Use Two Pointers to find the remaining two numbers
 - If sum is 0:
      Store triplet
      Skip duplicates
 - If sum < 0:
      Move left pointer
 - If sum > 0:
      Move right pointer
 - Continue until pointers meet

 This avoids O(n³) brute force solution.

 Time Complexity becomes O(n²)
 */

func threeSum(_ nums: [Int]) -> [[Int]] {

    // Store result
    var result = [[Int]]()

    // Sort array
    let nums = nums.sorted()

    // Fix first element
    for i in 0..<nums.count {

        // Skip duplicate values
        if i > 0 && nums[i] == nums[i - 1] {
            continue
        }

        // Two pointers
        var left = i + 1
        var right = nums.count - 1

        while left < right {

            let sum = nums[i] + nums[left] + nums[right]

            if sum == 0 {

                result.append([
                    nums[i],
                    nums[left],
                    nums[right]
                ])

                // Skip duplicate left values
                while left < right &&
                        nums[left] == nums[left + 1] {

                    left += 1
                }

                // Skip duplicate right values
                while left < right &&
                        nums[right] == nums[right - 1] {

                    right -= 1
                }

                left += 1
                right -= 1

            } else if sum < 0 {

                left += 1

            } else {

                right -= 1
            }
        }
    }

    return result
}

// MARK: - Time and Space Complexity

/*
 Time Complexity:
 O(n²)

 - Sorting takes O(n log n)
 - Outer loop runs O(n)
 - Two pointers traverse O(n)

 Overall:
 O(n²)

 --------------------------------------------------

 Space Complexity:
 O(1)

 Ignoring output array,
 no extra space is used.
 */

// MARK: - Dry Run

/*
 Input:

 nums = [-1,0,1,2,-1,-4]

 --------------------------------------------------

 Step 1:

 Sort Array

 [-4,-1,-1,0,1,2]

 --------------------------------------------------

 Iteration 1

 i = 0

 nums[i] = -4

 left = 1
 right = 5

 sum = -4 + (-1) + 2
 sum = -3

 sum < 0

 Move left

 --------------------------------------------------

 left = 2
 right = 5

 sum = -4 + (-1) + 2
 sum = -3

 Move left

 --------------------------------------------------

 left = 3
 right = 5

 sum = -4 + 0 + 2
 sum = -2

 Move left

 --------------------------------------------------

 left = 4
 right = 5

 sum = -4 + 1 + 2
 sum = -1

 Move left

 left == right

 Stop

 --------------------------------------------------

 Iteration 2

 i = 1

 nums[i] = -1

 left = 2
 right = 5

 sum = -1 + (-1) + 2

 sum = 0

 Found Triplet:

 [-1,-1,2]

 Store result

 Move both pointers

 left = 3
 right = 4

 --------------------------------------------------

 sum = -1 + 0 + 1

 sum = 0

 Found Triplet:

 [-1,0,1]

 Store result

 Move both pointers

 left = 4
 right = 3

 Stop

 --------------------------------------------------

 Iteration 3

 i = 2

 nums[i] = -1

 Duplicate of previous value

 Skip

 --------------------------------------------------

 Final Output:

 [
   [-1,-1,2],
   [-1,0,1]
 ]

 */
