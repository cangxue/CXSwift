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
        
//        let temp = twoSum([2, 7, 11, 15], 9)
//        print(temp)
//
//        print(shellSort([2,5,3,1,4,8,10,7,6,9]))
        
        print(removeMoreTow([0,0,0,1,1,1,2,2,2,3,3,3,4,4,5,5,5]))
    }


}
// MARK: ----------------- 数组 ------------------
extension CXLeetCodeViewController {
    func removeMoreTow(_ array:[Int]) -> [Int] {
        var res = array
        var count = 1
        var num = res.first
        for var i in 0..<res.count {
            if i >= res.count {
                break
            }
            if res[i] == num {
                count += 1
                if count > 2 {
                    res.remove(at: i)
                    i -= 1
                }
            } else {
                num = res[i]
                count = 1
            }
        }
        return res
    }
}
// MARK: ----------------- 二叉树 ------------------
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
extension CXLeetCodeViewController {
    // 前序遍历
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var res = [Int]()
        var stack = [TreeNode]()
        stack.append(root)
        while !stack.isEmpty {
            let node = stack.popLast()!
            res.append(node.val)
            
            if node.right != nil {
                stack.append(node.right!)
            }
            if node.left != nil {
                stack.append(node.left!)
            }
        }
        
        return res
    }
}

// MARK: ----------------- 链表 ------------------
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
         self.val = val
         self.next = nil
    }
}
extension CXLeetCodeViewController {
    // 从尾到头打印链表
    func reserveNode(_ head: ListNode?) -> [Int] {
        guard let head = head else {
            return []
        }
        var stack = [Int]()
        var cur: ListNode? = head
        while cur != nil {
            stack.append(cur!.val)
            cur = cur?.next
        }
        var res = [Int]()
        while stack.count > 0 {
            res.append(stack.removeLast())
        }
        
        return res
    }
    // 删除链表中节点
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard let head = head else {return nil}
        let dummyHead: ListNode = ListNode(0)
        dummyHead.next = head
        var cur: ListNode? = head
        var pre: ListNode? = nil
        while cur != nil {
            if cur!.val == val {
                if pre == nil {
                    dummyHead.next = cur!.next
                } else {
                    pre!.next = cur!.next
                }
                break
            } else {
                pre = cur
                cur = cur!.next
            }
        }
        return dummyHead.next
    }
    // 链表中倒数第k个节点
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var former: ListNode? = head
        var laster: ListNode? = head
        var num = k
        while num > 0 {
            former = former?.next
            num -= 1
        }
        
        while former != nil {
            former = former?.next
            laster = laster?.next
        }
        
        return laster
    }
    // 删除链表的倒数第 N 个节点
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummyNode = ListNode(0)
        dummyNode.next = head
        
        var former: ListNode? = dummyNode
        var laster: ListNode? = dummyNode
        var num = n - 1
        while num > 0 {
            former = former?.next
            num -= 1
        }
        while former != nil {
            former = former?.next
            laster = laster?.next
        }
        
        let delNode: ListNode? = laster?.next
        laster?.next = delNode?.next
        
        return dummyNode.next
    }
    // 反转链表
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur: ListNode? = head
        while cur != nil {
            let next: ListNode? = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
    // 两个链表的第一个公共节点
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var curA: ListNode? = headA
        var curB: ListNode? = headB
        while curA !== curB {
            curA = curA != nil ? curA?.next : headB
            curB = curB != nil ? curB?.next : headA
        }
        
        return curA
    }
}

// MARK: ----------------- 排序 ------------------
// 链接: https://www.cnblogs.com/onepixel/articles/7674659.html
extension CXLeetCodeViewController {
    /*
     1、冒泡排序（Bubble Sort）
     冒泡排序是一种简单的排序算法。它重复地走访过要排序的数列，一次比较两个元素，如果它们的顺序错误就把它们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端。

     1.1 算法描述
     比较相邻的元素。如果第一个比第二个大，就交换它们两个；
     对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对，这样在最后的元素应该会是最大的数；
     针对所有的元素重复以上的步骤，除了最后一个；
     重复步骤1~3，直到排序完成。
     
     时间复杂度 平均:O(n*n) 最坏:O(n*n) 最好:O(n)
     空间复杂度 O(1)
     稳定性 稳定
     */
    func bubbleSort(_ array: [Int]) -> [Int] {
        var arr = array
        for i in 0..<arr.count {
            for j in 0..<arr.count - (i + 1) {
                if arr[j] > arr[j+1] {
                    arr.swapAt(j, j+1)
                }
            }
        }
        
        return arr
    }
    
    /*
     2、选择排序（Selection Sort）

     选择排序(Selection-sort)是一种简单直观的排序算法。它的工作原理：首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置，然后，再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。以此类推，直到所有元素均排序完毕。

     2.1 算法描述

     n个记录的直接选择排序可经过n-1趟直接选择排序得到有序结果。具体算法描述如下：

     初始状态：无序区为R[1..n]，有序区为空；
     第i趟排序(i=1,2,3…n-1)开始时，当前有序区和无序区分别为R[1..i-1]和R(i..n）。该趟排序从当前无序区中-选出关键字最小的记录 R[k]，将它与无序区的第1个记录R交换，使R[1..i]和R[i+1..n)分别变为记录个数增加1个的新有序区和记录个数减少1个的新无序区；
     n-1趟结束，数组有序化了
     
     时间复杂度 平均:O(n*n) 最坏:O(n*n) 最好:O(n*n)
     空间复杂度 O(1)
     稳定性 不稳定
     */
    func selectionSort(_ array: [Int]) -> [Int] {
        var arr = array
        var minIndex = 0
        for i in 0..<arr.count {
            minIndex = i
            for j in i+1..<arr.count {
                if arr[j] < arr[minIndex] {
                    minIndex = j
                }
            }
            
            arr.swapAt(i, minIndex)
        }
        
        return arr
    }
    
    /*
     3、插入排序（Insertion Sort）

     插入排序（Insertion-Sort）的算法描述是一种简单直观的排序算法。它的工作原理是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。

     3.1 算法描述

     一般来说，插入排序都采用in-place在数组上实现。具体算法描述如下：

     从第一个元素开始，该元素可以认为已经被排序；
     取出下一个元素，在已经排序的元素序列中从后向前扫描；
     如果该元素（已排序）大于新元素，将该元素移到下一位置；
     重复步骤3，直到找到已排序的元素小于或者等于新元素的位置；
     将新元素插入到该位置后；
     重复步骤2~5。
     
     时间复杂度 平均:O(n*n) 最坏:O(n*n) 最好:O(n*n)
     空间复杂度 O(1)
     稳定性 不稳定
     */
    func insertionSort(_ array: [Int]) -> [Int] {
        var arr = array
        var preIndex = 0
        var current = 0
        for i in 1..<arr.count {
            preIndex = i - 1
            current = arr[i]
            
            while preIndex >= 0 && arr[preIndex] > current {
                arr[preIndex + 1] = arr[preIndex]
                preIndex -= 1
            }
            arr[preIndex + 1] = current
        }
        
        return arr
    }
    
    /*
     4、希尔排序（Shell Sort）

     1959年Shell发明，第一个突破O(n2)的排序算法，是简单插入排序的改进版。它与插入排序的不同之处在于，它会优先比较距离较远的元素。希尔排序又叫缩小增量排序。

     4.1 算法描述

     先将整个待排序的记录序列分割成为若干子序列分别进行直接插入排序，具体算法描述：

     选择一个增量序列t1，t2，…，tk，其中ti>tj，tk=1；
     按增量序列个数k，对序列进行k 趟排序；
     每趟排序，根据对应的增量ti，将待排序列分割成若干长度为m 的子序列，分别对各子表进行直接插入排序。仅增量因子为1 时，整个序列作为一个表来处理，表长度即为整个序列的长度。
     
     时间复杂度 平均:O(n*n) 最坏:O(n*n) 最好:O(n*n)
     空间复杂度 O(1)
     稳定性 不稳定
     */
    func shellSort(_ array: [Int]) -> [Int] {
        var arr = array
        var gap: Int = 1
        let base: Int = 3
        while gap < arr.count / base {
            gap = base * gap + 1
        }
        
        while gap > 0 {
            for i in gap..<arr.count {
                for j in (gap...i).reversed() {
                    if arr[j] < arr[j-gap] {
                        arr.swapAt(j, j-gap)
                    }
                }
            }
            
            gap = gap / base
        }
        
        return arr
    }
    
    /*
     5、归并排序（Merge Sort）

     归并排序是建立在归并操作上的一种有效的排序算法。该算法是采用分治法（Divide and Conquer）的一个非常典型的应用。将已有序的子序列合并，得到完全有序的序列；即先使每个子序列有序，再使子序列段间有序。若将两个有序表合并成一个有序表，称为2-路归并。

     5.1 算法描述

     把长度为n的输入序列分成两个长度为n/2的子序列；
     对这两个子序列分别采用归并排序；
     将两个排序好的子序列合并成一个最终的排序序列。
     
     时间复杂度 平均:O(n*n) 最坏:O(n*n) 最好:O(n*n)
     空间复杂度 O(1)
     稳定性 不稳定
     */
    func mergeSort(_ array: [Int]) -> [Int] {
        var arr = array
        var gap: Int = 1
        let base: Int = 3
        while gap < arr.count / base {
            gap = base * gap + 1
        }
        
        while gap > 0 {
            for i in gap..<arr.count {
                for j in (gap...i).reversed() {
                    if arr[j] < arr[j-gap] {
                        arr.swapAt(j, j-gap)
                    }
                }
            }
            
            gap = gap / base
        }
        
        return arr
    }
    
    
    func HeapSort(arr:inout Array<Int>) {
        //1.构建大顶堆
        for i in (0...(arr.count/2-1)).reversed(){
            //从第一个非叶子结点从下至上，从右至左调整结构
            self.adjustHeap(arr: &arr, i: i, length: arr.count)
        }
        //2.调整堆结构+交换堆顶元素与末尾元素
        for j in  (1...(arr.count-1)).reversed(){
            arr.swapAt(0, j)
            self.adjustHeap(arr: &arr, i: 0, length: j)//重新对堆进行调整
        }
    }
        
    /**
     * 调整大顶堆（仅是调整过程，建立在大顶堆已构建的基础上）
     */
    func adjustHeap(arr:inout Array<Int>,i:Int,length:Int){
        var i = i;
        let temp = arr[i];//先取出当前元素i
        var k=2*i+1
        while k<length {//从i结点的左子结点开始，也就是2i+1处开始
            if(k+1<length && arr[k]<arr[k+1]){//如果左子结点小于右子结点，k指向右子结点
                k+=1;
            }
            if(arr[k] > temp){//如果子节点大于父节点，将子节点值赋给父节点（不用进行交换）
                arr[i] = arr[k];
                i = k;
            }else{
                break;
            }
            k=k*2+1
        }
        arr[i] = temp;//将temp值放到最终的位置
    }
}

// MARK: ----------------- 7. 整数反转 ------------------
/*
 给你一个 32 位的有符号整数 x ，返回 x 中每位上的数字反转后的结果。

 如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。

 假设环境不允许存储 64 位整数（有符号或无符号）。
 
 输入：x = 123
 输出：321
 
 链接：https://leetcode-cn.com/problems/reverse-integer
 
 思路：
 假设输入为123, 第一次遍历: 取余x得到个位: 3 也就是翻转数的首位, num/10 得到下次遍历的x: 12, reverseNum翻转数值首位: 3
 第二次遍历: 取余x得到个位: 2, num/10 x = 1 , reverseNum翻转数值 = 32
 依次类推... 直到num = 0 退出循环

 符合题目条件返回0, 否则返回得到的翻转数
 */
extension CXLeetCodeViewController {
    func reverse(_ x: Int) -> Int {
        // 反转后的整数
        var result = 0
        var digit = x
        while digit != 0 {
            let end = digit % 10
            result = result * 10 + end
            digit /= 10
        }
        
        guard result > Int32.max || result < Int32.min else {
            return 0
        }
        
        return result
    }
}

// MARK: ----------------- 1、两数之和 ------------------
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
        var dict = [Int: Int]()
        for (i, n) in nums.enumerated() {
            if let index = dict[target - n] {
                return [i, index]
            }
            
            dict[n] = i
        }
        
        return []
    }
}
