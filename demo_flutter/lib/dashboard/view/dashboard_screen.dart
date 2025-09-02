import 'package:demo_flutter/dashboard/bloc/product_bloc.dart';
import 'package:demo_flutter/dashboard/model/product_model.dart';
import 'package:demo_flutter/dashboard/view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: TextField(),
        actions: [
        IconButton(onPressed: (){
          context.read<ProductBloc>().add(SearchProductEvent(productName: textEditingController.text.trim()));
        }, icon: Icon(Icons.search))
      ],),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
        },
        builder: (context,ProductState  state) {
          if(state is ProductLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          else if (state is ProductError){
                        return Center(child: Text(state.error),);
          }else if (state is ProductLoaded){
            List<ProductModel> products = state.products;
            return ListView.builder(itemCount: products.length,itemBuilder:(context,count){
              final ProductModel currentProduct = products[count];
              return ProductView(
                productData: currentProduct,
              );
            } );
          }else if (state is SearchProductState){
            List<ProductModel> products = state.searchResultProduct;
            return Column(
              spacing: 30,
              children: [
                Text("Searched Product"),
                ListView.builder(shrinkWrap: true,itemCount: products.length,itemBuilder:(context,count){
                  final ProductModel currentProduct = products[count];
                  return ProductView(
                    productData: currentProduct,
                  );
                } ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
