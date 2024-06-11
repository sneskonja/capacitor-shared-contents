import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(SharedContentsPlugin)
public class SharedContentsPlugin: CAPPlugin {

    private var implementation: SharedContents?

    override public func load() {
        self.initializeSharedContents()
    }

    private func initializeSharedContents() {
        guard let appGroup = getConfigValue("appGroup") as? String else {
            fatalError("Error: Could not get app group identifier from configuration")
        }
        self.implementation = SharedContents(groupIdentifier: appGroup)
    }

    @objc func writeContents(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        let key = call.getString("key") ?? ""
        call.resolve([
            "value": implementation?.writeContents(key, value) as Any
        ])
    }

    @objc func removeContents(_ call: CAPPluginCall) {
         let key = call.getString("key") ?? ""
         call.resolve([
            "value": implementation?.removeContents(key) as Any
         ])
    }

    @objc func updateWidgets(_ call: CAPPluginCall) {
        guard let widgetKinds = call.getArray("widgets", String.self) else {
            call.reject("Widgets array is required")
            return
        }
        call.resolve([
            "value": implementation?.updateWidgets(widgetKinds) as Any
         ])
    }
}
