//
//  Activity.swift
//  MyHabits
//
//  Created by Saydulayev on 11.11.24.
//

import SwiftUI

struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount: Int = 0
}

@Observable
class Activities {
    var items = [Activity]() {
        didSet {
            save()
        }
    }

    init() {
        load()
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "activities")
        }
    }

    private func load() {
        if let savedData = UserDefaults.standard.data(forKey: "activities"),
           let decoded = try? JSONDecoder().decode([Activity].self, from: savedData) {
            items = decoded
        }
    }
}

