# ARGreetingCard

# ARGreetingCard

An Augmented Reality (AR) app built with SwiftUI and RealityKit, allowing users to view a greeting card on their iPhone. This project follows the MVVM architecture for clean, maintainable code.

## Requirements

- **iOS Device**: An iPhone with ARKit support (iOS 13.0+).
- **Development Environment**: Xcode 12.0+ with SwiftUI support.
- **ARKit & RealityKit**: Ensure these frameworks are included in the project.

## Methodology

This project is structured using the Model-View-ViewModel (MVVM) design pattern to maintain separation of concerns, improve code readability, and facilitate testing.

### **Model**
- `GreetingCard`: Represents the greeting card's data, including the message.

### **ViewModel**
- `GreetingCardViewModel`: Manages the business logic for the greeting card, including generating the 3D card and positioning the text.

### **View**
- `ARViewContainer`: Manages the AR view, displaying the greeting card in front of the iPhone's camera.

## Acceptance Criteria

- **Greeting Card Display**: When opening the app on your iPhone, a greeting card should be visible directly in front of the camera, moving as the camera moves.

## Instructions for Using the App

1. **Clone the Repository**: 
    ```bash
    git clone https://github.com/AidanBroHar/ARGreetingCard.git
    ```
2. **Open the Project**:
    - Navigate to the project folder and open `ARGreetingCard.xcodeproj` in Xcode.
  
3. **Run the App**:
    - Connect your iPhone to your Mac.
    - Select your device as the build target in Xcode.
    - Click the Run button to build and launch the app on your iPhone.

4. **View the Greeting Card**:
    - After the app launches, hold your iPhone up to see the AR greeting card displayed in front of the camera.

## Features

- **AR Greeting Card**: A 3D greeting card displayed in Augmented Reality.
- **Text Display**: The card displays a custom message, centered within the card's bounds.
- **Camera Tracking**: The greeting card follows the camera, ensuring it stays in view.

## Screenshots

_Coming soon_

## Project Structure

- **Models**: Contains the data models (e.g., `GreetingCard`).
- **ViewModels**: Contains the logic for managing the AR experience (`GreetingCardViewModel`).
- **Views**: Contains the SwiftUI views, including the AR view container (`ARViewContainer`).



 
