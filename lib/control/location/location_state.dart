part of 'location_bloc.dart';

class LocationState {
  String address;
  LocationState({required this.address});
}

class LocationInitial extends LocationState {
  LocationInitial() : super(address: "");
}
