# MyHabits

**MyHabits** is a habit-tracking app built with SwiftUI. It allows users to add, edit, and delete habits, as well as track their completion counts. Data is stored locally, and the UI is designed with a modern, minimalist style.

## Features

- **Add New Habits**: Create new habits with a title and description.
- **Track Completion**: Increment completion counts for each habit.
- **Edit Habit Details**: Modify the title and description of existing habits.
- **Delete and Reorder**: Delete or reorder habits within the list.
- **Data Persistence**: Habits are stored locally, so they persist across app launches.

## Key Technologies and Concepts

- **SwiftUI**: Core framework for building the UI, including components such as `NavigationStack`, `List`, `VStack`, `HStack`, `Spacer`, `TextField`, and `Button`.
- **NavigationStack**: Manages navigation flow and displays detailed habit views.
- **List**: Main component for displaying all habits, with support for deletion and reordering.
- **NavigationLink**: Enables navigation to detailed views for each habit (`ActivityDetailView`).
- **Sheet Modals**: Used to present `AddActivityView` and `EditActivityView` in modals.
- **Toolbar**: Provides buttons for adding, editing, and managing habits.
- **Stepper**: Used in `ActivityDetailView` to increment the habit’s completion count.
- **@Observable Annotation**: Automatically updates views when data changes.
- **Protocols**:
  - `Identifiable`: Displays items in lists using unique identifiers.
  - `Codable`: Serializes and deserializes data for saving habits locally.
  - `Equatable`: Compares habit objects to manage data effectively.
- **UserDefaults**: Local data storage, using `Codable` to encode and decode habit data.

## Screenshots

<p align="center">
  <img src="https://github.com/Saydulayev/MyHabits/blob/main/MyHabits/Preview%20Content/Screenshots/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202024-11-12%20at%2012.51.11.png" width="200">
  <img src="https://github.com/Saydulayev/MyHabits/blob/main/MyHabits/Preview%20Content/Screenshots/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202024-11-12%20at%2012.51.18.png" width="200">
  <img src="https://github.com/Saydulayev/MyHabits/blob/main/MyHabits/Preview%20Content/Screenshots/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202024-11-12%20at%2012.52.31.png" width="200">
</p>

## Installation

To run this project locally:
1. Clone the repository:
   ```bash
   git clone https://github.com/Saydulayev/MyHabits.git
