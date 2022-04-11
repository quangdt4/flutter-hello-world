import 'package:flutter/material.dart';

import '../model/Product.dart';

/*SHOPPING CART - LIST ITEM
+ ListView item, Card
+ Visiblity widget, Undo-remove item
+ Gesture Detector - Hold item => onLongPress */

class M04ShoppingCart extends StatefulWidget {
  M04ShoppingCart({Key? key}) : super(key: key);

  var totalPrice = 0;
  var n = 0;

  @override
  State<M04ShoppingCart> createState() => _M04ShoppingCartState();
}

class _M04ShoppingCartState extends State<M04ShoppingCart> {
  var _isVisibleDelete = false;
  var allChecked = false;

  @override
  initState() => calTotalPrice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Your Cart',
          style: TextStyle(fontSize: 20, fontFamily: "Manrope"),
        ),
        actions: [
          Visibility(
            child: Checkbox(
              value: allChecked,
              onChanged: (value) {
                final newValue = value!;
                setState(() {
                  allChecked = !allChecked;
                  for (var element in listProductInCart) {
                    element.check = newValue;
                  }
                });
              },
            ),
            visible: _isVisibleDelete,
          ),
          Visibility(
            child: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                setState(() {
                  final List<Product> listRemove = [];
                  for (var product in listProductInCart) {
                    if (product.check) listRemove.add(product);
                  }
                  listProductInCart.removeWhere((element) => element.check);
                  if (listProductInCart.isEmpty) allChecked = false;
                  widget.totalPrice = 0;
                  calTotalPrice();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        "Item removed!",
                        style: TextStyle(fontFamily: "Manrope"),
                      ),
                      duration: const Duration(seconds: 5),
                      action: SnackBarAction(
                        label: "UNDO",
                        onPressed: () {
                          setState(() {
                            listProductInCart.addAll(listRemove);
                          });
                        },
                      ),
                    ),
                  );
                });
              },
            ),
            visible: _isVisibleDelete,
          ),
        ],
      ),
      body: Center(
        child: SafeArea(
          child: listCartItem(),
        ),
      ),
    );
  }

  Widget listCartItem() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: listProductInCart.length,
              itemBuilder: (BuildContext context, int index) {
                return cartItem(listProductInCart[index]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      "Total",
                      style: TextStyle(fontFamily: "Manrope", fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 12.0, top: 8.0, right: 12.0, bottom: 8.0),
                    decoration: const BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Text(
                      "\$${widget.totalPrice}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Manrope",
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.7)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                      child: const Text("ORDER NOW",
                          style: TextStyle(
                              fontFamily: "Manrope",
                              fontSize: 16,
                              color: Colors.white)),
                      style: ElevatedButton.styleFrom(primary: Colors.purple),
                      onPressed: () {
                        setState(() {});
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cartItem(Product product) {
    return GestureDetector(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              child: Checkbox(
                  value: product.check,
                  onChanged: (value) {
                    final newValue = value!;
                    setState(() {
                      product.check = !product.check;
                      if (!newValue) {
                        allChecked = false;
                      } else {
                        final allListChecked =
                            listProductInCart.every((element) => element.check);
                        allChecked = allListChecked;
                      }
                    });
                  }),
              visible: _isVisibleDelete,
            ),
            Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontFamily: "Manrope", fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Total: \$${product.price} - ${product.price * product.counter}',
                    style: const TextStyle(
                        fontFamily: "Manrope",
                        fontSize: 12,
                        color: Colors.black45),
                  ),
                ],
              ),
            ),
            Container(
              height: 24,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    child: const Icon(
                      Icons.remove,
                      color: Colors.black45,
                      size: 16,
                    ),
                    onTap: () {
                      setState(() {
                        if (product.counter > 1) {
                          product.counter -= 1;
                          widget.totalPrice -= product.price;
                        }
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      "${product.counter}",
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontFamily: "Manrope", fontSize: 15),
                    ),
                  ),
                  InkWell(
                      child: const Icon(
                        Icons.add,
                        color: Colors.black45,
                        size: 16,
                      ),
                      onTap: () {
                        setState(() {
                          product.counter++;
                          widget.totalPrice += product.price;
                        });
                      }),
                ],
              ),
            ),
            const SizedBox(width: 10)
          ],
        ),
      ),
      onLongPress: () {
        setState(() {
          _isVisibleDelete = !_isVisibleDelete;
        });
      },
    );
  }

  void calTotalPrice() {
    for (int i = 0; i < listProductInCart.length; i++) {
      widget.totalPrice +=
          listProductInCart[i].price * listProductInCart[i].counter;
    }
  }
}
