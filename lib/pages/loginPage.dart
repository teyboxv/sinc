import 'package:flutter/material.dart';
import 'package:sincapp/components/myButton.dart';
import 'package:sincapp/components/square_tile.dart';
import 'package:sincapp/components/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  

  @override
  _LoginPageState createState() => _LoginPageState();
}
// text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCFD8C7),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 15),
              //Logo Sinc
              Text(
                "Sinc",
                style: TextStyle(
                  fontSize: 96,
                  fontFamily: "Iceberg",
                ),
              ),

              SizedBox(height: 30),
              
              // email username field
              MyTextField(
                hintText: "Enter your email or username",
                obscureText: false,
                controller: usernameController,
              ),
              SizedBox(height: 5),
              // password field
              MyTextField(
                hintText: "Enter your password",
                obscureText: true,
                controller: passwordController,
              ),
              //forgot password field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color(0xFF6A707C),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Urbanist",
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32),
              //Login button
              MyButton(),
              SizedBox(height: 30),

              //or login with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xFF6E7C77),
                
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Or Login With",
                        style: TextStyle(
                          color: Color(0xFF6E7C77),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Urbanist",
                        ),
                        
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xFF6E7C77),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22),
              
              
              //facebook+google+apple buttons
              Row(children: [
                //facebook
                SquareTile(imagePath: "lib/assets/images/facebook.png"),

                //gooogle
                SquareTile(imagePath: "lib/assets/images/google.png"),

                //apple
                SquareTile(imagePath: "lib/assets/images/apple.png"),

              ],
                
              )



              //don't have an account? sign up
          
          ],),
        ),
      ),
    );
  }
}
