part of 'location_bloc.dart';

@immutable
abstract class LocationEvent {}

class AddressDisply extends LocationEvent {
  Position position;
  AddressDisply({required this.position});
}
