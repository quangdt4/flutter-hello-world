import 'package:flutter/material.dart';

import '../model/Product.dart';

class M04ShoppingCart extends StatefulWidget {
  const M04ShoppingCart({Key? key}) : super(key: key);

  @override
  State<M04ShoppingCart> createState() => _M04ShoppingCartState();
}

class _M04ShoppingCartState extends State<M04ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Shopping Cart',
          style: TextStyle(fontSize: 20, fontFamily: "Manrope"),
        ),
      ),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: listProductWithFav.length,
          itemBuilder: (BuildContext context, int index) {
            return productFavItem(listProductWithFav[index], index);
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }

  Widget productFavItem(Product product, int i) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontFamily: "Manrope", fontSize: 20),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your favorite Product',
                  style: TextStyle(
                      fontFamily: "Manrope",
                      fontSize: 12,
                      color: Colors.black45),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.purple),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              setState(() {
                product.favorite = false;
                listProductWithFav.remove(product);
              });
            },
          ),
        ],
      ),
    );
  }
}
