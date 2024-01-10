import Foundation

extension FileManager {
  static func sharedContainerURL() -> URL {
    return FileManager.default.containerURL(
    // TODO: add as global config
      forSecurityApplicationGroupIdentifier: ""
    )!
  }
}

@objc public class SharedContents: NSObject {
    @objc public func writeContents(_ value: String) {
           let archiveURL = FileManager.sharedContainerURL().appendingPathComponent("contents.json")
           print(">>> \(archiveURL)")
           do {
               try value.write(to: archiveURL, atomically: true, encoding: .utf8)
           } catch {
               print("Error: Can't write contents")
            return
        }
    }
}
