// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_responsemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as String,
      uuid: fields[1] as String,
      title: fields[2] as String,
      customUrl: fields[3] as String,
      type: fields[4] as String,
      description: fields[5] as String,
      metaTitle: fields[6] as String,
      metaDesc: fields[7] as String,
      metaKeys: fields[8] as String,
      createdAt: fields[9] as String,
      updatedAt: fields[10] as String,
      status: fields[11] as String,
      isDeleted: fields[12] as String,
      fileUrl: fields[13] as String,
      features: (fields[14] as List).cast<Feature>(),
    )..favourite = fields[15] as bool;
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.uuid)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.customUrl)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.metaTitle)
      ..writeByte(7)
      ..write(obj.metaDesc)
      ..writeByte(8)
      ..write(obj.metaKeys)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(12)
      ..write(obj.isDeleted)
      ..writeByte(13)
      ..write(obj.fileUrl)
      ..writeByte(14)
      ..write(obj.features)
      ..writeByte(15)
      ..write(obj.favourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FeatureAdapter extends TypeAdapter<Feature> {
  @override
  final int typeId = 1;

  @override
  Feature read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Feature(
      id: fields[0] as String,
      productId: fields[1] as String,
      variantName: fields[2] as String,
      variantValue: fields[3] as String,
      sku: fields[4] as String,
      stockTotal: fields[5] as String,
      wholesalePrice: fields[6] as String,
      buyPrice: fields[7] as String,
      onSale: fields[8] as String,
      onSalePrice: fields[9] as String,
      status: fields[10] as String,
      isDeleted: fields[11] as String,
      createdAt: fields[12] as String,
      updatedAt: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Feature obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productId)
      ..writeByte(2)
      ..write(obj.variantName)
      ..writeByte(3)
      ..write(obj.variantValue)
      ..writeByte(4)
      ..write(obj.sku)
      ..writeByte(5)
      ..write(obj.stockTotal)
      ..writeByte(6)
      ..write(obj.wholesalePrice)
      ..writeByte(7)
      ..write(obj.buyPrice)
      ..writeByte(8)
      ..write(obj.onSale)
      ..writeByte(9)
      ..write(obj.onSalePrice)
      ..writeByte(10)
      ..write(obj.status)
      ..writeByte(11)
      ..write(obj.isDeleted)
      ..writeByte(12)
      ..write(obj.createdAt)
      ..writeByte(13)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeatureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
