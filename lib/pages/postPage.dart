import 'package:flutter/material.dart';
import 'package:sincapp/components/BottomNavBar/customNavBar.dart';
import 'package:sincapp/components/backButton.dart';
import 'package:sincapp/components/myButton.dart';

class Postpage extends StatefulWidget {
  const Postpage({super.key});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<Postpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCFD8C7),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFCFD8C7),
        title: Text(
          "New Post",
          style: TextStyle(
            fontSize: 24,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.bold,
          ),
          
          ),

      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //back button
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 25),
            child: Backbutton(),
          ),

          //rectangle at background
          Expanded(
            child: Form(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFE4EBDD),
                  borderRadius: BorderRadius.circular(39),
                ),
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // image framer
                    Container(
                      height: 170,
                      width: 270,
                      decoration: BoxDecoration(
                        color: Color(0xFF788682),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0xFFCFD8C7),
                          width: 11,
                        ),
                      ),
                      child: Icon(Icons.image, size: 48, color: Color(0xFFE4EBDD)),
                    ),
                    SizedBox(height: 24),

                    // textfield
                    TextFormField(
                      maxLength: 200,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Write your caption...",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                    SizedBox(height: 8),

                    // character remaining
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "200 characters remaining",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Spacer(),

                    // button
                MyButton(
                  title: "Share",
                  passedFunc: () {
                    // Handle share button tap
                  },
                )
                  ],
                ),
              ),
            ),
          ),
          //image framer
          
          //textfield

          //character remaining 

          //button
        ],
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
