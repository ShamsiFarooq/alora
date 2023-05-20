import 'dart:developer';

import 'package:alora/screens/requirement/location/functions.dart';
import 'package:alora/services/bloc/location/location_bloc.dart';
import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class AddLocation extends StatelessWidget {
  AddLocation({
    super.key,
  });

  late num locLatitude;

  late num locLogitude;

  String address = "";
  TextEditingController controllerAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        controllerAddress.text = state.address;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
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
                      BlocProvider.of<LocationBloc>(context)
                          .add(AddressDisply(position: position));
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
              padding: const EdgeInsets.only(top: 3, left: 10),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: color2,
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextFormField(
                // readOnly: true,
                minLines: 4,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Address",
                  fillColor: color4,
                  hintStyle: const TextStyle(color: color4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                controller: controllerAddress,
                cursorColor: color5,
              ),
            )
          ],
        );
      },
    );
  }
}
