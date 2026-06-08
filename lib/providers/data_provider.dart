import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DataProvider extends ChangeNotifier {

  Future<void> addData(String name ,String phoneNo,String password) async{
    await  FirebaseFirestore.instance.collection("users").add({"name":name,"number":phoneNo,"password":password});
  }
  Future<bool> checkPhoneNo(String phoneNo) async {
    final result = await FirebaseFirestore.instance.collection("users").where("number",isEqualTo: phoneNo).limit(1).get();
    if(result.docs.isNotEmpty){
     return true;
    }else {
      return false;
    }
    }
    Future<bool> login(String number, String password) async{
      final result = await FirebaseFirestore.instance.collection("users").where("number",isEqualTo: number).limit(1).get();
      if(result.docs.isEmpty){
        return false;
      }else{
        String data = result.docs.first.data()['password'];
        if(data == password){
          return true;
        }else return false;
      }
    }

    Future<bool> setPassword(String number,String password) async{
    try{
      final result = await FirebaseFirestore.instance.collection("users").where("number",isEqualTo: number).limit(1).get();
                     await FirebaseFirestore.instance.collection("users").doc(result.docs.first.id).update({"password": password});
      return true;
    }catch(e){
      return false;
    }
    }
}