part of 'sale_property_bloc.dart';

@immutable
class SalePropertyState {
  final String propertyType;
  final String area;
  final String numberOfRooms;
  final String numberOfBathRooms;
  final String propertyAge;
  final String decoration;
  final String kitchenType;
  final String flooringType;
  final String overlookFrom;
  final String balconySize;
  final String paintingType;
  final String price;
  final String payWay;
  final String state;
  final String exactPosition;
  final List<File> images;
  final List<File> idImages;
  final List<File> propertyDocument;

  const SalePropertyState({
    this.propertyType = 'Villa',
    this.area = '',
    this.numberOfRooms = '',
    this.numberOfBathRooms = '',
    this.propertyAge = '',
    this.decoration = 'deluxe',
    this.kitchenType = 'western',
    this.flooringType = 'granite',
    this.overlookFrom = '',
    this.balconySize = '',
    this.paintingType = 'regular',
    this.price = '',
    this.payWay = 'regular',
    this.state = 'Damascus',
    this.exactPosition = '',
    this.images = const [],
    this.idImages = const [],
    this.propertyDocument = const [],
  });

  @override
  String toString() =>
      'SalePropertyState('
      'propertyType: $propertyType, '
      'area: $area, '
      'numberOfRooms: $numberOfRooms, '
      'numberOfBathRooms: $numberOfBathRooms, '
      'propertyAge: $propertyAge, '
      'decoration: $decoration, '
      'kitchenType: $kitchenType, '
      'flooringType: $flooringType, '
      'overlookFrom: $overlookFrom, '
      'balconySize: $balconySize, '
      'paintingType: $paintingType, '
      'price: $price, '
      'payWay: $payWay, '
      'state: $state, '
      'exactPosition: $exactPosition, '
      'images: ${images.length}, '
      'idImages: ${idImages.length}, '
      'propertyDocument: $propertyDocument'
      ')';

  Map<String, dynamic> toMap() => {
    'property_type': propertyType,
    'area': area,
    'number_of_rooms': numberOfRooms,
    'number_of_bathrooms': numberOfBathRooms,
    'property_age': propertyAge,
    'decoration': decoration,
    'kitchen_type': kitchenType,
    'flooring_type': flooringType,
    'overlook_from': overlookFrom,
    'balcony_size': balconySize,
    'painting_type': paintingType,
    'price': price,
    'pay_way': payWay,
    'state': state,
    'exact_position': exactPosition,
    'property_images': images,
    'id_images': idImages,
    'property_documents': propertyDocument,
  };

  factory SalePropertyState.fromMap(Map<String, dynamic> map) {
    return SalePropertyState(
      propertyType: map['property_type'] as String? ?? '',
      area: map['area'] as String? ?? '',
      numberOfRooms: map['number_of_rooms'] as String? ?? '',
      numberOfBathRooms: map['number_of_bathrooms'] as String? ?? '',
      propertyAge: map['property_age'] as String? ?? '',
      decoration: map['decoration'] as String? ?? 'deluxe',
      kitchenType: map['kitchen_type'] as String? ?? 'western',
      flooringType: map['flooring_type'] as String? ?? 'granite',
      overlookFrom: map['overlook_from'] as String? ?? '',
      balconySize: map['balcony_size'] as String? ?? '',
      paintingType: map['painting_type'] as String? ?? 'regular',
      price: map['price'] as String? ?? '',
      payWay: map['pay_way'] as String? ?? 'regular',
      state: map['state'] as String? ?? 'Damascus',
      exactPosition: map['exact_position'] as String? ?? '',
      idImages:
          (map['id_images[]'] as List<dynamic>?)!
              .map((e) => File(e as String))
              .toList(),
      images:
          (map['property_images[]'] as List<dynamic>?)!
              .map((e) => File(e as String))
              .toList(),
      propertyDocument:
          (map['property_documents[]'] as List<dynamic>?)!
              .map((e) => File(e as String))
              .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory SalePropertyState.fromJson(String source) =>
      SalePropertyState.fromMap(json.decode(source) as Map<String, dynamic>);

  SalePropertyState copyWith({
    String? propertyType,
    String? area,
    String? numberOfRooms,
    String? numberOfBathRooms,
    String? propertyAge,
    String? decoration,
    String? kitchenType,
    String? flooringType,
    String? overlookFrom,
    String? balconySize,
    String? paintingType,
    String? price,
    String? payWay,
    String? state,
    String? exactPosition,
    List<File>? images,
    List<File>? idImages,
    List<File>? propertyDocument,
  }) {
    return SalePropertyState(
      propertyType: propertyType ?? this.propertyType,
      area: area ?? this.area,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      numberOfBathRooms: numberOfBathRooms ?? this.numberOfBathRooms,
      propertyAge: propertyAge ?? this.propertyAge,
      decoration: decoration ?? this.decoration,
      kitchenType: kitchenType ?? this.kitchenType,
      flooringType: flooringType ?? this.flooringType,
      overlookFrom: overlookFrom ?? this.overlookFrom,
      balconySize: balconySize ?? this.balconySize,
      paintingType: paintingType ?? this.paintingType,
      price: price ?? this.price,
      payWay: payWay ?? this.payWay,
      state: state ?? this.state,
      exactPosition: exactPosition ?? this.exactPosition,
      images: images ?? this.images,
      idImages: idImages ?? this.idImages,
      propertyDocument: propertyDocument ?? this.propertyDocument,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const ListEquality().equals;

    return other is SalePropertyState &&
        other.propertyType == propertyType &&
        other.area == area &&
        other.numberOfRooms == numberOfRooms &&
        other.numberOfBathRooms == numberOfBathRooms &&
        other.propertyAge == propertyAge &&
        other.decoration == decoration &&
        other.kitchenType == kitchenType &&
        other.flooringType == flooringType &&
        other.overlookFrom == overlookFrom &&
        other.balconySize == balconySize &&
        other.paintingType == paintingType &&
        other.price == price &&
        other.payWay == payWay &&
        other.state == state &&
        other.exactPosition == exactPosition &&
        listEquals(other.images, images) &&
        listEquals(other.idImages, idImages) &&
        listEquals(other.propertyDocument, propertyDocument);
  }

  @override
  int get hashCode {
    return Object.hash(
      propertyType,
      area,
      numberOfRooms,
      numberOfBathRooms,
      propertyAge,
      decoration,
      kitchenType,
      flooringType,
      overlookFrom,
      balconySize,
      paintingType,
      price,
      payWay,
      state,
      exactPosition,
      Object.hashAll(images),
      Object.hashAll(idImages),
      Object.hashAll(propertyDocument),
    );
  }

Future<FormData> toFormData() async {
  final map = toMap();
  
  final formData = FormData.fromMap(map);

  // Add property images with array syntax
  for (var file in images.where((f) => f.path.isNotEmpty)) {
    formData.files.add(MapEntry(
      'property_images[]',
      await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
    ));
  }

  // Add ID images with array syntax
  for (var file in idImages.where((f) => f.path.isNotEmpty)) {
    formData.files.add(MapEntry(
      'id_images[]',
      await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
    ));
  }

  // Add property documents with array syntax
  for (var file in propertyDocument.where((f) => f.path.isNotEmpty)) {
    formData.files.add(MapEntry(
      'property_documents[]',
      await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
    ));
  }

  return formData;
}
}
