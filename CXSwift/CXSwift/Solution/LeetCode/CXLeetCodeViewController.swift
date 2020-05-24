//
//  CXLeetCodeViewController.swift
//  CXSwift
//
//  Created by mahong yang on 2020/5/24.
//  Copyright © 2020 mahong yang. All rights reserved.
//

import UIKit

class CXLeetCodeViewController: CXBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let temp = twoSum([2, 7, 11, 15], 18)
        print(temp)
    }


}

// MARK: ----------------- 1、两数之和 --------------------
/*
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。
 
 给定 nums = [2, 7, 11, 15], target = 9
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 
 链接：https://leetcode-cn.com/problems/two-sum
 */
extension CXLeetCodeViewController {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let count = nums.count
        var dic = [Int : Int]()
        for i in 0..<count {
            dic[nums[i]] = i
        }
        for i in 0..<count {
            let found = target - nums[i]
            if let j = dic[found], i != j {
                return [i, j]
            }
        }
        
        return []
    }
}
