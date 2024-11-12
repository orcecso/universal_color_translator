# universal_color_translator online assessment
# by Raynold Sare

   A versatile Flutter application that translates color names into their respective hexadecimal codes, featuring an intuitive interface and comprehensive color support.

Features

   - Convert common color names to hexadecimal codes
   - Real-time color preview
   - Case-insensitive input handling
   - Error handling and validation
   - Responsive design
   - Comprehensive color database

## Supported Colors
   The application supports a wide range of colors, including:

   Basic Colors

   - Red (#FF0000)
   - Green (#008000)
   - Blue (#0000FF)
   - Yellow (#FFFF00)
   - Purple (#800080)
   - Orange (#FFA500)
   - Black (#000000)
   - White (#FFFFFF)

## Extended Colors

   - Navy (#000080)
   - Aqua (#00FFFF)
   - Teal (#008080)
   - Maroon (#800000)
   - Olive (#808000)
   - Gray (#808080)
   - Silver (#C0C0C0)
   - Lime (#00FF00)

## Additional Shades

   - Pink (#FFC0CB)
   - Brown (#A52A2A)
   - Beige (#F5F5DC)
   - Cyan (#00FFFF)
   - Magenta (#FF00FF)
   - Gold (#FFD700)
   - Indigo (#4B0082)
   - Violet (#EE82EE)
   - Coral (#FF7F50)
   - Crimson (#DC143C)
   - Azure (#F0FFFF)
   - Ivory (#FFFFF0)
   - Lavender (#E6E6FA)
   - Salmon (#FA8072)
   - Turquoise (#40E0D0)



## Local Development Requirements

On `November 12, 2024`, these version combinations ran successfully in Android Studio via the default device emulator:

 * Flutter `3.24.3`
 * Dart `3.5.3`
 * Android Studio `2024.2`
 * Visual Studio Code `1.95.0`
 * Xcode `16.1`


1. **Install the Local Development Tools**: Ideally, use the versions mentioned above as they are known to work. Follow the instructions here: [Flutter Installation](https://docs.flutter.dev/get-started/install)

2. **Clone the Repository**: 
   - Clone this git repository locally
      : git clone https://github.com/yourusername/universal_color_translator.git
      : cd universal_color_translator
   - `main` branch.

3. **Install Project Dependencies**: Navigate to the project directory in the terminal and run:
   flutter pub get
   flutter run


1. **to run makefile**: choose a command and type in the command that you want:
    make **command here**
    sample : make clean or make env

1. **to run test** : flutter test


## Project Structure :

lib/
├── app/
│   ├── bindings/
│   ├── controllers/
│   ├── data/
│   ├── modules/
│   ├── routes/
│   └── utils/
├── main.dart
└── test/


**Design Decisions**

GetX State Management: Chosen for its simplicity and powerful features
Clean Architecture: Implemented for maintainability and scalability
Material Design: Used for consistent and professional UI
Reactive Programming: Implemented for real-time updates

## License
This project is licensed under the MIT License - see the LICENSE file for details.