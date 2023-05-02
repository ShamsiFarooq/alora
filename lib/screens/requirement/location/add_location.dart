import 'package:alora/screens/requirement/location/functions.dart';
import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({
    super.key,
  });

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  late num locLatitude;
  late num locLogitude;
  String address = "";

  TextEditingController _controllerAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "5. Add Location",
          style: TextStyle(
            fontSize: 18,
            color: color5,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 40,
              ),
              child: ElevatedButton(
                onPressed: () async {
                  Position position = await determinePosition();
                  print(position.latitude);
                  locLatitude = position.latitude;
                  locLogitude = position.longitude;
                  GetAddressFromLatLog(position).toString();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: color5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Add Location',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
        height15,
        Container(
          padding: EdgeInsets.only(top: 3, left: 10),
          width: size.width * 0.8,
          decoration: BoxDecoration(
            color: color2,
            borderRadius: BorderRadius.circular(29),
          ),
          child: TextFormField(
            minLines: 4,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              hintText: "Address",
              fillColor: color4,
              hintStyle: TextStyle(color: color4),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
            controller: _controllerAddress,
            cursorColor: color5,
          ),
        )
      ],
    );
  }

// Address function
  Future<String> GetAddressFromLatLog(Position position) async {
    List<Placemark> placemarker =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarker[0];
    String address =
        " ${place.street}, ${place.subLocality}, ${place.country}, ${place.postalCode}";
    print(address);
    setState(() {
      _controllerAddress.text = address;
    });
    return address;
  }
}
