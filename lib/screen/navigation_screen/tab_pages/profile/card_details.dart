import 'package:flutter/material.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  double _credit = 750.0;
  double _internet = 1500.0;
  double _other= 0.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width =size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Card Details",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xffd0f8cb),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff049a3f), Color(0xff1be80b)],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .start,
        children: [
          SizedBox(height: height*0.015,),
          Padding(
            padding: EdgeInsets.only(left: width*0.08),
            child: Text("CREDIT",style: TextStyle(fontWeight: FontWeight.w800,fontSize: width * 0.06,color: Color(
                0xff151515)),),
          ),
          Slider(min: 0.0,max: 3000.0,divisions: 4,value: _credit, onChanged: (value){
            setState(() {
              _credit = value;
            });
          }),
          Row(
            mainAxisAlignment: .spaceAround,
            children: [
              Spacer(flex: 10,),
              Text("0",style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),),
              Spacer(flex: 26,),
              Text("750",style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),),
              Spacer(flex: 21,),
              Text("1500",style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),),
              Spacer(flex: 19,),
              Text("2250",style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),),
              Spacer(flex: 18,),
              Text("3000",style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),),
              Spacer(flex: 6,),
            ],
          ),
          SizedBox(height: height*0.04,),
          Padding(
            padding: EdgeInsets.only(left: width*0.08),
            child: Text("INTERNET",style: TextStyle(fontWeight: FontWeight.w800,fontSize: width * 0.06,color: Color(
                0xff151515)),),
          ),
          Slider(min: 0.0,max: 3000.0,divisions: 4,value: _internet, onChanged: (value){
            setState(() {
              _internet = value;
            });
          }),
          Row(
            mainAxisAlignment: .spaceAround,
            children: [
              Spacer(flex: 10,),
              Text("0",style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),),
              Spacer(flex: 26,),
              Text("750",style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),),
              Spacer(flex: 21,),
              Text("1500",style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),),
              Spacer(flex: 19,),
              Text("2250",style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),),
              Spacer(flex: 18,),
              Text("3000",style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),),
              Spacer(flex: 6,),
            ],
          ),
          SizedBox(height: height*0.04,),
          Padding(
            padding: EdgeInsets.only(left: width*0.08),
            child: Text("OTHER",style: TextStyle(fontWeight: FontWeight.w800,fontSize: width * 0.06,color: Color(
                0xff151515)),),
          ),
          Slider(min: 0.0,max: 3000.0,divisions: 4,value: _other, onChanged: (value){
            setState(() {
              _other = value;
            });
          }),
          Row(
            mainAxisAlignment: .spaceAround,
            children: [
              Spacer(flex: 10,),
              Text("0",style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),),
              Spacer(flex: 26,),
              Text("750",style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),),
              Spacer(flex: 21,),
              Text("1500",style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),),
              Spacer(flex: 19,),
              Text("2250",style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),),
              Spacer(flex: 18,),
              Text("3000",style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),),
              Spacer(flex: 6,),
            ],
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: height*0.1),
            child: Row(
              mainAxisAlignment: .spaceAround,
              children: [
                Container(
                  width: width * 0.25,
                  height: height*0.15,
                  decoration: BoxDecoration(
                    color: Color(0x4d0dc3fa),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      Text("\$250",style: TextStyle(fontWeight: FontWeight.w700,fontSize: width*0.05,color: Color(
                          0xff06ac3c)),),
                      Text("Economy",style: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.035,color: Color(
                          0xff050000)),),
                      Text("Plan",style: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.035,color: Color(
                          0xff050000)),)
                    ],
                  ),
                ),
                Container(
                  width: width * 0.25,
                  height: height*0.15,
                  decoration: BoxDecoration(
                      color: Color(0x4d0dc3fa),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      Text("\$450",style: TextStyle(fontWeight: FontWeight.w700,fontSize: width*0.05,color: Color(
                          0xff06ac3c)),),
                      Text("Normal",style: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.035,color: Color(
                          0xff050000)),),
                      Text("Plan",style: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.035,color: Color(
                          0xff050000)),)
                    ],
                  ),
                ),
                Container(
                  width: width * 0.25,
                  height: height*0.15,
                  decoration: BoxDecoration(
                      color: Color(0x4d0dc3fa),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      Text("\$750",style: TextStyle(fontWeight: FontWeight.w700,fontSize: width*0.05,color: Color(
                          0xff06ac3c)),),
                      Text("Expensive",style: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.035,color: Color(
                          0xff050000)),),
                      Text("Plan",style: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.035,color: Color(
                          0xff050000)),)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
