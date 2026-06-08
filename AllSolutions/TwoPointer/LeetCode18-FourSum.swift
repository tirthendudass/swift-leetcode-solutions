//
//  FourSum.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 08/06/26.
//

import Foundation

// MARK: - LeetCode 18: 4Sum

/*
 Problem:

 Given an array nums
 of n integers,

 return all unique quadruplets

 [nums[a], nums[b], nums[c], nums[d]]

 such that:

 nums[a] + nums[b] +
 nums[c] + nums[d] == target

 and

 a, b, c, d are distinct indices.

 Return the answer
 in any order.

 --------------------------------------------------

 Example:

 nums = [1,0,-1,0,-2,2]

 target = 0

 Output:

 [
 [-2,-1,1,2],
 [-2, 0,0,2],
 [-1, 0,0,1]
 ]

 --------------------------------------------------

 Approach:

 This is an extension of
 the 3Sum pattern.

 Steps:

 1. Sort the array

 2. Fix first number (i)

 3. Fix second number (j)

 4. Use Two Pointers

      left  = j + 1
      right = end

 5. Calculate:

      nums[i] +
      nums[j] +
      nums[left] +
      nums[right]

 6. If sum == target

      store quadruplet

      move both pointers

      skip duplicates

 7. If sum < target

      move left

 8. If sum > target

      move right

 --------------------------------------------------

 Duplicate Handling:

 Skip duplicate values for

 - i
 - j
 - left
 - right

 This guarantees
 unique quadruplets.
 */

func fourSum(
    _ nums: [Int],
    _ target: Int
) -> [[Int]] {

    let nums = nums.sorted()

    var result = [[Int]]()

    let n = nums.count

    guard n >= 4 else {
        return []
    }

    for i in 0..<(n - 3) {

        // Skip duplicate first number
        if i > 0 &&
            nums[i] == nums[i - 1] {
            continue
        }

        for j in (i + 1)..<(n - 2) {

            // Skip duplicate second number
            if j > i + 1 &&
                nums[j] == nums[j - 1] {
                continue
            }

            var left = j + 1
            var right = n - 1

            while left < right {

                let sum =
                nums[i] +
                nums[j] +
                nums[left] +
                nums[right]

                if sum == target {

                    result.append([
                        nums[i],
                        nums[j],
                        nums[left],
                        nums[right]
                    ])

                    left += 1
                    right -= 1

                    // Skip duplicates
                    while left < right &&
                            nums[left] ==
                            nums[left - 1] {

                        left += 1
                    }

                    while left < right &&
                            nums[right] ==
                            nums[right + 1] {

                        right -= 1
                    }

                } else if sum < target {

                    left += 1

                } else {

                    right -= 1
                }
            }
        }
    }

    return result
}

// MARK: - Time and Space Complexity

/*
 Time Complexity:

 O(n³)

 Sorting = O(n log n)

 Outer Loop (i) = O(n)

 Inner Loop (j) = O(n)

 Two Pointers = O(n)

 Total:

 O(n³)

 --------------------------------------------------

 Space Complexity:

 O(1)

 Ignoring output array.

 Sorting may use
 O(log n) stack space
 depending on implementation.
 */

// MARK: - Dry Run

/*
 Input:

 nums = [1,0,-1,0,-2,2]

 target = 0

 --------------------------------------------------

 Sort

 [-2,-1,0,0,1,2]

 --------------------------------------------------

 i = -2

 j = -1

 left = 0
 right = 2

 Sum

 -2 + -1 + 0 + 2

 = -1

 Too small

 Move left

 --------------------------------------------------

 left = 0 (second zero)

 Sum

 -2 + -1 + 0 + 2

 = -1

 Too small

 Move left

 --------------------------------------------------

 left = 1

 Sum

 -2 + -1 + 1 + 2

 = 0

 Found:

 [-2,-1,1,2]

 --------------------------------------------------

 j = 0

 left = 0
 right = 2

 Sum

 -2 + 0 + 0 + 2

 = 0

 Found:

 [-2,0,0,2]

 --------------------------------------------------

 i = -1

 j = 0

 left = 0
 right = 2

 Sum

 -1 + 0 + 0 + 2

 = 1

 Too large

 Move right

 --------------------------------------------------

 right = 1

 Sum

 -1 + 0 + 0 + 1

 = 0

 Found:

 [-1,0,0,1]

 --------------------------------------------------

 Final Output

 [

 [-2,-1,1,2],

 [-2,0,0,2],

 [-1,0,0,1]

 ]
 */
