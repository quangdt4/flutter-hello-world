/*
LESSON 9: STATE MANAGEMENT: QUẢN LÝ TRẠNG THÁI
- 3 mô hình recommend: Provider - BLoc - GetX
- Quản lý trạng thái dùng khi chỉ muốn vẽ/render những UI cần thiết
- Chia tách business logic với thành phần UI
- Lý do cần: tối ưu hiệu năng, đảm bảo logic
+ MVVM trong native và BLoC trong flutter
--- model - view - viewmodel
--- state - ui (widget) - bloc/controller

*** Các bước sử dụng: Provide/MultiProvider
B1: provider thư viện
B2: controller extends ChangeNotifier
B3: tạo controlle bọc lấy MyApp() để dùng ở bất kì đâu trong ứng dụng
B4: Thêm notifierListener() vào hàm cần cập nhật State
B5: Dùng Consumer/Selector(widget) bọc lấy phần UI-widget cần vẽ lại khi State thay đổi

- Để gọi đến controller trong mô hình Provider, sử dụng
context.read<CartTotal>() hoặc context.watch<CartTotal>()
 */

import 'package:flutter/material.dart';
import 'package:helloworld/lesson9-provider/homepage_loading.dart';

import 'package:provider/provider.dart';

import 'homepage-content.dart';
import 'controller.dart';

void main() => runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => HomeController(),
        ),
      ], child: const MyApp()),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    context.read<HomeController>().loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Selector<HomeController, bool>(
          selector: (_, controller) => controller.homeState.loading,
          builder: (_, loading, __) {
            if (loading) {
              return const LoadingHomePage();
            } else {
              return const HomeContent();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _incrementCounter(context);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _incrementCounter(BuildContext context) {
    context.read<HomeController>().onButtonClick();
  }
}
