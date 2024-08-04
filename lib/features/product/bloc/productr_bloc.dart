import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'productr_event.dart';
part 'productr_state.dart';

class ProductrBloc extends Bloc<ProductrEvent, ProductrState> {
  ProductrBloc() : super(ProductrInitial()) {
    on<ProductrEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
