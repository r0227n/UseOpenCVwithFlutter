import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/function",
                                              binaryMessenger: controller.binaryMessenger)
    
                                               
    batteryChannel.setMethodCallHandler(
      {
        [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
        // Note: this method is invoked on the UI thread.
        guard call.method == "getMethodText" else {
          
          
          result(FlutterMethodNotImplemented)
          return
        }
        let parameters = call.arguments as? Int
     
        self?.calculateParameter(result: result, dartInt: parameters ?? 0)
      }
    )
        
    GeneratedPluginRegistrant.register(with: self)   
    return super.application(application, didFinishLaunchingWithOptions: launchOptions) 
  } 
  
    private func calculateParameter(result: FlutterResult, dartInt: Int) {
    // let device = UIDevice.current
    // device.isBatteryMonitoringEnabled = true
    // if device.batteryState == UIDevice.BatteryState.unknown {
    //   result(FlutterError(code: "UNAVAILABLE",
    //                       message: "Battery info unavailable",
    //                       details: nil))
    // } else {
    //   result(Int(device.batteryLevel * 100))
    // }
    result(Int(46+dartInt))
  }
}
