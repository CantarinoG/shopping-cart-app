import 'package:flutter/material.dart';
import 'package:shop/components/product_grid.dart';

enum FilterOptions { Favorite, All }

class ProductsOverviewPage extends StatelessWidget {
  ProductsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Minha Loja",
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Somente Favoritos"),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text("Todos os Produtos"),
                value: FilterOptions.All,
              )
            ],
            onSelected: (FilterOptions selectedValue) {
              print(selectedValue);
            },
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
