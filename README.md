# Rick and Morty Character App

![App Screenshot](path-to-your-screenshot.png)

## Description

The Rick and Morty Character App is a Flutter application that displays all characters from the popular TV show "Rick and Morty". Users can view detailed information about each character. The app is built using the MVVM (Model-View-ViewModel) architecture and utilizes the BLoC (Business Logic Component) pattern for state management.

## Features

- Display a list of all characters from the Rick and Morty series.
- View detailed information about each character, including name, status, species, and more.
- Search for characters by name.
- Responsive design suitable for both mobile and tablet screens.

## Screenshots

![Character List](path-to-your-screenshot-list.png)
![Character Details](path-to-your-screenshot-details.png)

## Architecture

The app follows the MVVM architecture pattern:

- **Model:** Represents the data layer. This includes data classes and data sources.
- **View:** Represents the UI layer. This includes Flutter widgets that display data to the user.
- **ViewModel:** Acts as a mediator between the View and the Model. It retrieves data from the Model and provides it to the View. It also handles user interactions and business logic.

## State Management

The app uses the BLoC pattern for state management:

- **BLoC:** Manages the state of the application and handles business logic. It receives events, processes them, and outputs states.
- **Events:** User actions that are dispatched to the BLoC.
- **States:** The state of the application that is emitted by the BLoC in response to events.

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- A code editor such as [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/rick-and-morty-app.git
   cd rick-and-morty-app
