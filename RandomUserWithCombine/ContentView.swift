//
//  ContentView.swift
//  RandomUserWithCombine
//
//  Created by Sy Lee on 2022/04/12.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        Form {
            List(vm.randomUsers) { aRandomUser in
                UrlImageView(aRandomUser)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
