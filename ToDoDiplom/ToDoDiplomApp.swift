//
//  ToDoDiplomApp.swift
//  ToDoDiplom
//
//  Created by Student on 29.04.2022.
//

import SwiftUI

/*
 
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for View
 
 */

@main
struct ToDoDiplomApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
