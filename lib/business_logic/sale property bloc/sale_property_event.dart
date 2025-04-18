part of 'sale_property_bloc.dart';

abstract class SalePropertyEvent {
  const SalePropertyEvent();

  Map<String, dynamic> toJson() => {};
}

class UpdatePropertyTypeEvent extends SalePropertyEvent {
  UpdatePropertyTypeEvent({required this.propertyType});

  final String propertyType;

  List<Object?> get props => [propertyType];
}

class UpdateAreaEvent extends SalePropertyEvent {
  UpdateAreaEvent({required this.area});

  final String area;

  @override
  List<Object?> get props => [area];
}

class UpdateNumberOfRoomsEvent extends SalePropertyEvent {
  UpdateNumberOfRoomsEvent({required this.numberOfRooms});

  final String numberOfRooms;

  @override
  List<Object?> get props => [numberOfRooms];
}

class UpdateNumberOfBathroomsEvent extends SalePropertyEvent {
  UpdateNumberOfBathroomsEvent({required this.numberOfBathrooms});

  final String numberOfBathrooms;

  @override
  List<Object?> get props => [numberOfBathrooms];
}

class UpdatePropertyAgeEvent extends SalePropertyEvent {
  UpdatePropertyAgeEvent({required this.propertyAge});

  final String propertyAge;

  @override
  List<Object?> get props => [propertyAge];
}

class UpdateDecorationEvent extends SalePropertyEvent {
  UpdateDecorationEvent({required this.decoration});

  final String decoration;

  @override
  List<Object?> get props => [decoration];
}

class UpdateKitchenTypeEvent extends SalePropertyEvent {
  UpdateKitchenTypeEvent({required this.kitchenType});

  final String kitchenType;

  @override
  List<Object?> get props => [kitchenType];
}

class UpdateFlooringTypeEvent extends SalePropertyEvent {
  UpdateFlooringTypeEvent({required this.flooringType});

  final String flooringType;

  @override
  List<Object?> get props => [flooringType];
}

class UpdateOverlookFromEvent extends SalePropertyEvent {
  UpdateOverlookFromEvent({required this.overlookFrom});

  final String overlookFrom;

  @override
  List<Object?> get props => [overlookFrom];
}

class UpdateBalconySizeEvent extends SalePropertyEvent {
  UpdateBalconySizeEvent({required this.balconySize});

  final String balconySize;

  @override
  List<Object?> get props => [balconySize];
}

class UpdatePaintingTypeEvent extends SalePropertyEvent {
  UpdatePaintingTypeEvent({required this.paintingType});

  final String paintingType;

  @override
  List<Object?> get props => [paintingType];
}

class UpdatePriceEvent extends SalePropertyEvent {
  UpdatePriceEvent({required this.price});

  final String price;

  @override
  List<Object?> get props => [price];
}

class UpdatePayWayEvent extends SalePropertyEvent {
  UpdatePayWayEvent({required this.payWay});

  final String payWay;

  @override
  List<Object?> get props => [payWay];
}

class UpdateStateEvent extends SalePropertyEvent {
  UpdateStateEvent({required this.state});

  final String state;

  @override
  List<Object?> get props => [state];
}

class UpdateExactPositionEvent extends SalePropertyEvent {
  UpdateExactPositionEvent({required this.exactPosition});

  final String exactPosition;

  @override
  List<Object?> get props => [exactPosition];
}

class UpdateImagesEvent extends SalePropertyEvent {
  UpdateImagesEvent({required this.images});

  final List<File> images;

  @override
  List<Object?> get props => [images];
}

class UpdateIdImagesEvent extends SalePropertyEvent {
  UpdateIdImagesEvent({required this.idImages});

  final List<File> idImages;

  @override
  List<Object?> get props => [idImages];
}

class UpdatePropertyDocumentsEvent extends SalePropertyEvent {
  UpdatePropertyDocumentsEvent({required this.propertyDocuments});

  final List<File> propertyDocuments;

  @override
  List<Object?> get props => [propertyDocuments];
}
