# 📕 Challenges & Solutions

## 1. Async Data Load

**Challenge:** Delay in showing product list  
**Solution:** Used `Future.delayed()` with loading indicator and clean API call

## 2. Cart State Management

**Challenge:** Keep cart synced across app  
**Solution:** Used `ChangeNotifierProvider` (Mystore) to manage cart + catalog

## 3. UI Glitches with Hero & Expanded

**Challenge:** Layout crashes with `Expanded` inside `Hero`  
**Solution:** Removed `Expanded` and used fixed-height `Container` instead


## 4. Remove Item on Tap

**Challenge:** Properly remove item from cart  
**Solution:** Called `removeItemFromCart()` and updated cart model


## 5. Add to Cart Button State

**Challenge:** Show "✔️ Done" when item already added  
**Solution:** Checked cart state using `cart.items.contains(catalog)`
