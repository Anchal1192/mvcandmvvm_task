import 'package:flutter/material.dart';

import '../../../MVVM/Model/user_model.dart';

class HomeScreen extends StatelessWidget {
  final User? user;

  const HomeScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: user != null
                    ? Text(
                  'Welcome, ${user!.username}!',
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
                    : const Text(
                  'Welcome!',
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
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Colors.white,
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(children: [
                    Container(
                      height: 200,
                      width: 200,
                      margin: const EdgeInsets.only(top: 20,bottom: 10),
                      child: ClipRRect(
                        child: Image.network(user!.image.toString(),fit: BoxFit.cover,),
                      ),
                    ),
                    Text("${user!.username.toString().toUpperCase()} ${user!.lastname.toString().toUpperCase()}",
                      style: const TextStyle(
                          fontSize: 30,
                          color:Color(0xffB81736),
                          fontWeight: FontWeight.bold),),
                    Text(user!.email.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            color:Color(0xffB81736),
                            fontWeight: FontWeight.normal)),
                  ],),
                ))
          ],
        ));
  }
}
