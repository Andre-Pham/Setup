import Foundation

func assertOutsideUnitTests(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
    #if DEBUG
    if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil {
        assert(condition(), message(), file: file, line: line)
    }
    #endif
}

func assertionFailureOutsideUnitTests(_ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
    #if DEBUG
    if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil {
        assertionFailure(message(), file: file, line: line)
    }
    #endif
}

func assertDuringUnitTests(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
    #if DEBUG
    if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
        assert(condition(), message(), file: file, line: line)
    }
    #endif
}

func assertionFailureDuringUnitTests(_ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
    #if DEBUG
    if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
        assertionFailure(message(), file: file, line: line)
    }
    #endif
}

