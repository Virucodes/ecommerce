# ✨ Minimal E-commerce App

A sleek, minimalist e-commerce application built with Flutter that showcases clean architecture and effective state management. The app features a consistent black and white design theme for a modern shopping experience.

[![GitHub](https://img.shields.io/badge/GitHub-Repository-black?style=for-the-badge&logo=github)](https://github.com/Virucodes/ecommerce)
[![Flutter](https://img.shields.io/badge/Flutter-2.10+-blue?style=for-the-badge&logo=flutter)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-2.16+-blue?style=for-the-badge&logo=dart)](https://dart.dev/)

## 📱 App Showcase

Row 1: Main Screens
<p align="center">
  <img src="https://i.imgur.com/ybmTd07.jpeg" width="200" alt="🏠 Intro Page">
  <img src="https://i.imgur.com/QRkvDXw.jpeg" width="200" alt="🔍 Product Details">
  <img src="https://i.imgur.com/a7c4WKl.jpeg" width="200" alt="🛒 Shopping Cart">
  <img src="https://i.imgur.com/uQTSeoy.jpeg" width="200" alt="📋 Drawer Menu">
</p>
Row 2: Management Screens
<p align="center">
  <img src="https://i.imgur.com/gir8u1m.jpeg" width="200" alt="➕ Add New Product">
  <img src="https://i.imgur.com/hZ3AeAy.jpeg" width="200" alt="👤 User Profile">
  <img src="https://i.imgur.com/Sp5uCA9.jpeg" width="200" alt="📝 Update Product">
  <img src="https://i.imgur.com/Bf2Yx5N.jpeg" width="200" alt="✏️ Edit Product">
</p>

## ✨ Features

### 🏬 Product Experience
- **📊 Product Listing**: Elegant grid presentation of products from FakeStore API with smooth scrolling animations
- **🔍 Product Details**: Immersive product view with high-resolution images and comprehensive information
- **🛠️ Product Management**: Intuitive interface to add, edit, and remove your own products

### 🛒 Shopping Experience
- **🛍️ Smart Cart**: Seamlessly add products with beautiful transition animations
- **🧮 Dynamic Calculations**: Real-time price updates as you modify your cart
- **💳 Checkout Flow**: Streamlined process with order summary

### 👤 User Experience
- **👤 Profile Management**: Personalized user dashboard with mock data visualization
- **🎨 Aesthetic Design**: Consistent black and white theme creating a premium feel
- **⚡ Performance**: Optimized for smooth interactions and minimal load times

### 💾 Technical Excellence
- **📱 Responsive Design**: Perfect layout across all screen sizes
- **🔄 Offline Capability**: IsarDB integration for local data persistence
- **🧩 Modular Architecture**: Clean separation of concerns following best practices

## 🛠️ Tech Stack

<table>
  <tr>
    <td align="center"><img src="https://img.icons8.com/color/48/000000/flutter.png" width="30"/><br/>Flutter</td>
    <td align="center"><img src="https://img.icons8.com/color/48/000000/dart.png" width="30"/><br/>Dart</td>
    <td align="center">📦<br/>Provider</td>
    <td align="center">💾<br/>IsarDB</td>
    <td align="center">🌐<br/>HTTP</td>
    <td align="center">🔌<br/>FakeStore API</td>
  </tr>
</table>

## 🚀 Installation

### Prerequisites

- Flutter SDK (2.10.0 or higher)
- Dart SDK (2.16.0 or higher)
- Android Studio / VS Code with Flutter extensions

### 📋 Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Virucodes/ecommerce.git
   ```

2. **Navigate to project directory:**
   ```bash
   cd ecommerce
   ```

3. **Install dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```

### 🗄️ Setting up IsarDB

The app uses IsarDB for local storage. When you first run the app, IsarDB will automatically initialize and create the necessary database structures for seamless offline capabilities.


## 🔄 Core Implementation Details

### Data Flow Architecture
1. **🌐 API Integration**: The app communicates with FakeStore API using an efficient request caching system
2. **💾 Persistent Storage**: Products and user preferences are seamlessly stored in IsarDB
3. **🔄 State Synchronization**: Provider ensures UI stays in sync with the underlying data model

### ✨ App Features In Detail

#### 🏬 Product Showcase
- **🖼️ Visual Experience**: High-resolution product images with optimized loading
- **🧠 Smart Categories**: Intelligent product categorization and filtering
- **🏷️ Local Indicators**: Visual distinctions for products you've added personally

#### 🛠️ Product Management System
- **📝 Form Validation**: Comprehensive validation for all product information fields
- **🖼️ Image Preview**: Real-time preview of product images during addition/editing
- **🗑️ Safe Deletion**: Confirmation dialogs to prevent accidental product removal

#### 🛒 Smart Shopping Cart
- **📊 Quantity Controls**: Intuitive interface for adjusting product quantities
- **💰 Price Breakdown**: Detailed view of subtotal, taxes, and total amount
- **💾 Persistent Cart**: Cart contents preserved across app sessions

#### 👤 User Experience
- **👤 Profile Customization**: Options to personalize user information
- **📊 Purchase Analytics**: Visual representation of shopping history
- **🌓 Theme Options**: Toggle between light and dark modes while maintaining the black and white aesthetic

## ⚡ Performance Optimizations

- **🖼️ Smart Image Loading**: Progressive and cached image loading for faster UI rendering
- **📱 UI Responsiveness**: Adaptive layouts that respond perfectly to different screen sizes
- **🧠 Memory Management**: Efficient resource allocation for smooth performance
- **⚡ Lazy Loading**: On-demand content loading to minimize initial load time

## 📖 Usage Guide

### 🏬 Product Exploration
- Browse the elegant grid of products from FakeStore API
- Tap any product to dive into detailed information
- Pull down to refresh and discover the latest additions

### 🛠️ Product Management
- Tap the "+" floating action button to add your own products
- Access edit and delete options for products you've added
- See your products seamlessly integrated with the catalog

### 🛒 Shopping Experience
- Add products to your cart with a simple tap
- Manage your cart through the dedicated cart screen
- Watch the total dynamically update as you shop

### 👤 User Profile
- Explore your personalized profile page
- View your mock shopping history and statistics
- Customize your experience through available settings

## 💻 Terminal Output

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

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📜 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

<div align="center">
  <p>Built with ❤️ by <a href="https://github.com/Virucodes">Virucodes</a></p>
  <p>
    <a href="https://github.com/Virucodes"><img src="https://img.shields.io/github/followers/Virucodes?label=Follow&style=social" alt="GitHub followers"></a>
  </p>
</div>
