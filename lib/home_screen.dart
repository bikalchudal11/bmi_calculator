// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var kgController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BMI",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: kgController,
                decoration: InputDecoration(
                  label: Text("Enter your weight in KG"),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                  label: Text("Enter your height in FEET"),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: inController,
                decoration: InputDecoration(
                  label: Text("Enter your height in INCH"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  //BMI Calculation
                  var wt = kgController.text.toString();
                  var fe = ftController.text.toString();
                  var inc = inController.text.toString();
                  if (wt != "" && fe != "" && inc != "") {
                    var iwt = int.parse(wt);
                    var ife = int.parse(fe);
                    var iinc = int.parse(inc);

                    var tinc = (ife * 12) + iinc;
                    var tcen = tinc * 2.54;
                    var tmet = tcen / 100;
                    var bmi = iwt / (tmet * tmet);
                    setState(() {
                      result = "Your BMI is: ${bmi.toStringAsFixed(2)}";
                    });
                  } else {
                    setState(() {
                      result = "Please fill all the required blanks";
                    });
                  }
                },
                child: Text("Calculate"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                result,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
