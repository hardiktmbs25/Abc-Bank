import 'package:abc_bank/providers/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CurdTransaction extends ChangeNotifier {
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  //add
  Future<bool> add_Data(TransactionModel data) async{
    try{
      await firebase.collection("transaction").add(data.toJson());
      return true;
    }catch(e){
      return false;
    }
  }

  //get all data
  Future<List<TransactionModel>> get_all()async{
      final data = await firebase.collection("transaction").get();
      return data.docs.map((e) => TransactionModel.fromJson(e.data(),e.id)).toList();
  }
  Future<bool> updateData(TransactionModel data) async{
    try{
      await firebase.collection("transaction").doc(data.id).update(data.toJson());
      return true;
    }catch(e){
      return false;
    }
  }
  Future<bool> deleteData(id) async{
    try{
      await firebase.collection("transaction").doc(id).delete();
      return true;
    }catch(e){
      return false;
    }
  }
}