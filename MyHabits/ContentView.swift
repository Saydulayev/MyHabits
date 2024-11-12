//
//  ContentView.swift
//  MyHabits
//
//  Created by Saydulayev on 11.11.24.
//


import SwiftUI

struct ContentView: View {
    @State private var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationStack {
            ActivityListView(activities: activities, showingAddActivity: $showingAddActivity)
        }
    }
}


#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}

