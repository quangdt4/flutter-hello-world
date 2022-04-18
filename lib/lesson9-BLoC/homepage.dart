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
import 'package:helloworld/lesson9-BLoC/HomeEvent.dart';

import 'HomeBloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BLoC Example'),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StreamBuilder(
                        stream: _bloc.channel,
                        initialData: 0,
                        builder: (context, snapshot) {
                          return Text("Kênh hiện tại: ${snapshot.data}");
                        }),
                    StreamBuilder(
                        stream: _bloc.volume,
                        initialData: 0,
                        builder: (context, snapshot) {
                          return Text("Âm lượng hiện tại: ${snapshot.data}");
                        }),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          _channelCounter(context, 0);
                        },
                        child: const Text("-1"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _channelCounter(context, 1);
                        },
                        child: const Text("+1"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          _volumeCounter(context, 1);
                        },
                        child: const Icon(Icons.volume_up_sharp),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _volumeCounter(context, 2);
                        },
                        child: const Icon(Icons.volume_down),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _volumeCounter(context, 0);
                        },
                        child: const Icon(Icons.volume_mute),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _channelCounter(BuildContext context, int i) {
    // i == 0 -> decrease
    // i == 1 -> increase
    if (i == 0) {
      _bloc.channelSinkEvent.add(DecreaseChannel());
    } else {
      _bloc.channelSinkEvent.add(IncreaseChannel());
    }
  }

  void _volumeCounter(BuildContext context, int i) {
    // i == 0 -> volume = 0
    // i == 1 -> volume + 5
    // i == 2 -> volume -10
    switch (i) {
      case 0:
        _bloc.volumeSinkEvent.add(MuteVolume());
        break;
      case 1:
        _bloc.volumeSinkEvent.add(IncreaseVolume());
        break;
      case 2:
        _bloc.volumeSinkEvent.add(DecreaseVolume());
        break;
    }
  }
}
