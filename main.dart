import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle fixedStyle = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 30, color: Colors.blue);

  //button fixed style and text style

  ButtonStyle newStyle = const ButtonStyle(
    minimumSize: MaterialStatePropertyAll(
      Size(double.infinity, 10),
    ),
    padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
    backgroundColor: MaterialStatePropertyAll(Colors.blue),
  );
  // text
  TextStyle buttonStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // creating variable
  double billAmount = 0;
  double tipPercentage = 0;
  int person = 0;

  //result varibale

  double tipPerpeson = 0;
  double totalPerperson = 0;

  //creating text edit controller which is store the value

  TextEditingController billAmountController = TextEditingController();
  TextEditingController tipPercentageController = TextEditingController();
  TextEditingController personController = TextEditingController();

  //Lets implement the logic
  void calculate() {
    tipPerpeson = (billAmount * tipPercentage) / person;
    totalPerperson = (billAmount * (1 + tipPercentage)) / person;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Logo Header

            Container(
              height: 200,
              width: double.infinity,
              child: Center(
                child: Image.asset("assets/1.png"),
              ),
            ),
            //body
            /* 
            
            
            
            */
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 30,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bill Amount",
                    style: fixedStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: billAmountController,
                    onChanged: (value) {
                      setState(
                        () {
                          if (billAmountController.text.isNotEmpty) {
                            billAmount =
                                double.parse(billAmountController.text);
                          } else {
                            billAmount = 0;
                          }
                          // keyboard focus
                          //  FocusScope.of(context).unfocus();
                          calculate();
                        },
                      );
                    },
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.blue,
                      border: InputBorder.none,
                      hintText: "eg : 100",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      prefixIcon: Icon(
                        Icons.currency_rupee,
                        color: Colors.white,
                      ),
                    ),
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Select Tip %",
                    style: fixedStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                tipPercentage = 0.05;
                                calculate();
                              });
                            },
                            style: newStyle,
                            child: Text(
                              "5 %",
                              style: buttonStyle,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                tipPercentage = 0.10;
                                calculate();
                              });
                            },
                            style: newStyle,
                            child: Text(
                              "10 %",
                              style: buttonStyle,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                tipPercentage = 0.15;
                                calculate();
                              });
                            },
                            style: newStyle,
                            child: Text(
                              "15 %",
                              style: buttonStyle,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                tipPercentage = 0.20;
                                calculate();
                              });
                            },
                            style: newStyle,
                            child: Text(
                              "20 %",
                              style: buttonStyle,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                tipPercentage = 0.25;
                                calculate();
                              });
                            },
                            style: newStyle,
                            child: Text(
                              "25 %",
                              style: buttonStyle,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            controller: tipPercentageController,
                            onChanged: (value) {
                              setState(() {
                                if (tipPercentageController.text.isNotEmpty) {
                                  tipPercentage = double.parse(
                                          tipPercentageController.text) /
                                      100;
                                } else {
                                  tipPercentage = 0;
                                }
                                // FocusScope.of(context).unfocus();
                                calculate();
                              });
                            },
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            decoration: const InputDecoration(
                              hintMaxLines: 1,
                              filled: true,
                              fillColor: Colors.blue,
                              border: InputBorder.none,
                              hintText: "Custom",
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Number of people",
                    style: fixedStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: personController,
                    onChanged: (value) {
                      setState(
                        () {
                          if (personController.text.isNotEmpty) {
                            person = int.parse(personController.text);
                          } else {
                            person = 1;
                          }
                          // keyboard focus
                          //  FocusScope.of(context).unfocus();
                          calculate();
                        },
                      );
                    },
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.blue,
                      border: InputBorder.none,
                      hintText: "eg : 2 Person",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(30),
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tip Amount",
                                  style: buttonStyle,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "/ Person",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.lightBlueAccent,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "₹${tipPerpeson.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total",
                                  style: buttonStyle,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "/ Person",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.lightBlueAccent,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "₹${totalPerperson.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              billAmount = 0;
                              person = 1;
                              tipPercentage = 0;
                              calculate();
                              billAmountController.clear();
                              personController.clear();
                              tipPercentageController.clear();
                            });
                          },
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 64, 169, 255)),
                              fixedSize: MaterialStatePropertyAll(
                                Size(double.maxFinite, double.infinity),
                              ),
                              alignment: Alignment.center,
                              side: MaterialStatePropertyAll(BorderSide.none)),
                          child: const Text(
                            "Reset",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
