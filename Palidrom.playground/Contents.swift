import Foundation
import XCTest

class Solution {
    /// Check if the real number is an palidrom.
    ///
    /// Note: without casting to `String` back and forth
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        guard x > 9 else { return true }
        
        var array: [Int] = []
        var reversed: [Int] = []
        var mutableX = x
        
        while mutableX >= 10 {
            array.append(mutableX % 10)
            reversed.insert(mutableX % 10, at: 0)
            mutableX = mutableX / 10
        }
        
        array.append(mutableX)
        reversed.insert(mutableX, at: 0)
        
        return array == reversed
    }
}

class SolutionTests: XCTestCase {
    func testSolution() {
        // Arrange
        let sut = Solution()
        // Act & Assert
        XCTAssertTrue(sut.isPalindrome(121))
        XCTAssertTrue(sut.isPalindrome(12321))
        XCTAssertFalse(sut.isPalindrome(10))
        XCTAssertFalse(sut.isPalindrome(-11))
        XCTAssertFalse(sut.isPalindrome(110))
        XCTAssertTrue(sut.isPalindrome(3))
    }
    
    
}

class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}

let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
SolutionTests.defaultTestSuite.run()
