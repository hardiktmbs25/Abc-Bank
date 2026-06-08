import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OtherTab extends StatefulWidget {
  const OtherTab({super.key});

  @override
  State<OtherTab> createState() => _OtherTabState();
}

class _OtherTabState extends State<OtherTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Other Page",
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
          SizedBox(height: height * 0.02),
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
          SizedBox(height: height * 0.02),
          ListTile(
            onTap: () {},
            subtitle: Text(
              "\$25",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: width * 0.07,
                color: Color(0xff188300),
              ),
            ),
            trailing: Icon(
              Icons.add_box_outlined,
              size: width * 0.15,
              color: Color(0xff9a9393),
            ),
            title: Text(
              "Total Income",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: width * 0.05,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          ListTile(
            onTap: () {},
            subtitle: Text(
              "\$25",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: width * 0.07,
                color: Color(0xff188300),
              ),
            ),
            trailing: Icon(
              Icons.add_box_outlined,
              size: width * 0.15,
              color: Color(0xff9a9393),
            ),
            title: Text(
              "Total Income",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: width * 0.05,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          SizedBox(
            height: height*0.3,
            width: width*0.9,
            child: LineChart(LineChartData(
              lineBarsData:[LineChartBarData(spots: [FlSpot(0, 0),FlSpot(2, 2),FlSpot(8, 0),FlSpot(10, 5)],isCurved: true,)]
            )),
          )
        ],
      ),
    );
  }
}
