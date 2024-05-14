import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigator/page2.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final textController = TextEditingController();
  String selected = "Dart";

  final List<String> dropDownList = const [
    "Dart",
    "Kotlin",
    "Java",
    "Javascript",
    "PHP",
    "Python",
    "Ruby",
    "Swift",
  ];

  bool isOn = false;
  String sex = "pria";
  bool isChecked = false;
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLength: 30,
                controller: textController,
                decoration: const InputDecoration(
                  labelText: "Nama",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  helperText: "Masukkan nama",
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Pilih Bahasa Favorit :"),
                  SizedBox(width: 20),
                  DropdownButton(
                      value: selected,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      style: TextStyle(color: Colors.black),
                      underline: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                      items: dropDownList.map((String value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          if (val != null) selected = val;
                          print(selected);
                        });
                      })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Saklar"),
                  Switch(
                      value: isOn,
                      onChanged: (bool? val) {
                        if (val != null) {
                          setState(() {
                            isOn = val;
                            print("Switch: $isOn");
                          });
                        }
                      })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Jenis Kelamin: "),
                  SizedBox(
                    width: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                          value: 'pria',
                          groupValue: sex,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                sex = value;
                                print("sex: $sex");
                              }
                            });
                          }),
                      const Text("Pria"),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: "wanita",
                        groupValue: sex,
                        onChanged: (value) {
                          setState(() {
                            if (value != null) {
                              sex = value;
                              print("sex: $sex");
                            }
                          });
                        },
                      ),
                      const Text("Wanita"),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        isChecked = value;
                        print("setuju: $isChecked");
                      }
                    });
                  },
                ),
                const SizedBox(width: 4),
                const Text(
                  "Setuju syarat dan ketentuan.",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1960),
                      lastDate: DateTime(2100));
                  setState(() {
                    if (pickedDate != null) {
                      dateController.text = pickedDate.toString();
                    }
                  });
                  debugPrint("Date Picker: $pickedDate");
                },
                child: TextFormField(
                  controller: dateController,
                  // initialValue: "2023-12-11",
                  maxLength: 12,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: "Tanggal Lahir",
                    labelStyle: TextStyle(color: Colors.blueGrey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                    suffixIcon: Icon(Icons.date_range),
                    helperText: "Pilih tanggal lahir anda",
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Info"),
                          content: SingleChildScrollView(
                              child: ListBody(
                            children: [
                              Text('Your order was placed.'),
                            ],
                          )),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Ok"))
                          ],
                        );
                      });
                },
                child: Text('Open Dialog')),
            ElevatedButton(
              onPressed: () async {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Your order was placed!'),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('Open BottomSheet'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.blue,
                    content: Text('Your request is succesful'),
                  ),
                );
              },
              child: const Text('Open SnackBar'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Page2()));
                    },
                    child: const Text('Next Page'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
