import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<AddressDisply>((event, emit) async {
      // TODO: implement event handler
      String address = await getAddressFromLatLog(event.position);

      return emit(LocationState(address: address));
    });
  }
}

// Address function
Future<String> getAddressFromLatLog(Position position) async {
  List<Placemark> placemarker =
      await placemarkFromCoordinates(position.latitude, position.longitude);
  Placemark place = placemarker[0];
  String address =
      " ${place.street}, ${place.subLocality}, ${place.country}, ${place.postalCode}";

  return address;
}
