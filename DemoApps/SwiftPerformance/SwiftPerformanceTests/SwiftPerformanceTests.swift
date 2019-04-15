import XCTest
import Foundation
@testable import SwiftPerformance



class SwiftPerformanceTests: XCTestCase {

    static let loops = 10000000

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceUnoptimizedStruct() {
        // This is an example of a performance test case.
        let testData = TestData()
        let 🐮 = [TestData()]
        let 📦 = Box<TestData>(testData)
        self.measure {
            notOptimized(testData)
//            cowOptimized(🐮: 🐮)
//            customBoxCowOptimized(🐮: 📦)
        }
        print(testData)
        print(🐮)
        print(📦)
    }

    func testPerformanceArrayOptimizedStruct() {
        // This is an example of a performance test case.
        let 🐮 = [TestData()]

        self.measure {
            cowOptimized(🐮: 🐮)
        }

        print(🐮)
    }

    func testPerformanceCustomBoxOptimizedStruct() {
        // This is an example of a performance test case.
        let 📦 = Box<TestData>(TestData())

        self.measure {
            customBoxCowOptimized(🐮: 📦)
        }

        print(📦)
    }

    fileprivate func notOptimized(_ testData: TestData) {
        for _ in 0 ... SwiftPerformanceTests.loops {
            let data1 = UnoptimizedStruct(corpus: testData)
            var data2 = data1
        }
    }

    fileprivate func cowOptimized(🐮: [TestData]) {
        for _ in 0 ..< SwiftPerformanceTests.loops {
            let data1 = ArrayOptimizedStruct(corpus: 🐮)
            var data2 = data1
        }
    }

    fileprivate func customBoxCowOptimized(🐮: Box<TestData>) {
        for _ in 0 ..< SwiftPerformanceTests.loops {
            let data1 = CustomBoxOptimized(corpus: 🐮)
            var data2 = data1
        }
    }

    struct UnoptimizedStruct {
        var corpus: TestData
    }

    struct ArrayOptimizedStruct {
        var corpus: [TestData]
    }

    struct CustomBoxOptimized {
        var corpus: Box<TestData>
    }

    struct TestData {
        static let size = 100000
        var testValue1 = String(repeating: "a", count: size)
        var testValue2 = String(repeating: "b", count: size)
        var testValue3 = String(repeating: "c", count: size)
        var testValue4 = String(repeating: "d", count: size)
    }

    final class Ref<T> {
        var val : T
        init(_ v : T) {val = v}
    }

    struct Box<T> {
        var ref : Ref<T>
        init(_ x : T) { ref = Ref(x) }

        var value: T {
            get { return ref.val }
            set {
                if (!isKnownUniquelyReferenced(&ref)) {
                    ref = Ref(newValue)
                    return
                }
                ref.val = newValue
            }
        }
    }
}
