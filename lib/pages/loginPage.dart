import 'package:flutter/material.dart';
import 'package:sincapp/components/myButton.dart';
import 'package:sincapp/components/square_tile.dart';
import 'package:sincapp/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sincapp/pages/mainPage.dart';
import 'package:sincapp/pages/registerPage.dart';

class LoginPage extends StatefulWidget {
  final bool showSuccessMessage;
  
  const LoginPage({
    super.key, 
    this.showSuccessMessage = false,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // State variables
  bool isLoading = false;
  String errorMessage = '';
  
  // Sign in method
  Future<void> signIn() async {
    if(emailController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() {
        errorMessage = 'fill all the fields :) صلف';
      });
      return;
    }
    
    setState(() {
      isLoading = true;
      errorMessage = '';
    });
    
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      
      // Navigate to main page on successful login
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'An error occurred during login';
      });
    } catch (e) {
      setState(() {
        errorMessage = 'An unexpected error occurred';
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCFD8C7),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                
                // Display error message if any
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        errorMessage,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: "Urbanist",
                        ),
                      ),
                    ),
                  ),
                
                SizedBox(height: 10),
                
                // email username field
                MyTextField(
                  hintText: "Enter your email",
                  obscureText: false,
                  controller: emailController,
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
                      GestureDetector(
                        onTap: () {
                          // Handle forgot password
                          if (emailController.text.isNotEmpty) {
                            _auth.sendPasswordResetEmail(email: emailController.text.trim());
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Password reset email sent!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please enter your email first'),
                                backgroundColor: Colors.orange,
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xFF6A707C),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Urbanist",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 32),
                //Login button
                isLoading
                  ? CircularProgressIndicator(color: Color(0xFF40798C))
                  : MyButton(title: "Login", passedFunc: signIn),
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
                SizedBox(height: 66),



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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                           MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                           ));
                      },
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                          color: Color(0xFF40798C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Urbanist",
                        ),
                      ),
                    ),
                  ],
                )
            
            ],),
          ),
        ),
      ),
    );
  }
}
