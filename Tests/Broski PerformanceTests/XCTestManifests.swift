import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Broski_PerformanceTests.allTests),
    ]
}
#endif
