import 'package:hive/hive.dart';
part 'product_responsemodel.g.dart';
class ProductResponse {
  final String responseCode;
  final String activeRecords;
  final List<Product> data;

  ProductResponse({
    required this.responseCode,
    required this.activeRecords,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    var dataList = json['DATA'] as List;
    List<Product> productList =
        dataList.map((i) => Product.fromJson(i)).toList();

    return ProductResponse(
      responseCode: json['RESPONSE_CODE'],
      activeRecords: json['ACTIVE_RECORDS'],
      data: productList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'RESPONSE_CODE': responseCode,
      'ACTIVE_RECORDS': activeRecords,
      'DATA': data.map((product) => product.toJson()).toList(),
    };
  }
}

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String uuid;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String customUrl;
  @HiveField(4)
  final String type;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final String metaTitle;
  @HiveField(7)
  final String metaDesc;
  @HiveField(8)
  final String metaKeys;
  @HiveField(9)
  final String createdAt;
  @HiveField(10)
  final String updatedAt;
  @HiveField(11)
  final String status;
  @HiveField(12)
  final String isDeleted;
  @HiveField(13)
  final String fileUrl;
  @HiveField(14)
  final List<Feature> features;
  @HiveField(15)
  bool favourite = false;

  Product({
    required this.id,
    required this.uuid,
    required this.title,
    required this.customUrl,
    required this.type,
    required this.description,
    required this.metaTitle,
    required this.metaDesc,
    required this.metaKeys,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.isDeleted,
    required this.fileUrl,
    required this.features,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    var featureList = json['features'] as List;
    List<Feature> features =
        featureList.map((i) => Feature.fromJson(i)).toList();

    return Product(
      id: json['id'],
      uuid: json['uuid'],
      title: json['title'],
      customUrl: json['custom_url'],
      type: json['type'],
      description: json['description'],
      metaTitle: json['meta_title'],
      metaDesc: json['meta_desc'],
      metaKeys: json['meta_keys'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'] ?? "",
      status: json['status'],
      isDeleted: json['is_deleted'],
      fileUrl: json['file_url'] ?? "",
      features: features,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'title': title,
      'custom_url': customUrl,
      'type': type,
      'description': description,
      'meta_title': metaTitle,
      'meta_desc': metaDesc,
      'meta_keys': metaKeys,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'status': status,
      'is_deleted': isDeleted,
      'file_url': fileUrl,
      'features': features.map((feature) => feature.toJson()).toList(),
    };
  }
}

@HiveType(typeId: 1)
class Feature extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String productId;
  @HiveField(2)
  final String variantName;
  @HiveField(3)
  final String variantValue;
  @HiveField(4)
  final String sku;
  @HiveField(5)
  final String stockTotal;
  @HiveField(6)
  final String wholesalePrice;
  @HiveField(7)
  final String buyPrice;
  @HiveField(8)
  final String onSale;
  @HiveField(9)
  final String onSalePrice;
  @HiveField(10)
  final String status;
  @HiveField(11)
  final String isDeleted;
  @HiveField(12)
  final String createdAt;
  @HiveField(13)
  final String? updatedAt;

  Feature({
    required this.id,
    required this.productId,
    required this.variantName,
    required this.variantValue,
    required this.sku,
    required this.stockTotal,
    required this.wholesalePrice,
    required this.buyPrice,
    required this.onSale,
    required this.onSalePrice,
    required this.status,
    required this.isDeleted,
    required this.createdAt,
    this.updatedAt,
  });

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      id: json['id'],
      productId: json['product_id'],
      variantName: json['variant_name'],
      variantValue: json['variant_value'],
      sku: json['sku'],
      stockTotal: json['stock_total'],
      wholesalePrice: json['wholesale_price'],
      buyPrice: json['buy_price'],
      onSale: json['on_sale'],
      onSalePrice: json['on_sale_price'],
      status: json['status'],
      isDeleted: json['is_deleted'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'variant_name': variantName,
      'variant_value': variantValue,
      'sku': sku,
      'stock_total': stockTotal,
      'wholesale_price': wholesalePrice,
      'buy_price': buyPrice,
      'on_sale': onSale,
      'on_sale_price': onSalePrice,
      'status': status,
      'is_deleted': isDeleted,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
