import 'package:abc_bank/providers/curd_transaction.dart';
import 'package:abc_bank/providers/transaction_model.dart';
import 'package:abc_bank/screen/curd/add_transaction.dart';
import 'package:abc_bank/screen/curd/update_transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnalysisTab extends StatefulWidget {
  const AnalysisTab({super.key});

  @override
  State<AnalysisTab> createState() => _AnalysisTabState();
}

class _AnalysisTabState extends State<AnalysisTab> {
  int selectedindex = 1;
  List<String> data = ["1D", "1W", "1M", "3M", "6M", "All"];
  @override
  late List<TransactionModel> T_data = [];

  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await Provider.of<CurdTransaction>(
      context,
      listen: false,
    ).get_all();
    setState(() {
      T_data = data;
      T_data.sort((a, b) => b.date_time.compareTo(a.date_time));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: width * 0.01, bottom: height * 0.02),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTransaction()),
            ).then((s) {
              setState(() {
                loadData();
              });
            });
          },
          child: Icon(Icons.add, color: Color(0xffffffff)),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Analysis Page",
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
            Center(
              child: Text(
                "BALANCE",
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              height: height * 0.3,
              width: width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xff020202)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/bar_chart.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(data.length, (index) {
                bool isSelected = selectedindex == index;
                return InkWell(
                  borderRadius: BorderRadius.circular(0),
                  onTap: () {
                    setState(() {
                      selectedindex = index;
                    });
                  },
                  child: Container(
                    width: width * 0.1,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0xffa2e698) : Color(0xffe3dcdc),
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(color: Color(0xff090808)),
                    ),
                    child: Center(
                      child: Text(
                        data[index],
                        style: TextStyle(
                          color: Color(0xff050000),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff14b808),
                    foregroundColor: Color(0xffffffff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(0),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [Icon(Icons.arrow_upward_rounded), Text("Buy")],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffffffff),
                    foregroundColor: Color(0xff14b808),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xff14b808)),
                      borderRadius: BorderRadiusGeometry.circular(0),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.arrow_downward_outlined),
                      Text("Sell"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Text(
              "Recent transaction",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: width * 0.05,
              ),
            ),
            Column(
              children: T_data.isEmpty
                  ? [Center(child: Text("No Transaction Hear${T_data.length}"))]
                  : List.generate(T_data.length, (index) {
                      return ListTile(
                        onTap: () {
                          TransactionModel data = TransactionModel(
                            id: T_data[index].id,
                            amount: T_data[index].amount,
                            type: T_data[index].type,
                            date_time: T_data[index].date_time,
                          );
                          print(T_data[index].id);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateTransaction(data: data),)).then((e){
                            setState((){
                              loadData();
                            });
                          });
                        },
                        leading: Container(
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Icon(
                            size: width * 0.08,
                            T_data[index].type == "Receive"
                                ? Icons.arrow_downward_rounded
                                : Icons.arrow_upward_rounded,
                            color: T_data[index].type == "Receive"
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        title: Text(
                          T_data[index].type,
                          style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text("${T_data[index].date_time}"),
                        trailing: Text(
                          "\$${T_data[index].amount}",
                          style: TextStyle(
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.w700,
                            color: T_data[index].type == "Receive"
                                ? Color(0xff0b983a)
                                : Color(0xfff60606),
                          ),
                        ),
                      );
                    }),
            ),
          ],
        ),
      ),
    );
  }
}
