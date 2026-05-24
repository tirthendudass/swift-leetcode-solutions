//
//  ContainerWithMostWater.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 24/05/26.
//

import Foundation

// MARK: - LeetCode 11: Container With Most Water

/*
 Problem:
 Given an integer array height where each element
 represents the height of a vertical line,
 find two lines that together with the x-axis
 form a container that holds the maximum water.

 Return the maximum amount of water a container can store.

 Example:
 height = [1,8,6,2,5,4,8,3,7]

 Output:
 49

 --------------------------------------------------

 Approach:
 - Use Two Pointer technique
 - Start:
      left  -> beginning of array
      right -> end of array
 - Calculate:
      width  = right - left
      height = minimum of both lines
      area   = width * height
 - Update maximum area
 - Move pointer pointing to smaller height
      because smaller height limits the water capacity
 - Continue until pointers meet

 This gives O(n) time complexity.
 */

func maxArea(_ height: [Int]) -> Int {

    // Left pointer
    var left = 0

    // Right pointer
    var right = height.count - 1

    // Store maximum area found
    var maxWater = 0

    // Continue until pointers meet
    while left < right {

        // Width between lines
        let width = right - left

        // Minimum height determines water level
        let minHeight = min(height[left], height[right])

        // Current area
        let currentArea = width * minHeight

        // Update maximum area
        maxWater = max(maxWater, currentArea)

        // Move the smaller height pointer
        if height[left] < height[right] {

            left += 1

        } else {

            right -= 1
        }
    }

    return maxWater
}

// MARK: - Time and Space Complexity

/*
 Time Complexity:
 O(n)
 - We traverse the array once using two pointers

 Space Complexity:
 O(1)
 - No extra space used
 */

// MARK: - Dry Run

/*
 Input:
 height = [1,8,6,2,5,4,8,3,7]

 --------------------------------------------------

 Initial State:

 left = 0
 right = 8
 maxWater = 0

 --------------------------------------------------

 Iteration 1:

 height[left]  = 1
 height[right] = 7

 width = 8 - 0
 width = 8

 minHeight = min(1,7)
 minHeight = 1

 area = 8 * 1
 area = 8

 maxWater = 8

 Move smaller height pointer:
 1 < 7

 left += 1

 --------------------------------------------------

 Iteration 2:

 left = 1
 right = 8

 height[left]  = 8
 height[right] = 7

 width = 8 - 1
 width = 7

 minHeight = min(8,7)
 minHeight = 7

 area = 7 * 7
 area = 49

 maxWater = 49

 Move smaller height pointer:
 7 < 8

 right -= 1

 --------------------------------------------------

 Iteration 3:

 left = 1
 right = 7

 height[left]  = 8
 height[right] = 3

 width = 7 - 1
 width = 6

 minHeight = 3

 area = 6 * 3
 area = 18

 maxWater remains 49

 Move smaller height pointer:
 3 < 8

 right -= 1

 --------------------------------------------------

 Continue similarly...

 Final Output:
 49

 --------------------------------------------------

 Best Container:
 height[1] = 8
 height[8] = 7

 width = 7
 minHeight = 7

 area = 7 * 7 = 49
 */
