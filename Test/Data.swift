//
//  Data.swift
//  Test
//
//  Created by student on 2/24/20.
//  Copyright © 2020 student. All rights reserved.
//

import Foundation

struct Data: Identifiable {
    var id = UUID()
    var name: String
    
    var imageName: String { return name }
}




let testData = [
    Data( name: "Basketball"),
    Data( name: "Soccer" ),
    Data( name: "Football" ),
    Data( name: "Volleyball" ),
    Data( name: "Jogging" ),
    Data( name: "Basketball" ),
    Data( name: "Rockclimbing" ),
    Data( name: "Videogame" ),
    Data( name: "Scienceproject" ),
]
