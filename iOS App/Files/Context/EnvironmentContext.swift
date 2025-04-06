import Foundation

class EnvironmentContext {
    
    public enum Environment {
        /// The app is running locally using a debug scheme
        case debug
        /// The app is running using a release scheme, either locally or in TestFlight
        case staging
        /// The app is running in production mode, as installed from the App Store
        case production
    }
    
    public static var environment: Environment {
        #if DEBUG
        return .debug
        #else
        guard !self.isSimulator else {
            return .staging
        }
        if let receiptURL = Bundle.main.appStoreReceiptURL {
            let isSandbox = receiptURL.lastPathComponent == "sandboxReceipt"
            return isSandbox ? .staging : .production
        } else {
            // If there is no receipt available (can occur on simulators in release mode)
            return .staging
        }
        #endif
    }
    
    public static var isSimulator: Bool {
        return ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] != nil
    }
    
    public static var isPreview: Bool {
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
    public static var isUnitTests: Bool {
        return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }
    
    private init() { }
    
}
