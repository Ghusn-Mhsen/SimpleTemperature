import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: Temp(),
    );
  }
}

class Temp extends StatefulWidget {
  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  double inTemp = 0.0,
      outTemp = 0.0;
  bool isFah = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("project 1"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: isFah
                      ? "you entered $inTemp in Fahrenheit"
                      : "you entered $inTemp in Celsius",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepOrange),
                  hintText: "Enter Your Temperature ",
                  hintStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                onChanged: (value) {
                  try {
                    setState(() {
                      inTemp = double.parse(value);
                    });
                  } catch (e) {
                    /*   Show dialog   */
                    showDialog<void>(
                      context: context,
                      // false = user must tap button, true = tap outside dialog
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          content: Text(
                            e.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                          actions: <Widget>[
                            // ignore: deprecated_member_use
                            FlatButton(
                              child: Text(
                                'Back',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.of(dialogContext)
                                    .pop(); // Dismiss alert dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 110),
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 1, color: Colors.black87),
              ),
              child: RadioListTile(
                  title: Text(
                    "Fahrenheit",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  value: true,
                  groupValue: isFah,
                  onChanged: (value) {
                    setState(() {
                      isFah = value;
                    });
                  }),
            ),
            Container(
              padding: EdgeInsets.only(left: 110),
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 1, color: Colors.black87),
              ),
              child: RadioListTile(
                  activeColor: Colors.blue,
                  title: Text("Celsius",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                  value: false,
                  groupValue: isFah,
                  onChanged: (value) {
                    setState(() {
                      isFah = value;
                    });
                  }),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              width: 150,
              height: 70,
              decoration: BoxDecoration(

                color: Colors.deepOrange,
                border: Border.all(color: Colors.blueGrey, width:1,),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),

                ),
              ),
              // ignore: deprecated_member_use
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                ),
                color: Colors.deepOrange,
                child: Text("Convert",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
                onPressed: () {
                  setState(() {
                    outTemp = isFah
                        ? (inTemp - 32) / (5 / 6)
                        : (inTemp * (9 / 5) + 32);
                    showDialog<void>(
                      context: context,
                      // false = user must tap button, true = tap outside dialog
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: Text('The result is : ',
                              style:
                              TextStyle(color: Colors.cyan, fontSize: 35)),
                          content: isFah
                              ? Text('$outTemp Feh',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 30))
                              : Text('$outTemp Cel',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 30)),
                          actions: <Widget>[
                            FlatButton(
                              child: Text(
                                'Back',
                                style:
                                TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.of(dialogContext)
                                    .pop(); // Dismiss alert dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                  });
                },
                splashColor: Colors.black26,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
