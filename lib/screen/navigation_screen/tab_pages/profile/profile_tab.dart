import 'package:abc_bank/screen/navigation_screen/tab_pages/profile/card_details.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool _visibility = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profile Page",
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
      body: ListView(
        children: [
          SizedBox(height: height * 0.03),
          Center(
            child: Container(
              height: height * 0.13,
              width: width * 0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [Color(0xffccc8c8), Color(0xffede6e6)],
                ),
              ),
              child: Row(
                spacing: width * 0.02,
                crossAxisAlignment: .start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        CircleAvatar(
                          radius: width * 0.06,
                          child: Icon(
                            Icons.person_2_rounded,
                            size: width * 0.12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: width * 0.05,
                        ),
                      ),
                      Text(
                        "Total Balance",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff3a3939),
                          fontSize: width * 0.035,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.05),
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          "\$ 250,000.00",
                          style: TextStyle(
                            color: Color(0xff215927),
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: _visibility,
            child: Column(
              children: [
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_2_rounded),
                    Text(
                      "Personal Information",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.05,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),
                InkWell(
                  onTap: () {},
                  splashColor: Color(0xff9cc3b9),
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: height * 0.1,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xBB050000)),
                    ),
                    child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        Icon(Icons.call),
                        SizedBox(width: width * 0.04),
                        Text(
                          "Call To The Bank",
                          style: TextStyle(
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                InkWell(
                  onTap: () {},
                  splashColor: Color(0xff9cc3b9),
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: height * 0.1,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xBB050000)),
                    ),
                    child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        Icon(Icons.food_bank_outlined),
                        SizedBox(width: width * 0.04),
                        Column(
                          mainAxisAlignment: .center,
                          children: [
                            Text(
                              "Bank Appointment",
                              style: TextStyle(
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Consultation",
                              style: TextStyle(
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                InkWell(
                  onTap: () {
                    setState(() {
                      _visibility = false;
                    });
                  },
                  splashColor: Color(0xff9cc3b9),
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: height * 0.1,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xBB050000)),
                    ),
                    child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        Icon(Icons.credit_card),
                        SizedBox(width: width * 0.04),
                        Text(
                          "Bank Cards",
                          style: TextStyle(
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            replacement: Column(
              children: [
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Container(
                      height: width * 0.15,
                      width: width * 0.15,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        border: Border.all(color: Color(0xff050000)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(Icons.add),
                    ),
                    SizedBox(width: width * 0.02),
                    Container(
                      height: width * 0.15,
                      width: width * 0.15,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        border: Border.all(color: Color(0xff050000)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(Icons.search),
                    ),
                    SizedBox(width: width * 0.02),
                    Container(
                      height: width * 0.15,
                      width: width * 0.15,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        border: Border.all(color: Color(0xff050000)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(Icons.analytics_outlined),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(15),
                  ),
                  child: Container(
                    height: height * 0.25,
                    width: width*0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: AlignmentGeometry.bottomLeft,
                        end: AlignmentGeometry.topRight,
                        colors: [Color(0xff385c3b), Color(0xff0bc14f)],
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: width * 0.05),
                              child: Container(
                                height: height * 0.04,
                                width: width * 0.2,
                                decoration: BoxDecoration(
                                  color: Color(0xff206123),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    "CARD",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: width * 0.05,
                                      color: Color(0xcfffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: .start,
                          crossAxisAlignment: .start,
                          children: [
                            SizedBox(height: height * 0.01),
                            Text(
                              "0000 0000 0000 0000",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: width * 0.068,
                                color: Color(0xcfffffff),
                              ),
                            ),
                            Text(
                              "Card Number",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.045,
                                color: Color(0xcfffffff),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(bottom: width*0.02),
                          child: Row(
                            mainAxisAlignment: .spaceAround,
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    "Tommy Berns",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: width * 0.05,
                                      color: Color(0xcfffffff),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: .start,
                                    children: [
                                      Text(
                                        "Card Holder",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width * 0.045,
                                          color: Color(0xcfffffff),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    "05/28",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: width * 0.05,
                                      color: Color(0xcfffffff),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: .start,
                                    children: [
                                      Text(
                                        "Valid Thru",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width * 0.045,
                                          color: Color(0xcfffffff),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height*0.01,),
                ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CardDetails();
                      },));
                    },
                    title: Text('My Cards',style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.w800),),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                SizedBox(height: height*0.01,),
                ListTile(
                  onTap: (){},
                  title: Text('Transaction',style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.w800),),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                SizedBox(height: height*0.01,),
                ListTile(
                  onTap: (){
                    setState(() {
                      _visibility=true;
                    });
                  },
                  title: Text('Back',style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.w800),),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
