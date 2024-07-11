// import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/model/product.dart';

// Notifier Providers
// use when you need to update the state & notify consumers

// class CartNotifier extends Notifier<Set<Product>> {
//   @override
//   Set<Product> build() {
//     return const {
//       Product(
//           id: '4',
//           title: 'Red Backpack',
//           price: 14,
//           image: 'assets/products/backpack.png'),
//     };
//   }

//   // methods to update state
// }

// final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
//   return CartNotifier();
// });
//
//

class CartNotifier extends Notifier<Set<Product>> {
  Set<Product> build() {
    return const {
      Product(
          id: '4',
          title: 'Red Backpack',
          price: 14,
          image: 'assets/products/backpack.png')
    };
  }

  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(
  () {
    return CartNotifier();
  },
);
