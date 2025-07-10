

# `technical_decisions.md`

# 📘 Technical Decisions

## 🏗 Architecture

- Used Provider for state management (Mystore)
- Modular structure: models, screens, widgets, utils
- Used clean separation of concerns

## 📦 Data Handling

- Product data loaded via JSON (or local list)
- Cart managed using item IDs + catalog mapping

## ⚙️ State Management

- `Mystore` acts as a single source of truth
- `notifyListeners()` updates UI dynamically

## 💡 UI

- Used Material Design
- Hero animation for product transition
- Custom clipper for product image display
