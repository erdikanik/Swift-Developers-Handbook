import UIKit

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {

    var sortedArray: [Int] = []

    var currentNum1Index = 0
    var currentNum2Index = 0

    while(true) {

        var val1 = 0
        var val2 = 0

        if currentNum1Index < nums1.count {
            val1 = nums1[currentNum1Index]
        } else {
            sortedArray.append(contentsOf: Array(nums2[currentNum2Index..<nums2.count]))
            break
        }

        if currentNum2Index < nums2.count {
            val2 = nums2[currentNum2Index]
        } else {
            sortedArray.append(contentsOf: Array(nums1[currentNum1Index..<nums1.count]))
            break
        }

        if val1 < val2 {
            sortedArray.append(val1)
            currentNum1Index += 1
        } else {
            sortedArray.append(val2)
            currentNum2Index += 1
        }
    }

    if sortedArray.count % 2 == 0 {
        let firstItem = sortedArray.count / 2 - 1
        let secondItem = sortedArray.count / 2
        let firstValue = Double(sortedArray[firstItem])
        let secondValue = Double(sortedArray[secondItem])


        return Double((firstValue + secondValue) / 2)
    } else {
        return Double(sortedArray[sortedArray.count / 2])
    }
}


findMedianSortedArrays([1, 2], [3, 4])
