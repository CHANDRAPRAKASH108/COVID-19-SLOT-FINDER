import 'dart:convert';

import 'package:covidslot/screens/slotsscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController pincontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  String dropdownValue = '01';
  List slots = [];
  //--------------------------- getting data from api -----------------------------

  fetchslots() async {
    await http
        .get(Uri.parse(
            'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=' +
                pincontroller.text +
                '&date=' +
                datecontroller.text +
                '%2F' +
                dropdownValue +
                '%2F2021'))
        .then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        slots = result['sessions'];
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Slot(
                    slots: slots,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(image: AssetImage('assets/vaccine.png')),
              const SizedBox(
                height: 20.0,
              ),
              const Text('COVID-19 VACCINE SLOTS',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.blue,
                      decoration: TextDecoration.underline)),
              Container(
                margin: const EdgeInsets.all(30.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Enter PIN CODE'),
                    suffixIcon: Icon(Icons.pin),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                  controller: pincontroller,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Enter Date'),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                        ),
                        controller: datecontroller,
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 52,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_circle_down_rounded),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.blue),
                          underline: Container(
                            height: 2,
                            color: Colors.blue,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            '01',
                            '02',
                            '03',
                            '04',
                            '05',
                            '06',
                            '07',
                            '08',
                            '09',
                            '10',
                            '11',
                            '12'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(30.0),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      fetchslots();
                    },
                    child: const Text('Find Slot'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
