//: Playground - noun: a place where people can play

import UIKit


/**
 Gets the number peaks and valleys given an array of integers that represent the height of a stretch of land.
 This number is needed to determine how many castles we can build in this stretch of land.
 
 - returns:
 The number of peaks and valleys
 
 - parameters:
    - heights: An array of ints representing height of a stretch of land.
 
 */
func getCastleCount(on heights: [Int]) -> Int
{
    var count = 0
    
    if !heights.isEmpty
    {
        // Start with 1 since we are always allowed to build a castle at the start of the array.
        count = 1
        
        // Check for more than 2 entries because there is no condition that a castle can be build at the end of the array.
        if heights.count > 2
        {
            // var currentHeight = 0
            var previousPointer: Int?
            
            for i in 1...heights.count - 2
            {
                let currentHeight = heights[i]
                let nextHeight = heights[i + 1]
                
                // Check if the next height in the array is the same as the current height
                // TRUE: Save the index and continue onto the next number
                // FALSE: Evaluate whether this height qualifies as a peak or a valley
                if currentHeight == nextHeight
                {
                    if previousPointer == nil {
                        previousPointer = i
                    }
                }
                else
                {
                    if currentHeight > heights[(previousPointer ?? i) - 1],
                        currentHeight > heights [i + 1]
                    {
                        count += 1
                        previousPointer = nil
                    }
                    else if currentHeight < heights[(previousPointer ?? i) - 1],
                        currentHeight < heights[i + 1]
                    {
                        count += 1
                        previousPointer = nil
                    }
                }
            }
        }
    }
    
    return count
}


// Please enter your heights into this variable (stretchOfLandHeights)
let stretchOfLandHeights: [Int] = [2, 6, 6, 6, 3]

print("The numbers of peaks and valleys:", getCastleCount(on: stretchOfLandHeights))
