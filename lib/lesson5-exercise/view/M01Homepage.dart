import 'package:flutter/material.dart';
import 'package:helloworld/lesson5-exercise/model/Product.dart';
import 'package:helloworld/lesson5-exercise/view/M02Detail.dart';

void main() {
  runApp(const M01Homepage());
}

class M01Homepage extends StatelessWidget {
  const M01Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const L5ExHomepage(),
    );
  }
}

class L5ExHomepage extends StatefulWidget {
  const L5ExHomepage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomepageState();
}

final List<Product> listProduct = [
  Product(
      "Quần jean",
      "https://cdn.shopify.com/s/files/1/0268/7841/0824/products/1053SS-white_1900x_crop_center_141b7f52-8fcb-4127-8025-3a27fcb314e8_720x.jpg?v=1618506001",
      "\$5.6",
      false),
  Product(
      "Áo kitty",
      "https://i.ebayimg.com/images/g/scAAAOSw10tgkxBI/s-l300.jpg",
      "\$9.8",
      false),
  Product(
      "Quần ống",
      "https://ae01.alicdn.com/kf/Hea036cc6bf16445195bdbd0baabaf6ccx/Gowyimmes-M-a-ng-2021-Size-L-n-S-5XL-R-ng-Cho-S-n-Vi.jpg_Q90.jpg_.webp",
      "\$5.4",
      false),
];

class _HomepageState extends State<L5ExHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Center(
          child: gridView(),
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Colors.purple,
      title: const Text(
        "My Shop",
        style: TextStyle(fontFamily: "Manrope"),
      ),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          onClickMenu();
        },
      ),
      actions: [
        IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              onClickShoppingCart();
            }),
        IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              onClickMoreVert();
            })
      ],
    );
  }

  Widget gridView() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.2,
              crossAxisCount: 2,
            ),
            itemCount: listProduct.length,
            itemBuilder: (BuildContext context, int index) {
              return productItem(listProduct[index], index);
            }),
      ),
    );
  }

  Widget productItem(Product product, int index) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      child: InkWell(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                listProduct[index].image,
                width: screenSize.width / 2.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(
                        product.favorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 20,
                        color: Colors.purple,
                      ),
                      onPressed: () {
                        setState(() {
                          product.favorite = !product.favorite;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(product.name,
                        style: const TextStyle(
                            color: Colors.white, fontFamily: "Manrope")),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.purple,
                      size: 20,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (c) => M02Detail(listProduct[index])));
      },
    );
  }

  void onClickMenu() {
    setState(() {});
  }

  void onClickShoppingCart() {
    setState(() {});
  }

  void onClickMoreVert() {
    setState(() {});
  }
}
