
import 'package:biocube_task/MVVM/View/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ViewModel/login_view_model.dart';


class LoginScreenMvvM extends StatelessWidget {
   LoginScreenMvvM({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    final viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      body: Stack(
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
                'Hello\nSign in with MVVM!',
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
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller:  usernameController,
                      decoration: const InputDecoration(
                        label: Text(
                          'Email Id',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffB81736),
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                        label: Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffB81736),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 70),
                    viewModel.isLoading
                        ? const CircularProgressIndicator()
                        : InkWell(
                      onTap: () async {
                        viewModel.clearError();
                        bool isSuccess = await viewModel.login(
                          usernameController.text.trim(),
                            passwordController.text.trim(),
                        );

                        if (isSuccess) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen(user: viewModel.user,)),
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
                    if (viewModel.errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          viewModel.errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
