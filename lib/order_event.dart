import 'package:bloc/bloc.dart';
import "order.dart";

enum EventType { add }

class OrderEvent {
  late Order order;
  late int orderIndex;
  late EventType eventType;

  OrderEvent.add(Order order) {
    this.eventType = EventType.add;
    this.order = order;
  }
}
