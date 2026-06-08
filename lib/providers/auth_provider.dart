import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verification_id = "";
  String ? _message ;
  String? get message => _message;

  void _setMessage(String? message){
     _message = message;
     notifyListeners();
  }

  Future<void> verifyPhone(String phone) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 120),
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          _setMessage("Phone number verify Automatically");
          await _auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (FirebaseAuthException e) {
          _setMessage(e.message ?? "verification Failed");
          },
        codeSent: (String varificationId, int? resendTokan) {
          _setMessage("OTP Send Successfully");
          _verification_id = varificationId;
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          _setMessage("Code is Time Out");
          _verification_id = verificationID;
        },
      );
    }

      Future<bool> verifyOTP(String otp) async {
        try{
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verification_id,
          smsCode: otp,
        );
        await _auth.signInWithCredential(credential);
        _setMessage("Otp Verified SuccessFully");
        _setMessage("welcome to ABC Bank");
          return true;
        }
        on FirebaseAuthException catch (e){
          _setMessage("Otp did not Match");
          return false;
        }catch (e){
          _setMessage("Something went wrong");
          return false;
        }

      }

      Future<void> logout() async {
        await _auth.signOut();
        notifyListeners();
      }
      void clearMessage(){
      _message = null;
      }

  }

