import 'package:demo_flutter/dashboard/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.productData});
final ProductModel productData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(productData.name ?? ""),  
            if(productData.imageLink !=null)
                        Image.network(productData.imageLink!) ,      
            Row(
              spacing: 50,
              children: [
                Text("Price ${productData.price}"),
                Text("Brand ${productData.brand}"),
              ],
            ),        
            Text("Product Description ${productData.description ?? ""}"),  
            Text("Product Description ${productData.rating}"),  
        ],
      ),
    );
  }
}