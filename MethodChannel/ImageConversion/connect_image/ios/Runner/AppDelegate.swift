import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let methodChannel = FlutterMethodChannel(name: "samples.flutter.dev/image",
                                              binaryMessenger: controller.binaryMessenger)
                                     
    methodChannel.setMethodCallHandler(
      {
        [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in

        guard call.method == "getBase64" else {
          result(FlutterMethodNotImplemented)
          return
        }

        let parameters = call.arguments 
        result(parameters)
      }
    )
        
    GeneratedPluginRegistrant.register(with: self)   
    return super.application(application, didFinishLaunchingWithOptions: launchOptions) 
  } 
}
