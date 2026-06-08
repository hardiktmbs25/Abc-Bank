import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TransactionModel {
  String? id;
  String type;
  int amount;
  DateTime date_time ;
  TransactionModel({this.id,required this.type,required this.amount,required this.date_time});
  factory TransactionModel.fromJson(Map<String,dynamic> json,String docId){
    return TransactionModel(
        id:docId,
        type: json['type'],
        amount: json['amount'],
        date_time: (json['date_time'] as Timestamp).toDate()
    );
  }
  Map<String,dynamic> toJson(){
    return {
      'type':type,
      'amount':amount,
      'date_time':date_time,
    };
  }
}