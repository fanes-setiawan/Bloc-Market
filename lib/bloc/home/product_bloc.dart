import 'package:blocmarket/data/models/response/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ProductLoading());
      final response =
          await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
      emit(ProductSuccess(products: productModelFromJson(response.body)));
    });
  }
}
