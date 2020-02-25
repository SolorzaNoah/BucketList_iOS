//
//  ContentView.swift
//  Test
//
//  Created by student on 2/24/20.
//  Copyright © 2020 student. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var datas:[Data] = []
    var body: some View {
        NavigationView {
            List(datas) { data in
                NavigationLink(destination:Text("Random Description")){
                VStack (alignment:.leading){
                    Text(data.name)
                    Text("Random Description")
                .font(.subheadline)
                .foregroundColor(.secondary)
                    
                }
            }.navigationBarTitle("Bucketlist")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(datas: testData)
    }
}
