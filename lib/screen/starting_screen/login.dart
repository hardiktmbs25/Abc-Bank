import 'package:abc_bank/notification_service/notification_service.dart';
import 'package:abc_bank/providers/data_provider.dart';
import 'package:abc_bank/screen/starting_screen/create_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../navigation_screen/homepage.dart';
import 'forget_password.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
bool isloading = false;
bool _ischecked = false;
bool _ispass = false;
TextEditingController numberController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginState extends State<Login> {
  final _validate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _validate,
          child: Column(
            children: [
              SizedBox(height: height * 0.15),
              Text(
                "Sign in",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.2,
                  color: Color(0xff075c36),
                ),
              ),
              SizedBox(height: height * 0.01),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: numberController,
                  maxLength: 10,
                  onTap: (){
                    setState(() {});},
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if(value!.isEmpty || value == null){
                      return "Number is Required";
                    }
                    if(!RegExp(r'^[0-9]{10}$').hasMatch(value)){
                      return "Phone Number Must Be a 10 Digit";
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_2_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText:_ispass,
                  keyboardType: TextInputType.visiblePassword,
                  onTap: (){
                    setState(() {});},
                  validator: (value){
                    if(value!.isEmpty||value == null){
                      return "Password is Required";
                    }
                    if(!RegExp(r'(?=.*[A-Z])').hasMatch(value)){
                      return "Password Contain At least one Capital Letter";
                    }
                    if(!RegExp(r'(?=.*[a-z])').hasMatch(value)){
                      return "Password Contain At least one Small Letter";
                    }
                    if(!RegExp(r'(?=.*\d)').hasMatch(value)){
                      return "Password Contain At least one Number";
                    }
                    if(!RegExp(r'(?=.*[!@#$%&*?])').hasMatch(value)){
                      return "Password Contain At least one Spacial Character";
                    }
                    if(value.length < 8){
                      return "Password At list Contain a 8 Character";
                    }
                  },
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
                children: [
                  Checkbox(
                    value: _ischecked,
                    onChanged: (value) {
                      setState(() {
                        _ischecked = value!;
                      });
                    },
                  ),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        _ischecked=!_ischecked;
                      });
                    },
                    child: Text(
                      "Remember",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: width * 0.045,
                      ),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ForgetPassword();
                      },));
                    },
                    child: Text(
                      "forget password",
                      style: TextStyle(
                        color: Color(0xff777575),
                        fontWeight: FontWeight.w700,
                        fontSize: width * 0.045,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.04),
              isloading?CircularProgressIndicator():ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color(0xff075c36),
                  foregroundColor: Color(0xffffffff),
                  minimumSize: Size(width * 0.7, height * 0.07),
                ),
                onPressed: () async{
                  NotificationService.showNotification(title: "Login SuccessFully",action: "Done",message: "Done isCoreLibraryDesugaringEnabled = true",payload: "login");
                  String number = "+91${numberController.text.trim()}";
                  String password = passwordController.text.trim();
                  if(_validate.currentState!.validate()) {
                    isloading = true;
                    bool login = await Provider.of<DataProvider>(context,listen: false).login(number, password);
                    isloading =false;
                    if(login){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return Homepage();
                      },));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(12),
                          content: Text("Login Successfully"),
                        ),
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Mobile No Or Password are incorrect")));
                    }
                  }
                },
                child: Text("Sign In", style: TextStyle(fontSize: width * 0.05)),
              ),
              SizedBox(height: height*0.02,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xff075c36)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color(0xffffffff),
                  foregroundColor: Color(0xff075c36),
                  minimumSize: Size(width * 0.7, height * 0.07),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount(),));
                },
                child: Text("Create Account", style: TextStyle(fontSize: width * 0.05)),
              ),
              SizedBox(height: height*0.015,),
              Text(
                "Don't Have Account ? ",
                style: TextStyle(
                  color: Color(0xff777575),
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.045,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
