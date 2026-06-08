import 'package:flutter/material.dart';
import 'package:abc_bank/screen/starting_screen/login.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
            colors: [Color(0xff98edd1), Color(0xff228c64)],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: height * 0.13),
            Center(
              child: Container(
                height: height * 0.22,
                width: width * 0.5,
                decoration: BoxDecoration(
                  color: Color(0xff1a4335),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 12,
                      spreadRadius: 2,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "B",
                    style: TextStyle(
                      fontSize: width * 0.30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.12),
            Center(
              child: Text(
                "Welcome to ABC Bank",
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: width * 0.08,
                  fontWeight: FontWeight.w700,
                ),
                softWrap: true,
              ),
            ),
            Center(
              child: Text(
                "Bank is your Future",
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: width * 0.08,
                  fontWeight: FontWeight.w700,
                ),
                softWrap: true,
              ),
            ),
            SizedBox(height: height * 0.08),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Color(0xff075c36),
                foregroundColor: Color(0xffffffff),
                minimumSize: Size(width * 0.7, height * 0.07),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
              },
              child: Text(
                "GET  STARTED",
                style: TextStyle(fontSize: width * 0.05,fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(height: height*0.02,),
            Text(
              "Old User Login in Hear",
              style: TextStyle(
                color: Color(0xb8ffffff),
                fontSize: width * 0.05,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: height*0.04,),
            Text("Sign in hear",style: TextStyle(fontWeight: FontWeight.w800,fontSize: width*0.08,color: Color(
                0xfc705525)),)
          ],
        ),
      ),
    );
  }
}
