import 'package:bustrackingapp/providers/provider.dart';
import 'package:bustrackingapp/screens/parentsscrens/trackingbus/track/data/list_of_bus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class bus_and_num extends StatefulWidget {
  bus_and_num({super.key, required this.busnum, required this.img_path});

  final busnum;
  final img_path;

  @override
  State<bus_and_num> createState() => _bus_and_numState();
}

class _bus_and_numState extends State<bus_and_num> {
  bool tick = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          print("ohhhhhhhhhhhhhhhhhhhhhhh");
          setState(() {
            tick = !tick;
            if (tick == false) {
              Provider.of<Alldata>(context, listen: false)
                  .list_of_selected_bus
                  .removeWhere(
                (element) {

                  // aya check thay badha element hare jaya true thay e delete thay
                  return element == this.widget.busnum;
                },
              );
              // print(
              //     "new datattatat ${Provider.of<Alldata>(context, listen: false).list_of_selected_bus} ");
            } else if (tick == true) {
              Provider.of<Alldata>(context, listen: false)
                  .list_of_selected_bus
                  .add(this.widget.busnum);

              // print(
              //     "new datattatat ${Provider.of<Alldata>(context, listen: false).list_of_selected_bus} ");
            }
          });
        },
        child: Container(
          height: 100,
          width: 65,
          child: Column(
            children: [
              Stack(
                children: [
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(40),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(widget.img_path),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: tick,
                    child: Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundImage:
                              AssetImage("assets/images/true_logo.png"),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                height: 15,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Center(
                  child: Text(widget.busnum),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
