part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}


class GetProductEvent extends ProductEvent {}

class SearchProductEvent extends ProductEvent{
  final String productName;

  SearchProductEvent({required this.productName});
}