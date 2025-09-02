part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {
  final List<ProductModel> products = [];
}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
 final List<ProductModel> products;

  ProductLoaded({required this.products});
  }

final class ProductError extends ProductState {
   final String error;

  ProductError({required this.error});   
}

final class SearchProductState extends ProductState{
   final List<ProductModel> searchResultProduct;

  SearchProductState({required this.searchResultProduct});
}