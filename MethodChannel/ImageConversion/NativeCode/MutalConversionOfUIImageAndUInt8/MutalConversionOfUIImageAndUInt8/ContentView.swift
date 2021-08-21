//
//  ContentView.swift
//  MutalConversionOfUIImageAndUInt8
//
//  Created by RyoNishimura on 2021/08/18.
//

import SwiftUI

struct ContentView: View {
    let image = UIImage(named: "image")!
    @State var change = UIImage(named: "icon")!

    var body: some View {
        VStack {
            Image(uiImage: image)
            Image(uiImage: change)
        }
        .onAppear(perform: {
            // UIImage -> (JPEG)Data
            let jpegData = image.jpegData(compressionQuality: 1)!
            // Data -> String(Base64)
            let base64 = jpegData.base64EncodedString()
            // String(Base64) -> Data
            let encodedBase64 = Data(base64Encoded: base64)
            // Data -> UIImage
            change = UIImage(data: encodedBase64!)!
            print(encodedBase64?.base64EncodedString())
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Data {
    /// Data型をUInt8の配列に変換
    var encodedHexadecimals: [UInt8]? {
        let responseValues = self.withUnsafeBytes({ (pointer: UnsafeRawBufferPointer) -> [UInt8] in
            let unsafeBufferPointer = pointer.bindMemory(to: UInt8.self)
            let unsafePointer = unsafeBufferPointer.baseAddress!
            return [UInt8](UnsafeBufferPointer(start: unsafePointer, count: self.count))
        })
        return responseValues
    }
}
