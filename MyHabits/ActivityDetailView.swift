//
//  ActivityDetailView.swift
//  MyHabits
//
//  Created by Saydulayev on 11.11.24.
//

import SwiftUI

struct ActivityDetailView: View {
    var activity: Activity
    @State var activities: Activities
    @State private var showingEditSheet = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Text(activity.title)
                .activityTitleStyle()

            Divider()
                .background(Color.primary.opacity(0.2))

            Text(activity.description)
                .activityDescriptionStyle()

            Divider()
                .background(Color.primary.opacity(0.2))

            Stepper("Completion Count: \(activity.completionCount)", value: Binding(
                get: {
                    if let index = activities.items.firstIndex(of: activity) {
                        return activities.items[index].completionCount
                    }
                    return activity.completionCount // Fallback
                },
                set: { newValue in
                    if let index = activities.items.firstIndex(of: activity) {
                        activities.items[index].completionCount = newValue
                    }
                }
            ), in: 0...Int.max)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.blue).opacity(0.1))
            )
            .frame(maxWidth: 400)

            Spacer()
        }
        .padding()
        .background(
            Color(.blue).opacity(0.1)
                .ignoresSafeArea()
        )
        .navigationBarItems(trailing: Button(action: {
            showingEditSheet = true
        }, label: {
            Image(systemName: "pencil")
        }))
        .sheet(isPresented: $showingEditSheet) {
            EditActivityView(activity: activity, activities: $activities)
        }
    }
}




extension View {
    func activityTitleStyle() -> some View {
        self.font(.system(size: 28, weight: .bold, design: .default))
            .foregroundColor(.primary)
            .padding(.bottom, 4)
    }
}



extension View {
    func activityDescriptionStyle() -> some View {
        self.font(.system(size: 18, weight: .medium, design: .default))
            .foregroundColor(.secondary)
            .multilineTextAlignment(.leading)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}



#Preview {
    // Sample activity for preview purposes
    let sampleActivity = Activity(title: "Sample Activity", description: "This is a test description.", completionCount: 3)
    let sampleActivities = Activities()
    //sampleActivities.items.append(sampleActivity)

    return ActivityDetailView(activity: sampleActivity, activities: sampleActivities)
}

