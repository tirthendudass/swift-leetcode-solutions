//
//  ViewController.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 02/04/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let result = lengthOfLongestSubstring("abcabcbb")
        print(result)
    }
    
    //MARK: - Leetcode 1 - Two Sums
    func twoSums(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:] // value : index
            
            for (index, num) in nums.enumerated() {
                let needed = target - num
                if let foundIndex = map[needed] {
                    print([foundIndex, index])
                    return [foundIndex, index]
                }
                
                map[num] = index
                print(map)
            }
            
            return []
    }
    
    
    //MARK: - Leetcode 3 - Longest Substring Without Repeating Characters
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var lastSeen = [Character: Int]()
        let chars = Array(s)
        
        var left = 0
        var maxLength = 0
        
        for right in 0..<chars.count {
            print(right)
            let char = chars[right]
            print(char)
            // If seen before, jump left pointer
            if let index = lastSeen[char], index >= left {
                left = index + 1
            }
            
            lastSeen[char] = right
            print(lastSeen)
            maxLength = max(maxLength, right - left + 1)
            print(maxLength)
        }
        
        return maxLength
    }



}

