//
//  Problems.swift
//  Leetcode
//
//  Created by Антон Сивцов on 14.08.2021.
//

import Foundation

// MARK: -  1. Two Sum
/*
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.
 */

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict: [Int: Int] = [:]
    var arr = [Int]()

    for (i, e) in nums.enumerated() {
        if let a = dict[target - e] {
            arr.append(a)
            arr.append(i)
            return arr
        }
        dict[e] = i
    }

    return []
}

// MARK: -  7. Reverse Integer
/*
 Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.
 */

func reverse(_ x: Int) -> Int {
    var x = x
    var num = 0

    while x != 0 {
        let n = x % 10
        x = x / 10
        num = num * 10 + n

        if (num > Int32.max || num < Int32.min) {
            return 0
        }
    }

    return num
}

// MARK: -  9. Palindrome Number
/*
 Given an integer x, return true if x is palindrome integer.

 An integer is a palindrome when it reads the same backward as forward. For example, 121 is palindrome while 123 is not.
 */

func isPalindrome(_ x: Int) -> Bool {
    var x = String(x)
    var arr1 = [Character]()
    var arr2 = [Character]()

    for n in x {
        var n = n
        arr1.append(n)
    }

    arr2 = arr1

    return arr1 == arr2.reversed() ? true : false
}

// MARK: - 13. Roman to Integer
/*
 Given a roman numeral, convert it to an integer
 */

func romanToInt(_ s: String) -> Int {
    let dict = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    var num = 0
    var tempNum = 0
    var tempStr = ""

    for ch in s {
        tempNum = num

        guard let dictNumber = dict[String(ch)] else { return 0 }

        num = dictNumber
        tempStr += String(ch)

        if tempStr.count > 2 {
            tempStr.removeFirst()
        }

        switch tempStr {
        case "IV": num = 3
        case "IX": num = 8
        case "XL": num = 30
        case "XC": num = 80
        case "CD": num = 300
        case "CM": num = 800
        default: break
        }

        num += tempNum
    }

    return num
}

// MARK: - 14. Longest Common Prefix
/*
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".
 */

func longestCommonPrefix(_ strs: [String]) -> String {
    let strs = strs.sorted(by: { $0.count < $1.count })
    var pref = strs[0]
    var count = 0

    guard pref != "" else { return "" }
    guard strs.count > 1 else { return strs[0] }

    while count != strs.count {
        for i in 1..<strs.count {
            if !strs[i].hasPrefix(pref) {
                pref.removeLast()
            } else {
                count += 1
                if count >= strs.count {
                    break
                }
            }
        }
    }

    return pref
}

// MARK: - 26. Remove Duplicates from Sorted Array
/*
 Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same.
 */

func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard !nums.isEmpty else { return nums.count }

    var n = 0

    while (n + 1) != nums.count {
        if nums[n] == nums[n + 1] {
            nums.remove(at: n)
        } else {
            n += 1
        }
    }

    return nums.count
}

// MARK: - 27. Remove Element
/*
 Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The relative order of the elements may be changed.
 */

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    guard !nums.isEmpty else { return nums.count }

    var n = 0

    while n != nums.count {
        if nums[n] == val {
            nums.remove(at: n)
        } else {
            n += 1
        }
    }

    return nums.count
}

// MARK: - 35. Search Insert Position
/*
 Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 */

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var nums = nums
    var num = 0

    switch true {
    case nums.contains(target):
        for (i, e) in nums.enumerated() {
            num = nums[i] == target ? i : num
        }
    default:
        nums.append(target)
        nums.sort()
        for (i, e) in nums.enumerated() {
            num = nums[i] == target ? i : num
        }
    }

    return num
}

// MARK: - 53. Maximum Subarray
/*
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 A subarray is a contiguous part of an array.
 */

func maxSubArray(_ nums: [Int]) -> Int {
    guard nums.count != 0 else { return 0 }
    guard nums.count != 1 else { return nums[0] }

    var n = nums.count
    var start = 0
    var end = 0
    var maxSum = -100000

    for i in 0..<n {
        var sum = 0
        for j in i..<n {
            sum += nums[j]
            if sum > maxSum {
                maxSum = sum
                start = i
                end = j
            }
        }
    }

    return maxSum
}

// MARK: - 58. Length of Last Word
/*
 Given a string s consisting of some words separated by some number of spaces, return the length of the last word in the string.

 A word is a maximal substring consisting of non-space characters only.
 */

func lengthOfLastWord(_ s: String) -> Int {
    guard s.contains(" ") else { return s.count }
    guard s != " " else { return 0 }

    var s = s

    while s.last == " " {
        s.removeLast()
    }

    var arr = s.flatMap {$0}

    for ch in arr {
        while arr.contains(" ") {
            if ch != " " || ch == " " {
                arr.remove(at: 0)
            }
        }
    }

    return arr.count
}

// MARK: - 66. Plus One
/*
 Given a non-empty array of decimal digits representing a non-negative integer, increment one to the integer.

 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contains a single digit.

 You may assume the integer does not contain any leading zero, except the number 0 itself.
 */

func plusOne(_ digits: [Int]) -> [Int] {
    var dig = digits
    var count = 0

    guard let digLast = dig.last else { return [] }

    switch (digLast, dig.count) {
    case (0..<9, _):
        dig[dig.count - 1] += 1
        return dig
    case (9, 1):
        return [1, 0]
    case (9, _):
        for n in 0...(dig.count - 1) {
            while dig.last == 9 {
                count += 1
                dig.removeLast()
            }
        }

        if dig.count == 1 && dig[0] == 9 {
            dig[0] = 1
        }

        if dig.isEmpty {
            dig.append(1)
        } else {
            dig[dig.count - 1] += 1
        }

        if dig.count < digits.count {
            for _ in 0...(count - 1) {
                dig.append(0)
            }
        }
        return dig
    default:
        return dig
    }
}

// MARK: - 67. Add Binary
/*
 Given two binary strings a and b, return their sum as a binary string.
 */

func addBinary(_ a: String, _ b: String) -> String {
    var a = a.map { $0 }
    var b = b.map { $0 }
    var ves: String = ""
    var carry: Bool = false

    while a.count != b.count {
        if a.count > b.count {
            b.insert("0", at: 0)
        } else {
            a.insert("0", at: 0)
        }
    }

    var i: Int = a.count - 1
    var j: Int = b.count - 1

    while (i >= 0 || j >= 0) {
        var ca: Character = Character("0")
        var cb: Character = Character("0")

        ca = i >= 0 ? a[i] : "0"
        cb = j >= 0 ? b[i] : "0"

        i -= 1
        j -= 1

        switch (ca, cb) {
        case ("1", "1"):
            if carry {
                ves += "1"
            } else {
                ves += "0"
            }

            carry = true
        case ("0", "0"):
            if carry {
                ves += "1"
            } else {
                ves += "0"
            }

            carry = false
        default:
            if carry {
                ves += "0"
            } else {
                ves += "1"
            }
        }
    }

    if carry {
        ves += "1"
    }

    return String(Array(ves).reversed() ?? [])
}

// MARK: - 69. Sqrt(x)
/*
 Given a non-negative integer x, compute and return the square root of x.
 */

func mySqrt(_ x: Int) -> Int {
     var res: Int = 0

     for i in 0..<Int.max {
         if (i * i) == x {
             res = i
             break
         } else if i * i > x && ((i - 1) * (i - 1)) < x {
             res = i - 1
             break
         } else {
             continue
         }
     }

     return res
}

// MARK: - 70. Climbing Stairs
/*
 You are climbing a staircase. It takes n steps to reach the top.
 */

func climbStairs(_ n: Int) -> Int {
    var dict: [Int: Int] = [1: 1, 2: 2]

    if let r = dict[n] {
        guard n >= 3 else { return r }
    }

    for i in 3...n {
        if let first = dict[i - 1], let second = dict[i - 2] {
            dict[i] = first + second
        }
    }

    guard let ret = dict[n] else { return 0 }

    return ret
}

// MARK: - 83. Remove Duplicates from Sorted List
/*
 Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.
 */
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    guard head?.val != nil && head?.next != nil else { return head }

    var head = head

    guard var next = head?.next, head?.val == next.val else {
        head?.next = deleteDuplicates(head?.next)
        return head
    }

    head = next
    head = deleteDuplicates(head)

    return head
}

// MARK: - 88. Merge Sorted Array
/*
 The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
 */

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var nums2 = nums2

    for _ in nums1 {
        while nums1.count != m {
            nums1.remove(at: nums1.count - 1)
        }
    }

    for i in nums1 {
        nums2.append(i)
    }

    nums1 = nums2.sorted(by: < )
}

// MARK: - 94. Binary Tree Inorder Traversal
/*
 Given the root of a binary tree, return the inorder traversal of its nodes' values.
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let val = root?.val else { return [] }

    var arr: [Int] = []

    if let left = root?.left {
        arr.append(contentsOf: inorderTraversal(left))
    }

    arr.append(val)

    if let right = root?.right {
        arr.append(contentsOf: inorderTraversal(right))
    }

    return arr
}

// MARK: - 100. Same Tree
/*
 Given the roots of two binary trees p and q, write a function to check if they are the same or not.

 Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.
 */

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    guard p?.left?.val == q?.left?.val || p?.right?.val == q?.right?.val else {
        return false
    }

    var arr1 = [Int]()
    var arr2 = [Int]()

    arr1 = inorderTraversal(p)
    arr2 = inorderTraversal(q)

    return arr1 == arr2
}

// MARK: - 118. Pascal's Triangle
/*
 Given an integer numRows, return the first numRows of Pascal's triangle.

 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:
 */

func generate(_ numRows: Int) -> [[Int]] {
    guard numRows != 1 else { return [[1]]}
    guard numRows != 2 else { return [[1], [1, 1]]}

    var resArr: [[Int]] = [[1], [1, 1]]

    for i in 2..<numRows {
        let last: [Int] = resArr[i - 1]
        var tempArr: [Int] = [1]

        for j in 1..<last.count {
            let a = last[j] + last[j - 1]
            tempArr.append(a)
        }

        tempArr.append(1)
        resArr.append(tempArr)
    }

    return resArr
}

// MARK: - 119. Pascal's Triangle II
/*
 Given an integer numRows, return the first numRows of Pascal's triangle.
 */

func getRow(_ rowIndex: Int) -> [Int] {
    let arr = generate(rowIndex + 1)
    return arr[arr.count - 1]
}

// MARK: - 121. Best Time to Buy and Sell Stock
/*
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
 */

func maxProfit(_ prices: [Int]) -> Int {
    var res = 0
    var min = prices[0]
    var max = 0

    for n in 1..<prices.count {
        switch true {
        case prices[n] < min:
            max = 0
            min = prices[n]
        case prices[n] > min && prices[n] > max:
             max = prices[n]
            var temp = max - min
            if temp > res {
                res = temp
            }
        default:
            break
        }
    }

    return res
}

// MARK: - 122. Best Time to Buy and Sell Stock II
/*
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 Find the maximum profit you can achieve. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).

 Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).
 */

func maxProfit(_ prices: [Int]) -> Int {
    var res = 0

    for i in 0..<prices.count - 1 {
        if prices[i + 1] > prices[i] {
            res += prices[i + 1] - prices[i]
        }
    }

    return res
}

// MARK: - 125. Valid Palindrome
/*
 Given a string s, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 */

func isPalindrome(_ s: String) -> Bool {
    let arrS: Array<Character> = Array(s)
    var arr = Array<Character>()
    var tempS: String = ""
    var revS: String = ""

    for i in arrS {
        if i.isLetter || i.isNumber {
            tempS.append(i.lowercased())
            arr.append(contentsOf: i.lowercased())
        }
    }

    for _ in arr {
        revS.append(arr[arr.count - 1])
        arr.removeLast()
    }

    return tempS == revS ? true : false
}

// MARK: - 136. Single Number
/*
 Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

 You must implement a solution with a linear runtime complexity and use only constant extra space.
 */

func singleNumber(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return nums[0] }

    let count = 0
    var nums = nums.sorted(by: <)

    for _ in nums {
        while nums.count != 1 {
            if nums[count] == nums[count + 1] {
                nums.remove(at: count)
                nums.remove(at: count)
            } else {
                return nums[count]
            }
        }
    }

    return nums[0]
}
