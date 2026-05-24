# Groceries Flutter App

A modern, high-performance Restaurant & Food Delivery mobile application built using **Flutter** and **Dart**. The project focuses on a highly-scalable architecture, efficient state management, and an adaptive user experience.

---

## Core Features

### 🌓 Dynamic Light & Dark Mode
*   **Zero-Lag Theme Toggle**: Seamlessly switch between Light and Dark themes across the entire app via a global reactive notifier.
*   **Smart Icons & Typography**: Custom SVG assets and texts dynamically adapt their color filters (`Theme.of(context)`) instantly without full-page rebuilts, maintaining a buttery-smooth 60/120 FPS scrolling experience.

### 🌓 Secure Authentication & State Routing using value notifiers.
*   **Centralized WidgetTree**: A smart gateway that manages the application lifecycle. It safely renders either the auth screens (`LoginPage`/`SignUpPage`) or the `MainLayout` based on the real-time login state.
*   **State-Preserved Navigation**: Utilizing `IndexedStack` inside the main layout wrapper to cache screen states and retain user scroll positions while seamlessly navigating between different tabs.

### 🌓 Atomic UI Components nvigation using value notifiers.
*   **Micro-Widgets Separation**: High code reusability by splitting screens into clean micro-components (e.g., `ProfilePicture`, `AuthTextField`, `AccountSettingsItem`).

---

## 📺 App Demo (Video Showcase)


https://github.com/user-attachments/assets/1106e2ad-e23d-4da6-acc5-930b40a0e59b



## 📁 Project Architecture & File Structure

The project strictly separates the **Data Layer** from the **Presentation Layer (UI)** to ensure scalability:

```text
lib/
│
├── data/                         #  Data Layer 
│   ├── auth/                     # Authentication data 
│   ├── account_page/             # Profile lists data arrays and setting models
│   ├── shop_page/                # Product categories and menu data items
│   ├── items.dart                # 
│   └── value_notifier.dart       # App-wide reactive listeners (isDark, isLogedNotifier , icone change ..etc)
│
└── views/                        #  Presentation Layer (User Interface)
    ├── auth/                     # Authentication Feature
    │   ├── pages/                # LoginPage, SignUpPage
    │   └── widgets/              
    │
    ├── account/                  
    │   ├── pages/                
    │   └── widgets/              
    │
    ├── main_layout.dart           
    └── widget_tree.dart           
```

---

## 🛠️ Tech Stack & Packages

*   **UI Framework:** Flutter (Material 3 enabled)
*   **State Management:** Reactive programming utilizing lightweight built-in `ValueNotifier` & `ValueListenableBuilder`.
*   **Asset Support:** `flutter_svg` for crisp, resolution-independent vector iconography.
