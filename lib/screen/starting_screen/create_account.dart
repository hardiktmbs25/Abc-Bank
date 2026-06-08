import 'package:abc_bank/providers/data_provider.dart';
import 'package:abc_bank/screen/starting_screen/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:abc_bank/providers/auth_provider.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _ispass = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  final _createFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Create Account",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _createFormKey,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: height * 0.04),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "Please Enter A Name",
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
                  controller: nameController,
                  onTap: () {
                    setState(() {});
                  },
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Name is Required";
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_2_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "Please Enter a Phone Number",
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
                  controller: numberController,
                  maxLength: 10,
                  onTap: () {
                    setState(() {});
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Number is Required";
                    }
                    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return "Phone Number Must Be a 10 Digit";
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_android),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "Please Enter a Password",
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
                    if (passwordController2.text.trim() != value) {
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
                      icon: Icon(
                        _ispass ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "Please Re-Enter a Password",
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
                    if (passwordController1.text.trim() != value) {
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
                      icon: Icon(
                        _ispass ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: .center,
                children: [ ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Color(0xff075c36),
                      foregroundColor: Color(0xffffffff),
                      minimumSize: Size(width * 0.7, height * 0.07),
                    ),
                    onPressed: () async {
                      if (_createFormKey.currentState!.validate()){
                        bool data =  await Provider.of<DataProvider>(context,listen: false).checkPhoneNo("+91${numberController.text.trim()}");
                        if(data==true){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Phone Number is Already exists")));
                          return;
                        }else{
                        await Provider.of<AuthProvider>(context, listen: false,).verifyPhone("+91${numberController.text.trim()}").then((_){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => VerifyOtp(
                              isFromForgotPassword: false,
                              number: "+91${numberController.text.trim()}",
                              name: nameController.text.trim(),
                              password: passwordController1.text.trim(),
                            ),
                          ),
                          );
                        });

                        if (Provider.of<AuthProvider>(context,listen: false,).message != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(Provider.of<AuthProvider>(context,listen: false,).message!,),
                            ),
                          );
                        }
                           Provider.of<AuthProvider>(context,listen: false).clearMessage();
                      }
                      }
                    },
                    child: Text(
                      "Get OTP",
                      style: TextStyle(fontSize: width * 0.05),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
