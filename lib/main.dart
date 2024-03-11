import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String textScreem = "";
  MaterialColor color = Colors.green;
  Color telaColor = Colors.blueGrey;
  bool ligado = false;
  void takeNumber(String num) {
    if (num != "=" && ligado) {
      setState(() {
        textScreem += num;
      });
    } else {
      if (textScreem.contains("x")) {
        var numbers = textScreem.split("x");
        var resul = 1;

        numbers.forEach((element) {
          resul *= int.parse(element);
        });

        setState(() {
          textScreem = resul.toString();
        });
      }
      if (textScreem.contains("+")) {
        var numbers = textScreem.split("+");
        var resul = 1;

        numbers.forEach((element) {
          resul += int.parse(element);
        });

        setState(() {
          textScreem = resul.toString();
        });
      }
      if (textScreem.contains("-")) {
        var numbers = textScreem.split("-");
        var resul = int.parse(numbers[0]);

        for (var i = 1; i < numbers.length; i++) {
          resul -= int.parse(numbers[i]);
        }

        setState(() {
          textScreem = resul.toString();
        });
      }
      if (textScreem.contains("/")) {
        var numbers = textScreem.split("/");
        var resul = double.parse(numbers[0]);

        for (var i = 1; i < numbers.length; i++) {
          resul /= int.parse(numbers[i]);
        }

        setState(() {
          textScreem = resul.toString();
        });
      }
    }
  }

  void ligar() {
    setState(() {
      ligado = !ligado;

      color = ligado ? Colors.red : Colors.green;
      telaColor = ligado
          ? const Color.fromARGB(255, 25, 142, 238)
          : Color.fromARGB(255, 67, 68, 69);
      if (!ligado) textScreem = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Caculadora",
      home: Center(
        child: Stack(
          children: [
            Container(
              width: 300,
              height: 370,
              color: Color.fromARGB(136, 0, 0, 0),
            ),
            Positioned(
              top: 20,
              left: 15,
              child: Container(
                width: 270,
                height: 70,
                color: telaColor,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    '${textScreem}',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 115,
                left: 15,
                child: Container(
                  width: 270,
                  height: 220,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          right: 0,
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(155, 0, 0, 0))),
                              onPressed: ligar,
                              child: Text(
                                !ligado ? "On" : "OFF",
                                style: TextStyle(color: color),
                              ))),
                      Positioned(
                          top: 50,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      155, 0, 0, 0))),
                                      onPressed: () => takeNumber("1"),
                                      child: const Text("1")),
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      155, 0, 0, 0))),
                                      onPressed: () => takeNumber("2"),
                                      child: const Text("2")),
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      155, 0, 0, 0))),
                                      onPressed: () => takeNumber("3"),
                                      child: const Text("3")),
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      155, 0, 0, 0))),
                                      onPressed: () => takeNumber("+"),
                                      child: const Text("+"))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      155, 0, 0, 0))),
                                      onPressed: () => takeNumber("4"),
                                      child: const Text("4")),
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      155, 0, 0, 0))),
                                      onPressed: () => takeNumber("5"),
                                      child: const Text("5")),
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      155, 0, 0, 0))),
                                      onPressed: () => takeNumber("6"),
                                      child: const Text("6")),
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      155, 0, 0, 0))),
                                      onPressed: () => takeNumber("-"),
                                      child: const Text("-"))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      155, 0, 0, 0))),
                                      onPressed: () => takeNumber("7"),
                                      child: const Text("7")),
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      155, 0, 0, 0))),
                                      onPressed: () => takeNumber("8"),
                                      child: const Text("8")),
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      155, 0, 0, 0))),
                                      onPressed: () => takeNumber("9"),
                                      child: const Text("9")),
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      155, 0, 0, 0))),
                                      onPressed: () => takeNumber("x"),
                                      child: const Text("X"))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      155, 0, 0, 0))),
                                      onPressed: () => takeNumber("0"),
                                      child: const Text("0")),
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      155, 0, 0, 0))),
                                      onPressed: () => takeNumber("."),
                                      child: const Text(".")),
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      155, 0, 0, 0))),
                                      onPressed: () => takeNumber("="),
                                      child: const Text("=")),
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      155, 0, 0, 0))),
                                      onPressed: () => takeNumber("/"),
                                      child: const Text("/"))
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
