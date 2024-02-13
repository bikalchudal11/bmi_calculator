import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var wtController = TextEditingController();
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
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "BMI",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: wtController,
                decoration: const InputDecoration(
                  label: Text("Enter your weight in KG"),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: ftController,
                decoration: const InputDecoration(
                  label: Text("Enter your height in FEET"),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: inController,
                decoration: const InputDecoration(
                  label: Text("Enter your height in INCH"),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inc = inController.text.toString();

                  if (wt != "" && ft != "" && inc != "") {
                    //BMI Calculation
                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iinc = int.parse(inc);

                    var tIch = (ift * 12) + iinc;
                    var tcen = tIch * 2.54;
                    var tmet = tcen / 100;
                    var bmi = iwt / (tmet * tmet);
                    setState(() {
                      result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                    });
                  } else {
                    setState(() {
                      result = "Please fill all the required blanks!";
                    });
                  }
                },
                child: const Text(
                  "Calculate",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Ideal BMI is: (18.5 — 24.9)"),
              const SizedBox(
                height: 20,
              ),
              Text(
                result,
                style: const TextStyle(fontSize: 18, color: Colors.deepOrange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
