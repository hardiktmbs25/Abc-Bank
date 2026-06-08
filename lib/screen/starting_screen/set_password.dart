import 'package:abc_bank/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login.dart';

class SetPassword extends StatefulWidget {
  String number ;
  SetPassword({required this.number,super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  bool _ispass = true;
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Set Password",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: .start,
        children: [
          SizedBox(height: height * 0.04),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              "Please Enter A Password",
              style: TextStyle(
                color: Color(0xff777575),
                fontWeight: FontWeight.w700,
                fontSize: width * 0.045,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordController1,
              keyboardType: TextInputType.visiblePassword,
              onTap: () {
                setState(() {});
              },
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return "Password is Required";
                }
                if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                  return "Password Contain At least one Capital Letter";
                }
                if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                  return "Password Contain At least one Small Letter";
                }
                if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
                  return "Password Contain At least one Number";
                }
                if (!RegExp(r'(?=.*[!@#$%&*?])').hasMatch(value)) {
                  return "Password Contain At least one Spacial Character";
                }
                if (value.length < 8) {
                  return "Password At list Contain a 8 Character";
                }
                if(passwordController2.text.trim() != value){
                  return "Password didn't Matches";
                }
              },
              obscureText: _ispass,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _ispass = !_ispass;
                    });
                  },
                  icon: Icon(_ispass ? Icons.visibility_off : Icons.visibility),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              "Please Re-Enter A Password",
              style: TextStyle(
                color: Color(0xff777575),
                fontWeight: FontWeight.w700,
                fontSize: width * 0.045,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordController2,
              keyboardType: TextInputType.visiblePassword,
              onTap: () {
                setState(() {});
              },
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return "Password is Required";
                }
                if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                  return "Password Contain At least one Capital Letter";
                }
                if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                  return "Password Contain At least one Small Letter";
                }
                if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
                  return "Password Contain At least one Number";
                }
                if (!RegExp(r'(?=.*[!@#$%&*?])').hasMatch(value)) {
                  return "Password Contain At least one Spacial Character";
                }
                if (value.length < 8) {
                  return "Password At list Contain a 8 Character";
                }
                if(passwordController1.text.trim() != value){
                  return "Password didn't Matches";
                }
              },
              obscureText: _ispass,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _ispass = !_ispass;
                    });
                  },
                  icon: Icon(_ispass ? Icons.visibility_off : Icons.visibility),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: .center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color(0xff075c36),
                  foregroundColor: Color(0xffffffff),
                  minimumSize: Size(width * 0.7, height * 0.07),
                ),
                onPressed: () async {
                  if (passwordController1.text == passwordController2.text) {
                    bool setPass = await Provider.of<DataProvider>(context,listen:false).setPassword(widget.number, passwordController1.text.trim());
                    if(setPass){Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(12),
                        content: Text("Password Changed Successfully"),
                      ),
                    );}else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(12),
                          content: Text("Password did't Changed"),
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  "Set a Password",
                  style: TextStyle(fontSize: width * 0.05),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
