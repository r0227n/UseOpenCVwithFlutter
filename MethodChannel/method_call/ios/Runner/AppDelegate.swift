import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let methodChannel = FlutterMethodChannel(name: "samples.flutter.dev/function",
                                              binaryMessenger: controller.binaryMessenger)
                                     
    methodChannel.setMethodCallHandler(
      {
        [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
        // Note: this method is invoked on the UI thread.
        guard call.method == "getMethodText" else {
          result(FlutterMethodNotImplemented)
          return
        }

        // Note: this arguments is invoked on the UI thread.
        let parameters = call.arguments as? Int
        self?.calculateParameter(result: result, dartInt: parameters ?? 0)
      }
    )
        
    GeneratedPluginRegistrant.register(with: self)   
    return super.application(application, didFinishLaunchingWithOptions: launchOptions) 
  } 
  
  private func calculateParameter(result: FlutterResult, dartInt: Int) {
    result(Int(46+dartInt))
  }
}