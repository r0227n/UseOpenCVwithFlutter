import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;

import 'package:path/path.dart' as path;

// FFI signature of the hello_world C function
typedef HelloWorldFunc = ffi.Void Function();
// Dart type definition for calling the C foreign function
typedef HelloWorld = void Function();

void main() {
  // Open the dynamic library
  final dylib = ffi.DynamicLibrary.open(
      '/Users/ryo/github/UseOpenCVwithFlutter/ffi/c/ffi_library/libhello.dylib');

  // Look up the C function 'hello_world'
  final HelloWorld hello = dylib
      .lookup<ffi.NativeFunction<HelloWorldFunc>>('hello_world')
      .asFunction();
  // Call the function
  hello();
}
