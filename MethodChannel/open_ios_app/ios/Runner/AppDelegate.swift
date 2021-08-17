import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    setiOSChannel();
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    func setiOSChannel() {
        let controller : FlutterViewController = self.window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel.init(name: "com.sample.sample/sample", binaryMessenger: controller.binaryMessenger)
        channel.setMethodCallHandler({
            (call, result) -> Void in
            if call.method == "sample" {
                let nextController = controller.storyboard?.instantiateViewController(withIdentifier: "SampleViewController")
                controller.present(nextController!, animated: true, completion: nil)
            }
        })
      }
}
