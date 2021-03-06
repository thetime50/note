# Leetcode力扣 1-300题视频讲解合集

https://www.bilibili.com/video/BV1xa411A76q


## 1. 两数之和
https://leetcode-cn.com/problems/two-sum/

给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

你可以按任意顺序返回答案。

- 暴力求和
arr\[i] + arr\[i+1 ... length] ==sum

时间复杂度 O(N<sup>2</sup>)，N 是数组中的元素数量。  
空间复杂度：O(1)

- **哈希表法**  
1. 数组k-v互换
2. 遍历数组 sum - v 
3. 通过哈希表拿到索引，并且索引不是自身(元素不能重复使用)

如果没有对应结果setmap 如果有直接返回，只在一个循环体内不一定要执行完整的循环

哈希操作 时间复杂度 O(N)，N 是数组中的元素数量。  
空间复杂度 O(N)

## 2. 两数相加
https://leetcode-cn.com/problems/add-two-numbers/

给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

请你将两个数相加，并以相同形式返回一个表示和的链表。

你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

- **迭代法**  
相加 取模取余 循环


- **递归法**  
计算item  
传递next carry 继续计算


## 3. 无重复字符的最长子串
给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

字符串内无重复字段

- **滑动窗口**  
记录end累加 记录字符出现位置  
end是重复字符 把left跳过上次出现的位置  
判断end是重复字符：  
1. end字符有被记录过
2. 并且上次出现位置>=start

## 4. 寻找两个正序数组的中位数
给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。

- **二分查找**
todo

- **划线(二分)法**

1. 位置总是 (len1+len2+1)/2, 所以划线左边数据的数量是固定的
2. 右侧总是大于等于左侧的数
3. 从left和right中间对半分，根据判断条件更新left或者right的值
4. 输入空数组处理 总个数奇偶数处理 分割线在起始/结束位置处理