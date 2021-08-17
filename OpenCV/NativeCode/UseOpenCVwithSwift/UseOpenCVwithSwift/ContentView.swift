//
//  ContentView.swift
//  UseOpenCVwithSwift
//
//  Created by RyoNishimura on 2021/08/17.
//

import SwiftUI

struct ContentView: View {
    private let grayImage = OpenCVManager.gray(UIImage(named: "icon"))!
    var body: some View {
        VStack {
            Image("icon")
            Image(uiImage: grayImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
