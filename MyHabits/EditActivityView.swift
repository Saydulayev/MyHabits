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
    
    var disabled: Bool {
        editedTitle.count < 3
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.opacity(0.2)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 16) {
                        TextField("Title", text: $editedTitle)
                    
                    Divider()
                        .background(.primary)
                        TextField("Description", text: $editedDescription)
                }
                .padding()
                .background(Color.secondary.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
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
                        .disabled(disabled)
                    }
                }
            }
        }
    }
}

//#Preview {
//    EditActivityView()
//}
