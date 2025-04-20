# Minimal E-commerce App

A sleek, minimalist e-commerce application built with Flutter that showcases clean architecture and effective state management. The app features a consistent black and white design theme for a modern shopping experience.

## App Screenshots

### Home Screen & Product Listing
![Home Screen](https://imgur.com/hBLxALO)

### Product Details
![Product Details](/api/placeholder/300/600?text=Product+Details)

### Shopping Cart
![Shopping Cart](/api/placeholder/300/600?text=Shopping+Cart)

### User Profile
![User Profile](/api/placeholder/300/600?text=User+Profile)

### Add/Edit Product
![Add Product](/api/placeholder/300/600?text=Add+Product)

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

## Core Implementation Details

### Data Flow
1. **Fetching Products**: The app fetches product data from the FakeStore API on startup and caches it locally
2. **Local Storage**: Products added by users are stored in IsarDB and merged with API fetched products
3. **State Management**: Provider notifies the UI about changes in product list, cart, and user data

### App Features in Action

#### Product Listing
- Dynamic grid with smooth scrolling
- Products show image, title, price, and category
- Visual indicator for locally added products

#### Product Management
- Add products with name, description, image URL, price, and category
- Edit existing locally added products
- Delete products with confirmation dialog

#### Shopping Cart
- Products maintain count independently
- Animated transitions when adding/removing items
- Real-time calculation of subtotal, taxes, and final amount

#### User Profile
- Mock user data with avatar
- Purchase history section
- Settings for theme toggle and notification preferences

## Performance Optimizations

- **Image Caching**: Products images are cached for faster loading
- **Lazy Loading**: Product details are loaded on demand
- **Efficient State Updates**: Targeted widget rebuilds with Provider
- **Responsive UI**: Adapts to different screen sizes and orientations

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

## Terminal Output When Running the App

```
$ flutter run
Launching lib/main.dart on iPhone 14 Pro in debug mode...
✓  Built build/ios/iphonesimulator/Runner.app (17.3MB)
Connecting to VM Service at ws://127.0.0.1:64889/dGj7U3UMYkQ=/ws
I/flutter (12345): 🚀 App started!
I/flutter (12345): 📱 Initializing storage...
I/flutter (12345): ✅ Storage initialized successfully
I/flutter (12345): 🔄 Fetching products from API...
I/flutter (12345): 📦 Fetched 20 products from API
I/flutter (12345): 💾 Loading local products...
I/flutter (12345): 📦 Loaded 3 local products
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
