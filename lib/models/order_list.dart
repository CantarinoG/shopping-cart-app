import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order.dart';
import 'package:shop/utils/secrets.dart';

class OrderList with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Future<void> addOrder(Cart cart) async {
    final date = DateTime.now();
    const _baseUrl = Secrets.BASE_URL;
    final response = await http.post(Uri.parse("${_baseUrl}/orders.json"),
        body: jsonEncode(
          {
            "total": cart.totalAmount,
            "date": date.toIso8601String(),
            "products": cart.items.values
                .map((cartItem) => {
                      "id": cartItem.id,
                      "productId": cartItem.id,
                      "name": cartItem.name,
                      "quantity": cartItem.quantity,
                      "price": cartItem.price,
                    })
                .toList(),
          },
        ));

    final id = jsonDecode(response.body)['name'];
    _items.insert(
      0,
      Order(
        id: id,
        total: cart.totalAmount,
        date: date,
        products: cart.items.values.toList(),
      ),
    );
    notifyListeners();
  }
}
