part of 'location_bloc.dart';

@immutable
abstract class LocationEvent {}

// ignore: must_be_immutable
class AddressDisply extends LocationEvent {
  Position position;
  AddressDisply({required this.position});
}
