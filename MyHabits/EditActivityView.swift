//
//  EditActivityView.swift
//  MyHabits
//
//  Created by Saydulayev on 12.11.24.
//

import SwiftUI

struct EditActivityView: View {
    var activity: Activity
    @Binding var activities: Activities
    @State private var editedTitle: String
    @State private var editedDescription: String
    @Environment(\.dismiss) private var dismiss

    init(activity: Activity, activities: Binding<Activities>) {
        self.activity = activity
        self._activities = activities
        _editedTitle = State(initialValue: activity.title)
        _editedDescription = State(initialValue: activity.description)
    }

    var body: some View {
        ZStack {
            Color.blue.opacity(0.1)
                .ignoresSafeArea()

            NavigationView {
                Form {
                    Section(header: Text("Edit Title")) {
                        TextField("Title", text: $editedTitle)
                    }

                    Section(header: Text("Edit Description")) {
                        TextField("Description", text: $editedDescription)
                    }
                }
                .scrollContentBackground(.hidden) // Убираем стандартный фон Form
                .background(Color.clear) // Прозрачный фон для Form
                .navigationTitle("Edit Activity")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            if let index = activities.items.firstIndex(of: activity) {
                                activities.items[index].title = editedTitle
                                activities.items[index].description = editedDescription
                            }
                            dismiss()
                        }
                    }
                }
            }
            .background(Color.clear) // Прозрачный фон для NavigationView
        }
    }
}

//#Preview {
//    EditActivityView()
//}
