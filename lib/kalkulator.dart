import 'package:flutter/material.dart';

class Kalkulator extends StatefulWidget {
  @override
  State<Kalkulator> createState() => _KalkuState();
}

class _KalkuState extends State<Kalkulator> {
  //inisialisasi untuk text field
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  double? result = 0, input1 = 0, input2 = 0;
  tambah() {
    //memanipulasi atau mengubah inputan dengan setstate
    setState(() {
      input1 = double.parse(num1.text);
      input2 = double.parse(num2.text);
      result = input1! + input2!; //! bang operator : inputan tidak boleh kosong
    });
  }

  kurang() {
    setState(() {
      input1 = double.parse(num1.text);
      input2 = double.parse(num2.text);
      result = input1! - input2!;
    });
  }

  kali() {
    setState(() {
      input1 = double.parse(num1.text);
      input2 = double.parse(num2.text);
      result = input1! * input2!;
    });
  }

  bagi() {
    setState(() {
      input1 = double.parse(num1.text);
      input2 = double.parse(num2.text);
      result = input1! / input2!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Operasi Aritmatika'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 205, 240, 255),
                Color.fromARGB(255, 165, 229, 255)
              ],
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: num1,
                decoration: InputDecoration(
                    labelText: "Masukkan angka ke-1",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: num2,
                decoration: InputDecoration(
                    labelText: "Masukkan angka ke-2",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        tambah();
                        num1.clear();
                        num2.clear();
                      },
                      child: Text("Tambah")),
                  ElevatedButton(
                      onPressed: () {
                        kurang();
                        num1.clear();
                        num2.clear();
                      },
                      child: Text("Kurang")),
                  ElevatedButton(
                      onPressed: () {
                        kali();
                        num1.clear();
                        num2.clear();
                      },
                      child: Text("Kali")),
                  ElevatedButton(
                      onPressed: () {
                        bagi();
                        num1.clear();
                        num2.clear();
                      },
                      child: Text("Bagi")),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "Hasil: $result",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}
