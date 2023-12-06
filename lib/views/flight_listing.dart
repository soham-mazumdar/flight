import 'dart:developer';

import 'package:flight/data.dart';
import 'package:flight/model/flight.dart';
import 'package:flight/theme/app_colors.dart';
import 'package:flight/theme/app_text_style.dart';
import 'package:flight/widgets/custom_dropdown.dart';
import 'package:flight/widgets/flight_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FlightListingScreen extends StatefulWidget {
  const FlightListingScreen({super.key});

  @override
  State<FlightListingScreen> createState() => _FlightListingScreenState();
}

class _FlightListingScreenState extends State<FlightListingScreen> {
  final f = DateFormat('yyyy-MM-dd');
  final destinations = ['DEL', 'BLR', 'PNQ', 'BOM'];
  String selectedDate = '';
  String from = 'DEL';
  String to = 'BLR';
  // DateTime? time;

  final flights = flightJson.map((e) => Flight.fromJson(e)).toList();
  var filteredFlights = flightJson.map((e) => Flight.fromJson(e)).toList();

  @override
  void initState() {
    super.initState();

    selectedDate = f.format(DateTime(2023, 12, 8));
    filter();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(selectedDate),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = f.format(picked);
      });
    }
    filter();
  }

  filter() {
    filteredFlights = flights.where((element) {
      log("selectedDate : $selectedDate");
      log("element.time : ${element.time}");
      log((selectedDate == element.time).toString());
      if (from == element.from && to == element.to && selectedDate == element.time) {
        return true;
      }
      return false;
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Maddy Flight Booking'),
        titleTextStyle: AppTextStyle.appBar,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                // DropdownButton<String>(
                //   items: destinations.where((element) => element != to).map((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                //   value: from,
                //   onChanged: (val) {
                //     if (val != null) {
                //       setState(() {
                //         from = val;
                //       });
                //       filter();
                //     }
                //   },
                // ),
                CustomDropdown(
                  destinations: destinations,
                  ignore: to,
                  val: from,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        from = val;
                      });
                      filter();
                    }
                  },
                ),

                const SizedBox(width: 20),
                CustomDropdown(
                  destinations: destinations,
                  ignore: from,
                  val: to,
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        to = val;
                      });
                      filter();
                    }
                  },
                )
                // to
                // date
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text('Select date'),
                    ),
                    Text(selectedDate),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            filteredFlights.isEmpty
                ? Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('No flights available'),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: filteredFlights.length,
                      itemBuilder: (context, index) {
                        return FlightTile(flight: filteredFlights[index]);
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }

  // Container newMethod(int index) {
  //   return Container(
  //     child: Row(
  //       children: [
  //         Text(filteredFlights[index].flightNo.toString()),
  //         Expanded(child: Text(filteredFlights[index].name!)),
  //         Expanded(child: Text(filteredFlights[index].time!)),
  //         GestureDetector(
  //           child: Container(
  //             child: Text('Book'),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
