import 'package:flutter/material.dart';
import 'package:sincapp/components/myButton.dart';
import 'package:sincapp/components/square_tile.dart';
import 'package:sincapp/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sincapp/pages/loginPage.dart';

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
  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  String errorMessage = '';

  // Sign up method
  Future<void> signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      if (usernameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty) {
        setState(() {
          errorMessage = 'fill all the fields يا زق';
        });
        return;
      }

      setState(() {
        errorMessage = 'Passwords dont match يا فنطل';
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Add username to user profile
      if (_auth.currentUser != null) {
        await _auth.currentUser!
            .updateDisplayName(usernameController.text.trim());
      }

      // Sign out the user after registration
      await _auth.signOut();

      // Navigate to login page and show success message
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(
              showSuccessMessage: true,
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'An error occurred during registration';
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

                SizedBox(height: 20),

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
                SizedBox(height: 5),
                MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController,
                ),
                SizedBox(height: 5),
                MyTextField(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: confirmPasswordController,
                ),

                //forgot password field

                SizedBox(height: 32),
                //Register button
                if (isLoading)
                  CircularProgressIndicator()
                else
                  MyButton(
                    title: "SignUp",
                    passedFunc: signUp,
                  ),

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
                    SizedBox(width: 8),

                    //gooogle
                    SquareTile(imagePath: "lib/assets/images/google.png"),
                    SizedBox(width: 8),

                    //apple
                    SquareTile(imagePath: "lib/assets/images/apple.png"),
                  ],
                ),
                SizedBox(height: 40),

                //have an account? login now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account?",
                      style: TextStyle(
                        color: Color(0xFF0C2027),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Urbanist",
                      ),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Login Now",
                        style: TextStyle(
                          color: Color(0xFF40798C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Urbanist",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
