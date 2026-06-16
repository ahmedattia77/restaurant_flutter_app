# 🛒 Groceries Flutter App

A modern, high-performance Groceries mobile application built using **Flutter** and **Dart**. The project focuses on a highly-scalable architecture, efficient state management, and an adaptive user experience.

---

## 🌟 Core Features

### 🌓 Dynamic Light & Dark Mode
*   **Zero-Lag Theme Toggle**: Seamlessly switch between Light and Dark themes across the entire app via a global reactive notifier.
*   **Smart Icons & Typography**: Custom SVG assets and texts dynamically adapt their color filters (`Theme.of(context)`) instantly without full-page rebuilds, maintaining a buttery smooth scrolling experience.

### 🎨✨ AuthBackground Widget
*   A beautiful, modern, and reusable background widget. It creates a stunning **Glow / Glassmorphism** effect using layered shapes and blurred filters, perfect for Authentication (Login/Signup) screens.
*   **Modern UI:** Implements a soft, glowing gradient background using `BackdropFilter`.
*   **Highly Responsive:** Uses flexible positions that adapt to different screen sizes.

### 🚀 Seamless User Onboarding
*   **Immersive Introduction**: A visually rich `Onboarding` screen featuring fullscreen background optimization (`BoxFit.cover`) and edge-to-edge rendering by making system navigation and status bars completely transparent.
*   **Smart Navigation**: Integrated with persistent route replacements to ensure a one-way trip into the application lifecycle without stack redundancy.

### 🛍️ Dynamic Shopping & Product Exploration
*   **Home Dashboard**: A clean storefront displaying localized categorizations, best-selling repositories, and exclusive offers fetched through isolated data layers.
*   **Interactive Image Slider**: A custom, touch-optimized `ShoppingImageSlider` combining a fluid `PageView.builder` with an automated, responsive dot-indicator layout.
*   **Product Details Experience**: An extensive single product presentation page containing smooth stateful counter logic for live price calculation, customizable animated `ExpansionTileView` for data descriptions, and real-time rating review elements.

### 🔐 Secure Authentication & State Routing
*   **Centralized WidgetTree**: A smart gateway that manages the application lifecycle. It safely renders either the auth screens (`LoginPage`/`SignUpPage`) or the `MainLayout` based on the real-time login state using lightweight `ValueNotifier` hooks.
*   **State-Preserved Navigation**: Utilizing `IndexedStack` inside the main layout wrapper to cache screen states and retain user scroll positions while seamlessly navigating between different tabs.

---

## 📺 App Demo (Video Showcase) WARRING the video is pexeled becuas the resoulation must upload less than 10MB

https://github.com/user-attachments/assets/2e8847fd-532d-4902-bb40-a9eddfc3ca55




---

## 📁 Project Architecture & File Structure

The project strictly separates the **Data Layer** from the **Presentation Layer (UI)** adhering to clean architectural boundaries and OOP/OOD design patterns:

```text
lib/
│
├── constants/                    # Global app styling configuration, theme setup & assets
├── data/                         #  Data Layer (Models & Repositories)
│   ├── account_page/             # Profile lists data arrays and setting models
│   │   └── account_settings.dart 
│   ├── auth/                     # Authentication data mechanisms
│   │   └── value_notifier.dart   
│   ├── shop/                     # Shop feature data models and item suppliers
│   │   ├── model/                # Base, Groceries, and Shopping data shapes
│   │   │   ├── base_model.dart
│   │   │   ├── groceries_model.dart
│   │   │   └── shopping_model.dart
│   │   └── repository/           # Isolated data fetching points (Best Selling, Exclusive Offers)
│   │       ├── best_selling_repository.dart
│   │       ├── exclusive_offer_repository.dart
│   │       ├── groceries_product_repository.dart
│   │       └── groceries_repository.dart
│   └── items.dart                
│
└── views/                        #  Presentation Layer (User Interface & Micro-Widgets)
    ├── account/                  # Account & Profile management feature
    │   ├── pages/                
    │   │   └── account_page.dart
    │   └── widgets/              
    │       └── account_settings_item.dart
    ├── auth/                     #     Authentication Screens
    │   ├── pages/                # LoginPage, SignUpPage
    │   └── widgets/              
    ├── home/                     # Home Storefront Screen
    │   ├── pages/                
    │   └── widgets/              
    ├── onboarding/               # Application Introduction Flow
    │   ├── pages/                # OnboardingScreen
    │   └── widgets/              
    ├── shoping/                  # Shopping Catalog & Item details feature
    │   ├── pages/                # ProductPage
    │   └── widgets/              # CounterView, ExpansionTileView, ShoppingImageSlider
    ├── main_layout.dart           
    └── widget_tree.dart           
```

---

## 🛠️ Tech Stack & Packages

*   **UI Framework:** Flutter (Material 3 enabled)
*   **Language:** Dart (Strict OOP/OOD Patterns)
*   **State Management:** Reactive programming utilizing lightweight built-in `ValueNotifier` & `ValueListenableBuilder`.
