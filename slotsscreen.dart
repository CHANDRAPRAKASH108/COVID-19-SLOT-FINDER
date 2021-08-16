import 'package:flutter/material.dart';

class Slot extends StatefulWidget {
  final List slots;
  const Slot({required this.slots});

  @override
  _SlotState createState() => _SlotState();
}

class _SlotState extends State<Slot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Availabel Slots'),
      ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
            itemCount: widget.slots.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue),
                //height: 250,
                child: Container(
                  margin: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Center ID: ' +
                            widget.slots[index]['center_id'].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16.0),
                      ),
                      Text(
                        'Center Name: ' +
                            widget.slots[index]['name'].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16.0),
                      ),
                      Text(
                        'Address: ' + widget.slots[index]['address'].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16.0),
                      ),
                      Text(
                        'District: ' +
                            widget.slots[index]['district_name'].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16.0),
                      ),
                      Text(
                        'PIN Code: ' +
                            widget.slots[index]['pincode'].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16.0),
                      ),
                      Text(
                        'Fee- Type: ' +
                            widget.slots[index]['fee_type'].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16.0),
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 3.0,
                      ),
                      Text(
                        'Vaccine: ' + widget.slots[index]['vaccine'].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16.0),
                      ),
                      Text(
                        'Availabel Capacity: ' +
                            widget.slots[index]['available_capacity']
                                .toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16.0),
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 3.0,
                      ),
                      Text(
                        'Slots: ' + widget.slots[index]['slots'].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
