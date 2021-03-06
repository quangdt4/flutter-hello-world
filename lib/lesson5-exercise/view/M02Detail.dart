import 'package:flutter/material.dart';

import '../model/Product.dart';
import 'M03EditProduct.dart';

// DETAIL ITEM

class M02Detail extends StatelessWidget {
  Product product;

  M02Detail(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.network(
                product.image,
                height: 500,
                fit: BoxFit.fill,
              ),
              Positioned(
                  top: 30,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  )),
              Positioned(
                  bottom: 24,
                  left: 24,
                  child: Text(
                    product.name,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "\$ ${product.price}",
            style: const TextStyle(color: Colors.black, fontSize: 50),
          ),
          // ElevatedButton(
          //     onPressed: () async {
          //       var data = 'data from screen 2';
          //
          //       var resultData = await Navigator.push(context,
          //           MaterialPageRoute(builder: (context) {
          //         // do something
          //         return M03EditProduct(data);
          //       }));
          //
          //       Navigator.pop(context, resultData);
          //     },
          //     child: Text('Go to Screen 3'))
        ],
      ),
    );
  }
}
