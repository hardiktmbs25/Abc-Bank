import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  int _value = 0;

  void restart() {
    setState(() {
      _value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(right: width * 0.04),
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xff038029)),
              currentAccountPictureSize: Size.square(width * 0.13),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color(0xffffffff),
                child: Text("A"),
              ),
              accountName: Text("Name"),
              accountEmail: Text("abc123@gmail.com"),
            ),
            ListTile(
              leading: Icon(Icons.drive_file_rename_outline),
              title: Text("Name"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.phone_android_rounded),
              title: Text("Phone"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text("Back"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Setting Page",
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            TweenAnimationBuilder<double>(
              key: ValueKey(_value),
              tween: Tween(begin: 10.0, end: 0.0),
              duration: Duration(seconds: 10),
              builder: (_, value, __) {
                return Center(
                  child: SleekCircularSlider(
                    min: 0,
                    max: 10,
                    initialValue: value,
                    appearance: CircularSliderAppearance(
                      startAngle: 270,
                      angleRange: 360,
                      size: width * 0.4,
                      customColors: CustomSliderColors(
                        trackColor: Color(0xffe1f4e7),
                        progressBarColors: [Color(0xff65d65c),Color(0x9e00ff00),Color(0xff036102)]
                      ),
                      customWidths: CustomSliderWidths(
                        shadowWidth: width * 0.02,
                        trackWidth: width * 0.04,
                      ),
                      infoProperties: InfoProperties(
                        mainLabelStyle: TextStyle(
                          fontSize: width * 0.12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff026529)
                        ),
                        modifier: (v) {
                          return "${v.toInt()}";
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height:height * 0.04,),
            Padding(
              padding: EdgeInsets.all(width*0.02),
              child: Text("What ia currency in the USA ?",style: TextStyle(fontSize: width*0.08,fontWeight: FontWeight.w600),textAlign: TextAlign.center),
            ),
            SizedBox(height: height * 0.03),
            InkWell(
              onTap: () {
                restart();
              },
              splashColor: Color(0xff9cc3b9),
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: height * 0.06,
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xBB050000)),
                ),
                child:
                    Center(
                      child: Text(
                        "Euro",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
              ),
            ),
            SizedBox(height: height * 0.03),
            InkWell(
              onTap: () {
                restart();
              },
              splashColor: Color(0xff9cc3b9),
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: height * 0.06,
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xBB050000)),
                ),
                child:
                Center(
                  child: Text(
                    "Dollar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            InkWell(
              onTap: () {
                restart();
              },
              splashColor: Color(0xff9cc3b9),
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: height * 0.06,
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xBB050000)),
                ),
                child:
                Center(
                  child: Text(
                    "Rupee",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            InkWell(
              onTap: () {
                restart();
              },
              splashColor: Color(0xff9cc3b9),
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: height * 0.06,
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xBB050000)),
                ),
                child:
                Center(
                  child: Text(
                    "Pound",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
