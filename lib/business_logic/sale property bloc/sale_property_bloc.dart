import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'dart:io';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sale_property_event.dart';
part 'sale_property_state.dart';


class SalePropertyBloc extends Bloc<SalePropertyEvent, SalePropertyState> {
  SalePropertyBloc() : super(SalePropertyState(propertyType: '')) {
    on<UpdatePropertyTypeEvent>((event, emit) {
      emit(state.copyWith(propertyType: event.propertyType));
    });

    on<UpdateAreaEvent>((event, emit) {
      emit(state.copyWith(area: event.area));
    });

    on<UpdateNumberOfRoomsEvent>((event, emit) {
      emit(state.copyWith(numberOfRooms: event.numberOfRooms));
    });

    on<UpdateNumberOfBathroomsEvent>((event, emit) {
      emit(state.copyWith(numberOfBathRooms: event.numberOfBathrooms));
    });

    on<UpdatePropertyAgeEvent>((event, emit) {
      emit(state.copyWith(propertyAge: event.propertyAge));
    });

    on<UpdateDecorationEvent>((event, emit) {
      emit(state.copyWith(decoration: event.decoration));
    });

    on<UpdateKitchenTypeEvent>((event, emit) {
      emit(state.copyWith(kitchenType: event.kitchenType));
    });

    on<UpdateFlooringTypeEvent>((event, emit) {
      emit(state.copyWith(flooringType: event.flooringType));
    });

    on<UpdateOverlookFromEvent>((event, emit) {
      emit(state.copyWith(overlookFrom: event.overlookFrom));
    });

    on<UpdateBalconySizeEvent>((event, emit) {
      emit(state.copyWith(balconySize: event.balconySize));
    });

    on<UpdatePaintingTypeEvent>((event, emit) {
      emit(state.copyWith(paintingType: event.paintingType));
    });

    on<UpdatePriceEvent>((event, emit) {
      emit(state.copyWith(price: event.price));
    });

    on<UpdatePayWayEvent>((event, emit) {
      emit(state.copyWith(payWay: event.payWay));
    });

    on<UpdateStateEvent>((event, emit) {
      emit(state.copyWith(state: event.state));
    });

    on<UpdateExactPositionEvent>((event, emit) {
      emit(state.copyWith(exactPosition: event.exactPosition));
    });

    on<UpdateImagesEvent>((event, emit) {
      emit(state.copyWith(images: List.of(event.images)));
    });

    on<UpdateIdImagesEvent>((event, emit) {
      emit(state.copyWith(idImages: List.of(event.idImages)));
    });

    on<UpdatePropertyDocumentsEvent>((event, emit) {
      emit(state.copyWith(propertyDocument: List.of(event.propertyDocuments)));
    });
  }
}