import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  var wController = TextEditingController();
  var fController = TextEditingController();
  var iController = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Mass Index'),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.99,
          color: Colors.blue.withOpacity(0.1),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI Calculator',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: wController,
                  decoration: InputDecoration(
                    label: Text("Enter Weight in KG's"),
                    prefixIcon: Icon(Icons.line_weight_rounded),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15),
                TextField(
                  controller: fController,
                  decoration: InputDecoration(
                    label: Text('Enter Height in Feet'),
                    prefixIcon: Icon(Icons.height),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15),
                TextField(
                  controller: iController,
                  decoration: InputDecoration(
                    label: Text('Enter Remaining Inches of Height'),
                    prefixIcon: Icon(Icons.height),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.blue[200],
                  ),
                  onPressed: () {
                    var hFeet = fController.text.toString();
                    var hInch = iController.text.toString();
                    var tWeight = wController.text.toString();

                    if (tWeight != "" && hInch != "" && hFeet != "") {
                      var intWeight = int.parse(tWeight);
                      var intFeet = int.parse(hFeet);
                      var intInch = int.parse(hInch);
                      var thInch = (intFeet * 12) + intInch;
                      var hMeter = thInch * 0.0254;
                      var bmi = intWeight / (hMeter * hMeter);

                      setState(() {
                        String category = '';
                        if (bmi < 18.5) {
                          category = 'Eat some food dear you are Underweight';
                        } else if (bmi >= 18.5 && bmi <= 25.9) {
                          category = 'Congrats Healthy Weight';
                        } else if (bmi > 25.9 && bmi < 29.9) {
                          category = 'You are Overweight and you need Exercise';
                        } else if (bmi > 29.9) {
                          category = 'You are in Obesity hit the GYM ASAP';
                        } else {
                          category = 'Ohh shit Severe OBESITY';
                        }
                        result =
                            "Your BMI is ${bmi.toStringAsFixed(2)}\n$category";
                      });
                    } else {
                      setState(() {
                        result = "Enter all the required fields";
                      });
                    }
                  },
                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  result,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
