

import 'package:demo_flutter/dashboard/model/product_model.dart';
import 'package:demo_flutter/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {
    });
    on<GetProductEvent>((GetProductEvent event,Emitter<ProductState> emit)async{
      emit(ProductLoading());
      try{
       final products = await ApiServices.getAllProducts();
        emit(ProductLoaded(products: products));
      }catch(e){
        emit(ProductError(error: e.toString()));
      }
    });
    on<SearchProductEvent>((SearchProductEvent event,Emitter<ProductState> state){
      if (state is ProductLoaded){
       final ProductLoaded  currentState= state as ProductLoaded;
      final List<ProductModel>  searchedItem = [];
       for(final item in currentState.products){
        if(item.name!.contains(event.productName)){
          searchedItem.add(item);
        }
       }
       emit(SearchProductState(searchResultProduct: searchedItem));
      }else{
         emit(SearchProductState(searchResultProduct: []));
      }
    });
  }
  
}
