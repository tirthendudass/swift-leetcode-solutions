//
//  ThreeSumClosest.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 05/06/26.
//

import Foundation

// MARK: - LeetCode 16: 3Sum Closest

/*
 Problem:

 Given an integer array nums
 and an integer target,

 find three integers in nums such that
 the sum is closest to target.

 Return the sum of the three integers.

 You may assume that each input
 would have exactly one solution.

 Example:

 nums = [-1,2,1,-4]
 target = 1

 Output:
 2

 Explanation:

 (-1 + 2 + 1) = 2

 2 is the closest sum to target 1.

 --------------------------------------------------

 Approach:

 - Sort the array first
 - Fix one element using a loop
 - Use Two Pointers to find remaining two numbers
 - Calculate current sum
 - Compare with closest sum found so far
 - Update closest sum if needed
 - If sum < target:
      Move left pointer
 - If sum > target:
      Move right pointer
 - If sum == target:
      Exact answer found
      Return immediately

 Time Complexity becomes O(n²)
 */

func threeSumClosest(
    _ nums: [Int],
    _ target: Int
) -> Int {

    // Sort array
    let nums = nums.sorted()

    // Initial closest sum
    var closestSum =
    nums[0] + nums[1] + nums[2]

    // Fix first element
    for i in 0..<nums.count - 2 {

        var left = i + 1
        var right = nums.count - 1

        while left < right {

            let currentSum =
            nums[i] +
            nums[left] +
            nums[right]

            // Update closest sum
            if abs(target - currentSum)
                < abs(target - closestSum) {

                closestSum = currentSum
            }

            // Exact match found
            if currentSum == target {

                return currentSum

            } else if currentSum < target {

                left += 1

            } else {

                right -= 1
            }
        }
    }

    return closestSum
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

 Ignoring sorting space,
 no extra space is used.
 */

// MARK: - Dry Run

/*
 Input:

 nums = [-1,2,1,-4]
 target = 1

 --------------------------------------------------

 Step 1:

 Sort Array

 [-4,-1,1,2]

 --------------------------------------------------

 Initial Closest Sum

 = -4 + (-1) + 1

 = -4

 closestSum = -4

 --------------------------------------------------

 Iteration 1

 i = 0

 nums[i] = -4

 left = 1
 right = 3

 --------------------------------------------------

 currentSum

 = -4 + (-1) + 2

 = -3

 Difference from target

 |1 - (-3)| = 4

 Difference from closestSum

 |1 - (-4)| = 5

 Update:

 closestSum = -3

 --------------------------------------------------

 currentSum < target

 Move left

 left = 2

 --------------------------------------------------

 currentSum

 = -4 + 1 + 2

 = -1

 Difference

 |1 - (-1)| = 2

 Better than previous

 Update:

 closestSum = -1

 --------------------------------------------------

 currentSum < target

 Move left

 left = 3

 Stop

 --------------------------------------------------

 Iteration 2

 i = 1

 nums[i] = -1

 left = 2
 right = 3

 --------------------------------------------------

 currentSum

 = -1 + 1 + 2

 = 2

 Difference

 |1 - 2| = 1

 Better than previous

 Update:

 closestSum = 2

 --------------------------------------------------

 currentSum > target

 Move right

 right = 2

 Stop

 --------------------------------------------------

 Final Answer

 closestSum = 2

 Output:

 2

 */
