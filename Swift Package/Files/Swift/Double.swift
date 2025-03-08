import Foundation

extension Double {
    
    func toString(decimalPlaces: Int = 2) -> String {
        return NSString(format: "%.\(decimalPlaces)f" as NSString, self) as String
    }
    
}
