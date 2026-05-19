//
//  MedianOfTwoSortedArrays.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 19/05/26.
//

import Foundation

// MARK: - LeetCode 4: Median of Two Sorted Arrays

/*
 Problem:
 Given two sorted arrays nums1 and nums2
 of size m and n respectively,
 return the median of the two sorted arrays.

 The overall runtime complexity must be:
 O(log(m + n))

 Example 1:
 Input:
 nums1 = [1, 3]
 nums2 = [2]

 Output:
 2.0

 Explanation:
 Merged array:
 [1,2,3]

 Median = 2

 ----------------------------------------

 Example 2:
 Input:
 nums1 = [1,2]
 nums2 = [3,4]

 Output:
 2.5

 Explanation:
 Merged array:
 [1,2,3,4]

 Median =
 (2 + 3) / 2 = 2.5

 ----------------------------------------

 Pattern:
 - Binary Search
 - Partition Based Binary Search

 Core Idea:
 Instead of merging arrays,
 find a correct partition.

 Left half:
 smaller elements

 Right half:
 larger elements

 We need:

 max(left) <= min(right)

 ----------------------------------------

 Visual:

 nums1 = [1,3]
 nums2 = [2]

 Partition:

 [1 | 3]
 [  | 2]

 Left side:
 [1]

 Right side:
 [2,3]

 Correct partition found
 */

func findMedianSortedArrays(_ nums1: [Int],
                            _ nums2: [Int]) -> Double {

    // Always binary search
    // on smaller array

    var A = nums1
    var B = nums2

    if A.count > B.count {
        swap(&A, &B)
    }

    let total = A.count + B.count
    let half = total / 2

    // Binary search boundaries
    var left = 0
    var right = A.count

    while true {

        // Partition index for A
        let i = (left + right) / 2

        // Partition index for B
        let j = half - i

        // Left side values
        let ALeft =
        i > 0 ? A[i - 1] : Int.min

        let BLeft =
        j > 0 ? B[j - 1] : Int.min

        // Right side values
        let ARight =
        i < A.count ? A[i] : Int.max

        let BRight =
        j < B.count ? B[j] : Int.max

        /*
         Correct partition condition

         max(left) <= min(right)
         */

        if ALeft <= BRight &&
            BLeft <= ARight {

            // Odd total length
            if total % 2 != 0 {

                return Double(min(ARight, BRight))
            }

            // Even total length
            let leftMax = max(ALeft, BLeft)
            let rightMin = min(ARight, BRight)

            return Double(leftMax + rightMin) / 2.0
        }

        // Move left in A
        else if ALeft > BRight {

            right = i - 1
        }

        // Move right in A
        else {

            left = i + 1
        }
    }
}


/*
 ----------------------------------------
 DRY RUN
 ----------------------------------------

 nums1 = [1,3]
 nums2 = [2]

 Since nums1 is bigger,
 swap arrays

 A = [2]
 B = [1,3]

 total = 3
 half = 1

 left = 0
 right = 1

 ----------------------------------------
 ITERATION 1
 ----------------------------------------

 i = (0 + 1) / 2 = 0
 j = 1 - 0 = 1

 ALeft  = Int.min
 ARight = 2

 BLeft  = 1
 BRight = 3

 Check:

 ALeft <= BRight
 -∞ <= 3 -> true

 BLeft <= ARight
 1 <= 2 -> true

 Correct partition found

 ----------------------------------------

 Total length is odd

 Median =
 min(ARight, BRight)

 = min(2,3)

 = 2

 ----------------------------------------
 FINAL ANSWER:
 2.0
 ----------------------------------------
 */


/*
 ----------------------------------------
 WHY THIS WORKS
 ----------------------------------------

 We partition arrays such that:

 Left half contains:
 smaller elements

 Right half contains:
 larger elements

 If:

 max(left) <= min(right)

 Then:
 partition is valid

 ----------------------------------------
 */


/*
 Time Complexity:
 O(log(min(m,n)))

 - Binary search on smaller array

 Space Complexity:
 O(1)

 No extra space used

 where:
 m = nums1.count
 n = nums2.count
 */
