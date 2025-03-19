import 'package:flutter/material.dart';

class appBar extends StatelessWidget {
  const appBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
                leading: const Text('Sinc', style: TextStyle(
                  fontFamily: "Iceberg",
                  fontSize: 50,
                
                ),
                ),
                leadingWidth: 100,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right:10.0 , top:15),
                    child: Icon(Icons.notifications),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:10.0 , top:15),
                    child: Icon(Icons.message),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:10.0 , top:15),
                    child: Icon(Icons.settings),
                  ),

                

                ],
                
                // elevation: 0,
                backgroundColor: const Color(0xFFCFD8C7),
              );
              
  }
}