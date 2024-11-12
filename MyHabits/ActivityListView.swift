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
            Color.blue.opacity(0.1) // Светло-синий фон для всего экрана
                .ignoresSafeArea() // Покрывает всю область, включая безопасные зоны
            
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
            .background(Color.clear) // Прозрачный фон для самой List, чтобы ZStack был виден
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
        self.font(.title2)
            .fontDesign(.serif).bold()
            .foregroundColor(.black)
                    .padding()
                    .frame(width: 250)
                    .background(
                        ZStack {
                            Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
                            
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.black)
                                .blur(radius: 4)
                                .offset(x: -8, y: -8)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .padding(2)
                            
                        })
                    .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}


//#Preview {
//    ActivityListView()
//}
