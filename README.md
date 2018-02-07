# Aequilibrium

Take home assignment from Aequilibrium consisting of 2 parts. Part 1: Aequilibrium​ ​|​ ​The​ ​Castle​ ​Company, and Part 2: ​Aequilibrium​ ​|​ ​The​ ​Transformation​ ​Company.

## Part 1: Aequilibrium​

To test this, please run the Aequilibrium_TheCastleCompany.playground file in Xcode and change the stretchOfLandHeights on line 70 to an array you'd like to test. (The output should appear in the console)

```
// Please enter your heights into this variable (stretchOfLandHeights)
let stretchOfLandHeights: [Int] = [2, 6, 6, 6, 3]
```

### Assumptions

* The start of the array can be a peak/valley.
* The end of the array CANNOT be a peak/valley.


## Part 2: ​Aequilibrium​ ​|​ ​The​ ​Transformation​ ​Company

To test this, please run the Aequilibrium_TheTransformationCompany/Aequilibrium_TheTransformationCompany.xcodeproj file in Xcode and run it in a simulator.
There should be three tabs, one for viewing the battle results, one for entering Autobot information, and another for entering Decepticon information.

### Assumptions

* For the Special Condition, Optimus Prime and Predaking are case sensitive, meaning 'optimus prime' is treated as a different entity.
* The output for the "Winning Team" should only show the surviving Transformers from the winning team.
* The output for the "Survivors of Losing Team" should not show anyone for a "Tie" since both teams did not "lose". However, in the case of the Special Condition, both teams lose since all transformers are destroyed.