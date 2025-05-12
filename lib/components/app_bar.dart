import 'package:flutter/material.dart';
import 'package:sincapp/pages/login/loginPage.dart';
class appBar extends StatelessWidget {
  VoidCallback signOutTapped;

  appBar({super.key, required this.signOutTapped});

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
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(right:10.0 , top:15),
                      child: Icon(Icons.settings),
                      
                    ),
                    onTap:(){
                      signOutTapped();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      print("signOutTapped();");
                    },
                  ),

                

                ],
                
                // elevation: 0,
                backgroundColor: const Color(0xFFCFD8C7),
              );
              
  }
}