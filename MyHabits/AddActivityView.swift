//
//  AddView.swift
//  MyHabits
//
//  Created by Saydulayev on 11.11.24.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var description = ""
    @State var activities: Activities

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add New Activity")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button("Save") {
                        let activity = Activity(title: title, description: description)
                        activities.items.append(activity)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}


//#Preview {
//    AddActivityView(activities: Habits())
//}
