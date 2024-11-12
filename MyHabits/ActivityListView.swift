//
//  ActivityListView.swift
//  MyHabits
//
//  Created by Saydulayev on 12.11.24.
//

import SwiftUI

struct ActivityListView: View {
    
    @State var activities: Activities
    @Binding var showingAddActivity: Bool
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1)
                .ignoresSafeArea()
            
            List {
                ForEach(activities.items) { activity in
                    NavigationLink(destination: ActivityDetailView(activity: activity, activities: activities)) {
                        Text(activity.title)
                    }
                }
                .onDelete(perform: deleteActivity)
                .onMove(perform: moveActivity)
            }
            .listStyle(.plain)
            .background(Color.blue.opacity(0.1))
        }
        .navigationTitle("Habit Tracker")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button(action: {
                    showingAddActivity = true
                }) {
                    Text("Add Activity")
                        .addActivityButtonStyle()
                }
            }
            ToolbarItem(placement: .automatic) {
                EditButton()
            }
        }
        .sheet(isPresented: $showingAddActivity) {
            AddActivityView(activities: activities)
        }
    }
    
    func deleteActivity(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
    
    func moveActivity(from source: IndexSet, to destination: Int) {
        activities.items.move(fromOffsets: source, toOffset: destination)
    }
}


extension View {
    func addActivityButtonStyle() -> some View {
        self.font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding()
            .frame(width: 250)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(.systemIndigo), Color(.systemBlue).opacity(0.9)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .shadow(color: Color.black.opacity(0.3), radius: 8, x: 4, y: 4)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}


//#Preview {
//    ActivityListView()
//}
