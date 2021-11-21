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

  // Observe all state changes for a Bloc using onChange.
  @override
  void onChange(Change<Asset?> change) {
    super.onChange(change);
    print(change);
  }

  // Consists of the current state, the event, and the next state.
  @override
  void onTransition(Transition<AssetEvent, Asset?> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
