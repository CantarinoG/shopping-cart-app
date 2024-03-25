import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUCT_FORM,
                  arguments: product,
                );
              },
              icon: Icon(Icons.edit),
              color: Theme.of(context).colorScheme.primary,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: Text("Excluir Produto"),
                          content: Text("Tem certeza?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                return Navigator.of(ctx).pop();
                              },
                              child: Text("Não"),
                            ),
                            TextButton(
                              onPressed: () async {
                                try {
                                  await Provider.of<ProductList>(context,
                                          listen: false)
                                      .removeProduct(product);
                                  return Navigator.of(ctx).pop();
                                } catch (error) {
                                  Navigator.of(ctx).pop();
                                  msg.showSnackBar(SnackBar(
                                      content: Text(error.toString())));
                                }
                              },
                              child: Text("Sim"),
                            )
                          ],
                        ));
              },
              icon: Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error,
            ),
          ],
        ),
      ),
    );
  }
}
