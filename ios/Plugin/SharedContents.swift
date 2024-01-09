import Foundation

@objc public class SharedContents: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
