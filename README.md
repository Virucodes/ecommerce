# Minimal E-commerce App

A sleek, minimalist e-commerce application built with Flutter that showcases clean architecture and effective state management. The app features a consistent black and white design theme for a modern shopping experience.

![App Screenshot](https://via.placeholder.com/800x400?text=Minimal+E-commerce+App)

## Features

- **Product Listing**: Fetch and display products from FakeStore API in a clean, responsive grid layout
- **Product Management**: Add new products locally with a FloatingActionButton
- **Product Operations**: Edit and delete locally added products
- **Shopping Cart**: Add/remove products with real-time total calculation
- **User Profile**: Basic profile page with mock user data and interactive elements
- **Local Storage**: Persistent storage using IsarDB for offline product management
- **State Management**: Efficient state handling with Provider

## Tech Stack

- Flutter & Dart
- Provider for state management
- IsarDB for local storage
- HTTP package for API calls
- FakeStore API for product data

## Installation

### Prerequisites

- Flutter SDK (2.10.0 or higher)
- Dart SDK (2.16.0 or higher)
- Android Studio / VS Code with Flutter extensions

### Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/minimal_ecommerce_app.git
   ```

2. Navigate to project directory:
   ```bash
   cd minimal_ecommerce_app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

### Setting up IsarDB

The app uses IsarDB for local storage. When you first run the app, IsarDB will automatically initialize and create the necessary database structures.

## Project Structure

```
lib/
├── main.dart                  # Entry point
├── config/                    # App configuration
│   └── theme.dart             # Black & white theme
├── models/                    # Data models
│   ├── product.dart
│   ├── cart_item.dart
│   └── user.dart
├── providers/                 # State management
│   ├── product_provider.dart
│   ├── cart_provider.dart
│   └── user_provider.dart
├── screens/                   # App screens
│   ├── home_screen.dart
│   ├── product_detail_screen.dart
│   ├── cart_screen.dart
│   ├── profile_screen.dart
│   └── add_edit_product_screen.dart
├── services/                  # Business logic
│   ├── api_service.dart
│   └── storage_service.dart
└── widgets/                   # Reusable UI components
    ├── product_card.dart
    ├── cart_item_card.dart
    └── custom_app_bar.dart
```

## Usage Guide

### Product Listing
- Browse products fetched from FakeStore API on the home screen
- Tap on any product to view details
- Pull to refresh the product list

### Product Management
- Add new products using the + FloatingActionButton in the bottom-right corner
- Edit your added products by tapping the edit icon on the product card
- Delete your added products with the delete icon (only visible for locally added products)

### Shopping Cart
- Add products to cart from product details page
- View cart by tapping the cart icon in the app bar
- Increase/decrease product quantity or remove items from cart
- View real-time cart total at the bottom of the cart screen

### User Profile
- Access the profile page from the bottom navigation bar
- View mock user data and statistics
- Toggle between light and dark themes (both maintaining the black & white aesthetic)

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
