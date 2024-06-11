import Foundation
import WidgetKit

@objc public class SharedContents: NSObject {
    
    var archiveURL: URL
    
    @objc public init(groupIdentifier: String) {
        guard let containerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupIdentifier) else {
                fatalError("Error: Could not find the container URL")
        }
        self.archiveURL = containerURL.appendingPathComponent("contents.json")
        super.init()
    }
    
    @objc public func writeContents(_ key: String, _ value: String) {
        var json: [String: Any] = [:]
                
        if let data = try? Data(contentsOf: archiveURL) {
        if let existingJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                json = existingJSON
            }
        }
        json[key] = value
        do {
            let updatedData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            try updatedData.write(to: archiveURL, options: .atomic)
        } catch {
            print("Error: Can't write contents - \(error)")
        }
    }
    
    @objc public func removeContents(_ key: String) {
        var json: [String: Any] = [:]
        if let data = try? Data(contentsOf: archiveURL) {
            if let existingJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                json = existingJSON
            }
        }
        json.removeValue(forKey: key)
        do {
            let updatedData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            try updatedData.write(to: archiveURL, options: .atomic)
        } catch {
            print("Error: Can't remove contents - \(error)")
        }
    }

    @objc func updateWidgets(_ widgets: [String]) {
        if #available(iOS 14.0, *) {
            widgets.forEach { widget in
                WidgetCenter.shared.reloadTimelines(ofKind: widget)
            }
        } else {
            print("Error: Can't update widgets")
        }
    }
}
