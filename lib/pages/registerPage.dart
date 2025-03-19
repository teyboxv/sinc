import 'package:flutter/material.dart';
import 'package:sincapp/components/myButton.dart';
import 'package:sincapp/components/square_tile.dart';
import 'package:sincapp/components/textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  

  @override
  _RegisterPageState createState() => _RegisterPageState();
}
// text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
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
                hintText: "Username",
                obscureText: false,
                controller: usernameController,
              ),
              SizedBox(height: 5),
              // password field
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: emailController,
              ),
              MyTextField(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),
              MyTextField(
                hintText: "Confirm Password",
                obscureText: true,
                controller: confirmPasswordController,
              ),
              //forgot password field
              
      
              SizedBox(height: 32),
              //Login button
              MyButton(title:"Agree and Register"),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                //facebook
                SquareTile(imagePath: "lib/assets/images/facebook.png"),
                SizedBox(width: 8,),
      
                //gooogle
                SquareTile(imagePath: "lib/assets/images/google.png"),
                SizedBox(width: 8,),
      
                //apple
                SquareTile(imagePath: "lib/assets/images/apple.png"),
      
              ],
                
              ),
              SizedBox(height: 40),
      
      
      
              //don't have an account? sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have an account?",
                    style: TextStyle(
                      color: Color(0xFF0C2027),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Urbanist",
                    ),
                    
                  
                  ),
                  SizedBox(width: 4,),
                  Text(
                      "Register Now",
                      style: TextStyle(
                        color: Color(0xFF40798C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Urbanist",
                      ),
                    ),
                ],
              )
          
          ],),
        ),
      ),
    );
  }
}
