import 'package:biocube_task/MVC/Veiw/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Controller/login_controller.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);
    return Scaffold(
      body:Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ]),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Hello\nSign in with MVC!',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child:  Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Email Id',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffB81736),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffB81736),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 70,),
                      controller.isLoading
                          ? const CircularProgressIndicator()
                          : InkWell(
                        onTap: () async {
                          controller.clearError();
                          bool isSuccess = await controller.login(
                            _usernameController.text.trim(),
                            _passwordController.text.trim(),
                          );

                          if (isSuccess) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(user: controller.user)),
                            );
                          }
                        },
                        child: Container(
                          height: 55,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xffB81736),
                                  Color(0xff281537),
                                ]),
                          ),
                          child: const Center(
                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      if (controller.errorMessage.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            controller.errorMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
  }
}
