import 'package:abc_bank/providers/curd_transaction.dart';
import 'package:abc_bank/providers/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../notification_service/notification_service.dart';

class UpdateTransaction extends StatefulWidget {
  UpdateTransaction({super.key,required this.data});
  TransactionModel? data;

  @override
  State<UpdateTransaction> createState() => _UpdateTransactionState();
}

String? selectedValue ;
DateTime? selectedDate ;
TimeOfDay? selectedTime ;
TextEditingController amount = TextEditingController();

class _UpdateTransactionState extends State<UpdateTransaction> {
  Future<void> saveDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> saveTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = widget.data!.type;
    selectedDate = DateTime(widget.data!.date_time.year,widget.data!.date_time.month,widget.data!.date_time.day,);
    selectedTime= TimeOfDay(hour: widget.data!.date_time.hour, minute: widget.data!.date_time.minute,);
    amount = TextEditingController(text: widget.data!.amount.toString());
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Update Transaction",
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
        child: Form(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              SizedBox(height: height * 0.02),
              Text(
                "Select a Transaction type",
                style: TextStyle(
                  color: Color(0xff777575),
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.045,
                ),
              ),
              SizedBox(height: height * 0.02),
              SizedBox(
                width: width * 0.7,
                child: DropdownButtonFormField<String>(
                  value: widget.data!.type,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(15),
                  items: [
                    DropdownMenuItem(value: "Send", child: Text("Send")),
                    DropdownMenuItem(
                      value: "Receive",
                      child: Text("Receive"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value; //
                    });
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                "Enter a Amount",
                style: TextStyle(
                  color: Color(0xff777575),
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.045,
                ),
              ),
              SizedBox(height: height * 0.02),
              SizedBox(
                width: width * 0.7,
                child: TextFormField(
                  controller: amount,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.06,
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.attach_money),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                "Select a Date Of Transaction",
                style: TextStyle(
                  color: Color(0xff777575),
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.045,
                ),
              ),
              SizedBox(height: height * 0.02),
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
                  saveDate();
                },
                child: Text(
                  selectedDate == null
                      ? "Select The Date"
                      : "${selectedDate!.day}/${selectedDate!
                      .month}/${selectedDate!.year}",
                  style: TextStyle(fontSize: width * 0.06),
                ),
              ),

              SizedBox(height: height * 0.02),
              Text(
                "Select a Time Of Transaction",
                style: TextStyle(
                  color: Color(0xff777575),
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.045,
                ),
              ),
              SizedBox(height: height * 0.02),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color:Color(0xff075c36) ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color(0xffffffff),
                  foregroundColor: Color(0xff075c36),
                  minimumSize: Size(width * 0.7, height * 0.07),
                ),
                onPressed: () {
                  saveTime();
                },
                child: Text(
                  selectedTime == null
                      ? "Select The Time"
                      : selectedTime!.format(context),
                  style: TextStyle(fontSize: width * 0.06),
                ),
              ),

              SizedBox(height: height * 0.06),
              Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xff075c36)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Color(0xff075c36),
                      foregroundColor: Color(0xffffffff),
                      minimumSize: Size(width * 0.3, height * 0.06),
                    ),
                    onPressed: () async {
                      DateTime fixTime = DateTime(selectedDate!.year,selectedDate!.month,selectedDate!.day,selectedTime!.hour,selectedTime!.minute);
                      TransactionModel data = TransactionModel(
                        id:widget.data!.id,
                        type: selectedValue!,
                        amount: int.parse(amount.text.trim()),
                        date_time: fixTime,);
                      bool issaved = await Provider.of<CurdTransaction>(context, listen: false).updateData(data);
                      if(issaved){
                        Navigator.pop(context);
                        String body = """Data Updated Successfully \nType : ${selectedValue} \nDate : ${selectedDate} \nTime : ${selectedTime}""";
                        NotificationService.showCurdNotification(title: "Data Updated", body: body);
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data Can't be Added")));
                      }
                    },
                    child: Text(
                      "Update",
                      style: TextStyle(fontSize: width * 0.05),
                    ),
                  ),
                  ElevatedButton( style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xfff60606)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color(0xfff60606),
                    foregroundColor: Color(0xffffffff),
                    minimumSize: Size(width * 0.3, height * 0.06),
                  ),onPressed: (){
                   _showDialog();
                  }, child: Text("Delete", style: TextStyle(fontSize: width * 0.05)))
                ],
              ),
              SizedBox(height: height * 0.3),
            ],
          ),
        ),
      ),
    );
  }
  void _showDialog(){
    showDialog(context: context, builder: (context) {
      return AlertDialog(title: Text("Are You Sure To Delete This Data ?"),actions: [
        ElevatedButton(onPressed: ()async{
          bool isdelete = await Provider.of<CurdTransaction>(context,listen: false).deleteData(widget.data!.id);
          if(isdelete){
            Navigator.pop(context);
            Navigator.pop(context);
          }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something gone wrong")));
          }
        }, child: Text("Yes"),style: ElevatedButton.styleFrom(backgroundColor: Colors.red,foregroundColor: Colors.white),),
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("No"),style: ElevatedButton.styleFrom(backgroundColor: Colors.green,foregroundColor: Colors.white),)
      ],);
    },);
  }
}
