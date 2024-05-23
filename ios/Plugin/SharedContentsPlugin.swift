import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(SharedContentsPlugin)
public class SharedContentsPlugin: CAPPlugin {

    private let implementation = SharedContents()

    @objc func writeContents(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.writeContents(value)
        ])
    }

    @objc func removeContents(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.removeContents(value)
        ])
    }

    @objc func updateWidgets(_ call: CAPPluginCall) {
        guard let valueArray = call.getArray("value", String.self) else {
                call.reject("Must provide an array of strings")
                return
            }

            call.resolve([
                "value": implementation.updateWidgets(valueArray)
            ])
    }
}
