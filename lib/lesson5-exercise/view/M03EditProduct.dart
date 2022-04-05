import 'package:flutter/material.dart';

import '../model/Product.dart';

class M03EditProduct extends StatefulWidget {
  var _initialData;

  M03EditProduct(this._initialData, {Key? key}) : super(key: key);

  @override
  State<M03EditProduct> createState() => _M03EditProductState();
}

class _M03EditProductState extends State<M03EditProduct> {
  final _controllerTitle = TextEditingController();
  final _controllerPrice = TextEditingController();
  final _controllerPath = TextEditingController();
  final _controllerDes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data;
    if (widget._initialData != '') {
      data = widget._initialData;
    } else {
      data = ModalRoute.of(context)?.settings.arguments;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Edit Product',
          style: TextStyle(fontSize: 20, fontFamily: "Manrope"),
        ),
        actions: [
          IconButton(
            onPressed: onClickSaveProduct,
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Title",
                style: TextStyle(fontFamily: "Manrope", fontSize: 12),
              ),
              TextField(
                maxLines: 1,
                controller: _controllerTitle,
                style: const TextStyle(fontFamily: "Manrope", fontSize: 15),
                decoration: const InputDecoration(hintText: "Nike AF1 v.v.."),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Price",
                style: TextStyle(fontFamily: "Manrope", fontSize: 12),
              ),
              TextField(
                maxLines: 1,
                controller: _controllerPrice,
                style: const TextStyle(fontFamily: "Manrope", fontSize: 15),
                decoration: const InputDecoration(hintText: "\$100"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Description",
                style: TextStyle(fontFamily: "Manrope", fontSize: 12),
              ),
              TextField(
                maxLines: 1,
                controller: _controllerDes,
                style: const TextStyle(fontFamily: "Manrope", fontSize: 15),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Image.network(
                        _controllerPath.text,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Image URL",
                          style: TextStyle(fontFamily: "Manrope", fontSize: 12),
                        ),
                        TextField(
                          maxLines: 1,
                          controller: _controllerPath,
                          style: const TextStyle(
                              fontFamily: "Manrope", fontSize: 15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onClickSaveProduct() {
    setState(() {
      listProduct.add(Product(_controllerTitle.text, _controllerPath.text,
          _controllerPrice.text, false));
      Navigator.pop(context);
    });
  }
}
