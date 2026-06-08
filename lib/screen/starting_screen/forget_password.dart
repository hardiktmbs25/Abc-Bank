import 'package:abc_bank/providers/auth_provider.dart';
import 'package:abc_bank/providers/data_provider.dart';
import 'package:abc_bank/screen/starting_screen/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _validate = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading:false,title: Text("Forget Password",style: TextStyle(fontWeight: FontWeight.w700),),),
      body: Column(
        crossAxisAlignment: .center,
        children: [
          SizedBox(height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0,top: 8.0,right: 20,left: 20),
                child: Text("Enter your Phone No",style: TextStyle(fontWeight: FontWeight.w700,fontSize: width*0.04),),
              ),
            ],
          ),
          Form(
            key:_validate,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0,top: 8.0,right: 20,left: 20),
              child: TextFormField(
                controller: numberController,
                onTap: () {
                  setState(() {});
                },
                keyboardType: TextInputType.number,
                maxLength: 10,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly,],
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
          ),
          SizedBox(height: height*0.02,),
           ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xff075c36)),
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Color(0xff075c36),
              foregroundColor: Color(0xffffffff),
              minimumSize: Size(width * 0.7, height * 0.07),
            ),
            onPressed: () async {
              if(_validate.currentState!.validate()){
                String phone  = "+91${numberController.text.trim()}";
                if(await Provider.of<DataProvider>(context,listen: false).checkPhoneNo(phone)){
                await auth.verifyPhone(phone);
                Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyOtp(isFromForgotPassword:true,number: phone)),);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Phone No Not Register")));
                }
              }
            },
            child: Text("Get OTP", style: TextStyle(fontSize: width * 0.05)),
          ),
        ],
      ),
    );
  }
}
