import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vestr_poc/order.dart';
import 'package:vestr_poc/order_event.dart';

class OrderBloc extends Bloc<OrderEvent, Order> {
  OrderBloc(Order initialState) : super(initialState);

  Order get initialState => Order(null);

  @override
  Stream<Order> mapEventToState(OrderEvent event) async* {
    switch(event.eventType){
      case EventType.add: Order newState = event.order;
      yield newState;
      break;
      default: throw Exception("Error in bloc");
    }
  }
}
