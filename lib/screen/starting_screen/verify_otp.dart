import 'package:abc_bank/providers/auth_provider.dart';
import 'package:abc_bank/screen/navigation_screen/homepage.dart';
import 'package:abc_bank/screen/starting_screen/set_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../providers/data_provider.dart';

class VerifyOtp extends StatefulWidget {
  String? number;
  final bool isFromForgotPassword;
  String ? name;
  String ?password;
  VerifyOtp({
    super.key,
    required this.number,
    this.name,
    this.password,
    required this.isFromForgotPassword,
  });

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  List<TextEditingController> otpController = List.generate(
    6,
    (index) => TextEditingController(),
  );
  List<FocusNode> focusNode = List.generate(6, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "OTP Verification",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: height * 0.04),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            child: Row(
              children: [
                Text(
                  "OTP send on",
                  style: TextStyle(
                    color: Color(0xff777575),
                    fontWeight: FontWeight.w700,
                    fontSize: width * 0.045,
                  ),
                ),
                Text(
                  " ${widget.number}",
                  style: TextStyle(
                    color: Color(0xc82e2a2a),
                    fontWeight: FontWeight.w900,
                    fontSize: width * 0.045,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Please Enter the OTP ",
                  style: TextStyle(
                    color: Color(0xff777575),
                    fontWeight: FontWeight.w700,
                    fontSize: width * 0.045,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: width * 0.015,
              children: List.generate(
                6,
                (index) => Expanded(
                  child: TextField(
                    focusNode: focusNode[index],
                    controller: otpController[index],
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: Color(0x9edfdfdf),
                    ),
                    onChanged: (value) {
                      if (value.length == 1 && index < 5) {
                        FocusScope.of(
                          context,
                        ).requestFocus(focusNode[index + 1]);
                      }
                      if (value.isEmpty && index > 0) {
                        FocusScope.of(
                          context,
                        ).requestFocus(focusNode[index - 1]);
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.04),
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
              String enteredOtp = otpController.map((a) => a.text).join();
              if (widget.isFromForgotPassword) {
                bool status = await auth.verifyOTP(enteredOtp);
                if (status) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SetPassword(number : widget.number!)),
                  );
                }
              } else {
                bool status = await auth.verifyOTP(enteredOtp);
                if (status) {
                  await Provider.of<DataProvider>(context,listen: false).addData(widget.name!, widget.number!, widget.password!);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage()),
                  );
                }

                if (Provider.of<AuthProvider>(context, listen: false).message != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        Provider.of<AuthProvider>(
                          context,
                          listen: false,
                        ).message!,
                      ),
                    ),
                  );
                }
                Provider.of<AuthProvider>(
                  context,
                  listen: false,
                ).clearMessage();
              }
            },
            child: Text("Verify OTP", style: TextStyle(fontSize: width * 0.05)),
          ),
        ],
      ),
    );
  }
}
