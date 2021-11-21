import 'package:flutter_bloc/flutter_bloc.dart';

class Asset {
  String name;

  Asset(this.name);
}

abstract class AssetEvent {}

class AssetAdded extends AssetEvent {
  final Asset? asset;
  AssetAdded(this.asset);
}

class AssetRemoved extends AssetEvent {}

class AssetBloc extends Bloc<AssetEvent, Asset?> {
  AssetBloc() : super(null) {
    on<AssetAdded>((event, emit) {
      emit(event.asset);
    });
    on<AssetRemoved>((event, emit) {
      emit(null);
    });
  }
}
