class ProductModel {
    final int? id;
    final String? brand;
    final String? name;
    final dynamic price;
    final String? imageLink;
    final String? description;
    final double? rating;

    ProductModel({
        this.id,
        this.brand,
        this.name,
        this.price,
        this.imageLink,
        this.description,
        this.rating,
    });

    ProductModel copyWith({
        int? id,
        String? brand,
        String? name,
        dynamic price,
        String? imageLink,
        String? description,
        double? rating,
    }) => 
        ProductModel(
            id: id ?? this.id,
            brand: brand ?? this.brand,
            name: name ?? this.name,
            price: price ?? this.price,
            imageLink: imageLink ?? this.imageLink,
            description: description ?? this.description,
            rating: rating ?? this.rating,
        );

factory ProductModel.fromMap(Map<String,dynamic> productMap){
  return ProductModel(id: productMap["id"],brand:productMap["brand"] ,name:productMap["name"] ,price:productMap["price"] ,imageLink:productMap["imageLink"] ,description: productMap["description"]
  ,rating: productMap["rating"]);
}

        
}
