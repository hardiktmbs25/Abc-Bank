import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CurrencyTab extends StatefulWidget {
  const CurrencyTab({super.key});

  @override
  State<CurrencyTab> createState() => _CurrencyTabState();
}

class _CurrencyTabState extends State<CurrencyTab> {
  double depositValue = 500.00;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Currency Page",
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
        children: [
          Center(
            child: Text(
              "DEPOSIT",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: width * 0.06,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          SleekCircularSlider(
            initialValue: depositValue,
            min: 0.0,
            max: 3000.0,
            onChange: (value) {
              setState(() {
                depositValue = value;
              });
            },
            appearance: CircularSliderAppearance(
              size: width * 0.7,
              angleRange: 340,
              startAngle: 280,
              customWidths: CustomSliderWidths(
                progressBarWidth: width * 0.05,
                handlerSize: width * 0.02,
              ),
              infoProperties: InfoProperties(
                modifier: (double value) {
                  return "\$ ${value.toInt()}";
                },
                mainLabelStyle: TextStyle(
                  color: Color(0xff500505),
                  fontWeight: FontWeight.w800,
                  fontSize: width * 0.1,
                ),
                bottomLabelText: "24 Month",
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Slider(
            activeColor: Color(0xffaa3497),
            inactiveColor: Color(0x4cf4819c),
            divisions: 15,
            min: 0.0,
            max: 3000.0,
            value: depositValue,
            onChanged: (value) {
              setState(() {
                depositValue = value;
              });
            },
          ),
          SizedBox(height: height * 0.03),
          Row(
            mainAxisAlignment: .spaceAround,
            children: [
              Spacer(flex: 10),
              Text(
                "Bronze",
                style: TextStyle(
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(flex: 26),
              Text(
                "Silver",
                style: TextStyle(
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(flex: 21),
              Text(
                "Gold",
                style: TextStyle(
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(flex: 19),
              Text(
                "Platinum",
                style: TextStyle(
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(flex: 18),
              Text(
                "Diamond",
                style: TextStyle(
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(flex: 6),
            ],
          ),
          SizedBox(height: height * 0.06),
          Text(
            "Devolution Protection",
            style: TextStyle(
              color: Color(0xff0032ff),
              fontSize: width * 0.06,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: .spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Yes",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: width * 0.06,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0e9514),
                  foregroundColor: Color(0xffffffff),
                  elevation: 5,
                  minimumSize: Size(width * 0.4, height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    side: BorderSide(
                      color: Color(0xffffffff),
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "No",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: width * 0.06,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffffffff),
                  foregroundColor: Color(0xff0e9514),
                  elevation: 5,
                  minimumSize: Size(width * 0.4, height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    side: BorderSide(
                      color: Color(0xff0e9514),
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
