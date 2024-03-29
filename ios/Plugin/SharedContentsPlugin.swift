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
}
