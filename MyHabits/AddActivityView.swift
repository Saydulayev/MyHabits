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
            ZStack {
                Color.blue.opacity(0.2)
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 16) {
                    TextField("Title", text: $title)
                    Divider()
                        .background(.primary)
                    TextField("Description", text: $description)
                }
                .padding()
                .background(Color.secondary.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
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
}


//#Preview {
//    AddActivityView(activities: Habits())
//}
