//Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
//
//The overall run time complexity should be O(log (m+n)).
//
// 
//
//Example 1:
//
//Input: nums1 = [1,3], nums2 = [2]
//Output: 2.00000
//Explanation: merged array = [1,2,3] and median is 2.
//Example 2:
//
//Input: nums1 = [1,2], nums2 = [3,4]
//Output: 2.50000
//Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
// 
//
//Constraints:
//
//nums1.length == m
//nums2.length == n
//0 <= m <= 1000
//0 <= n <= 1000
//1 <= m + n <= 2000
//-106 <= nums1[i], nums2[i] <= 106


class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var mergedArray: [Int] = [Int]()
        let m = nums1.count - 1
        let n  = nums2.count - 1
        var i = 0, j = 0, k = 0
        while i <= m || j <= n {
            if m < 0 && n>0{
                appendAllElementsToMergeArray(targetArr: &mergedArray, sourceArr: nums2, start: j)
                break
            }
            if n < 0 && m>0{
                appendAllElementsToMergeArray(targetArr: &mergedArray, sourceArr: nums1, start: i)
                break
            }
            if i > m {
                appendAllElementsToMergeArray(targetArr: &mergedArray, sourceArr: nums2, start: j)
                break
            }
            if j > n {
                appendAllElementsToMergeArray(targetArr: &mergedArray, sourceArr: nums1, start: i)
                break
            }
            if nums1[i] <= nums2[j] {
                mergedArray.append(nums1[i])
                i = i+1
            } else if nums1[i] > nums2 [j] {
                mergedArray.append(nums2[j])
                j = j+1
            }
            k = k+1
        }
        if mergedArray.count % 2 == 0 {
            let secondindex = mergedArray.count / 2
            let result : Double = Double ((mergedArray[secondindex-1] + mergedArray[secondindex]))/2
            return result
        } else {
            let index =  (mergedArray.count - 1) / 2
            let result: Double = Double(mergedArray[index])
            return result
        }
    }
    func appendAllElementsToMergeArray(targetArr: inout [Int], sourceArr: [Int], start: Int) {
        var startIndex = start
        while (startIndex < sourceArr.count) {
            targetArr.append(sourceArr[startIndex])
            startIndex = startIndex + 1
        }
    }
}




