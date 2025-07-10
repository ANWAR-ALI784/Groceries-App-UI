# 🛒 GroceryMart - Flutter Grocery Shopping App
## ✅ Features

- 🏠 Home screen with a scrollable product list
- ℹ️ Product details screen with custom arc image layout
- 🛒 Add to cart with dynamic badge update
- ✅ Cart page with item removal and total price
- 💡 State management using `Provider`
- 🎯 Clean UI using Material Design
- 🖼 Hero animations for smooth transitions

## 🛠 Tech Stack

- Flutter (Stable)
- Dart
- Provider (State Management)
- Material Design
- `badges` package for cart counter
- `lorem_ipsum` for dummy descriptions

## 📁 Folder Structure
lib/
├── models/
│ ├── item.dart
│ ├── cart.dart
│ ├── catalog.dart
│ └── catalog-provider.dart
├── screens/
│ ├── header_screen.dart
│ ├── login_screen.dart
│ ├── home_screen.dart
│ ├── cart_page.dart
│ └── product_details_screen.dart
├── widgets/
│ ├── catalog_list.dart
│ ├── item_widget.dart
│ ├── add_to_cart.dart
│ └── catalog_header.dart
├── utils/
│ ├── routes.dart
│ ├── theme.dart
└── main.dart

## 🧪 How to Run the App

```bash
git clone https://github.com/ANWAR-ALI784/Groceries-App-UI.git
cd Groceries-App-UI
flutter pub get
flutter run


📘 Technical Decisions
✅ Architecture
Used Provider as the state management solution for its simplicity and reactivity.

Mystore combines both CartModel and CatalogModel into one ChangeNotifier.

Folder structure is modularized into models, screens, widgets, and utils.

✅ Data Handling
CatalogModel holds static product data.

CartModel stores only item IDs and resolves them via CatalogModel to calculate totals and display cart items.

✅ State Management
Central Mystore provider injected via MultiProvider in main.dart.

context.watch() and context.read() used inside widgets for reactivity.

✅ UI Design
Custom ClipPath (ArcClipper) for product detail header.

Hero animation used for product image transition.

Clean, responsive layout using ListView and GridView (web support).

📕 Challenges & Solutions
⚠️ 1. Asynchronous Data Loading
Problem: Needed to simulate API call and show loading.

Solution: Used Future.delayed and displayed CircularProgressIndicator.

🧠 2. Managing Cart Reactively
Problem: How to update cart icon, cart page, and state globally.

Solution: Implemented Mystore provider with notifyListeners() after add/remove actions.

🧩 3. Hero Animation & Layout Errors
Problem: Expanded widget caused error inside Hero → ClipPath.

Solution: Replaced Expanded with fixed-size Container.

💡 4. Add to Cart Button Toggle
Problem: Needed to change icon if item already added.

Solution: Used condition: cart.items.contains(item) to toggle icon and prevent re-adding.

🛒 5. Clean Navigation Structure
Problem: Managing named routes and back navigation.

Solution: Defined all routes in utils/routes.dart and used Navigator.pushNamed.

👨‍💻 Developed By
Anwar Ali
Flutter Developer | Internship Candidate
Pakistan 🇵🇰







