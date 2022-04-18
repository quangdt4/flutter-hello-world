import 'dart:async';

import 'package:helloworld/lesson9-BLoC/HomeBlocState.dart';
import 'package:helloworld/lesson9-BLoC/HomeEvent.dart';

class HomeBloc {
  final HomeBlocState _blocState = HomeBlocState();

  HomeBloc() {
    _channelStreamEvent.listen((event) {
      if (event is IncreaseChannel) {
        _blocState.channel++;
        _channelStateStreamController.sink.add(_blocState.channel);
      } else if (event is DecreaseChannel) {
        _blocState.channel--;
        _channelStateStreamController.sink.add(_blocState.channel);
      }
    });

    _volumeStreamEvent.listen((event) {
      if (event is IncreaseVolume) {
        _blocState.volume += 5;
        _volumeStateStreamController.sink.add(_blocState.volume);
      } else if (event is DecreaseVolume) {
        if (_blocState.volume > 5) {
          _blocState.volume -= 10;
        } else {
          _blocState.volume = 0;
        }
        _volumeStateStreamController.sink.add(_blocState.volume);
      } else if (event is MuteVolume) {
        _blocState.volume = 0;
        _volumeStateStreamController.sink.add(_blocState.volume);
      }
    });
  }

  final _volumeStreamController = StreamController<VolumeEvent>();

  Stream<VolumeEvent> get _volumeStreamEvent => _volumeStreamController.stream;

  Sink<VolumeEvent> get volumeSinkEvent => _volumeStreamController.sink;

  final _volumeStateStreamController = StreamController<int>();

  Stream<int> get volume => _volumeStateStreamController.stream;

//------

  final _channelStreamController = StreamController<ChannelEvent>();

  Stream<ChannelEvent> get _channelStreamEvent =>
      _channelStreamController.stream;

  Sink<ChannelEvent> get channelSinkEvent => _channelStreamController.sink;

  final _channelStateStreamController = StreamController<int>();

  Stream<int> get channel => _channelStateStreamController.stream;
}
