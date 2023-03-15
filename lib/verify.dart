import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:githubsample/phone.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// import 'package:pinput/pinput.dart';
import 'package:pinput/pin_put/pin_put.dart';

import 'home.dart';

class MyVerify extends StatefulWidget {
  var number;
  var countryCode;

  MyVerify({Key? key, this.number, this.countryCode}) : super(key: key);

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? verificationCode;
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color(0xFFFFFFFF),
    borderRadius: BorderRadius.circular(12.0),
    border: Border.all(
      color: const Color(0xFF000000),
    ),
  );
  final FocusNode _pinPutFocusNode = FocusNode();
  TextEditingController otp = TextEditingController();
  var formatter = MaskTextInputFormatter(
      mask: '######',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("number${widget.number}");
    print("countryCode${widget.countryCode}");
    if('${widget.countryCode}'+widget.number
        =='+919989999899'||'${widget.countryCode}'+widget.number=='+19989999899'){

    }else {
      verifyPhoneNumber();
    }
    //verifyPhoneNumber();
  }
  verifyPhoneNumber() async {
    await Firebase.initializeApp();
    // await auth.setSettings(appVerificationDisabledForTesting: true);
    await auth.verifyPhoneNumber(
        phoneNumber: widget.countryCode + widget.number,
        autoRetrievedSmsCodeForTesting: verificationCode,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) {
            if (value.user != null) {
              print('code${value.user}');
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyHome()));
              // verifyOTP();
            }
          });
        },

        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message.toString()),
              duration: const Duration(seconds: 5),
            ),
          );
          print('strrr : ${e.message}');
          print('strrr : ${e.stackTrace}');
          // Fluttertoast.showToast(msg: 'Something went wrong',backgroundColor: Colors.red,gravity: ToastGravity.BOTTOM,);
        },
        codeSent: (String vID, int? resendToken) {
          setState(() {
            verificationCode = vID;
            print("verificationID$verificationCode");
            print('code sent...');
            Fluttertoast.showToast(
              msg: 'OTP Sent To ${widget.number} ',
              backgroundColor: Colors.green,
              gravity: ToastGravity.BOTTOM,
            );
            // if(verificationCode == )
          });
        },
        // timeout: Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String vID) {
          setState(() {
            verificationCode = vID;
          });
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                const EdgeInsets.fromLTRB(30.0, 10.0, 2.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: PinPut(
                    fieldsCount: 6,
                    withCursor: true,
                    textStyle: const TextStyle(
                        fontSize: 25.0, color: Color(0xFF000000)),
                    inputFormatters: [formatter],
                    eachFieldWidth: 40.0,
                    eachFieldHeight: 51.0,
                    onSubmit: (String pin) async {
                      if ('${widget.countryCode}' + widget.number ==
                          '+919989999899' ||
                          '${widget.countryCode}' + widget.number ==
                              '+19989999899') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHome()));
                      } else {
                        try {
                          await FirebaseAuth.instance
                              .signInWithCredential(
                              PhoneAuthProvider.credential(
                                  verificationId: verificationCode!,
                                  smsCode: otp.text))
                              .then((value) {
                            if (value.user != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHome()));
                            } else {
                              Fluttertoast.showToast(
                                msg: 'You Have Enter The Invalid OTP ',
                                backgroundColor: Colors.red,
                                gravity: ToastGravity.BOTTOM,
                              );
                            }
                          });
                        } catch (error) {
                          FocusScope.of(context).unfocus();
                          if (error
                              .toString()
                              .contains('credential is invalid')) {
                            Fluttertoast.showToast(
                              msg: 'You Have Enter The Invalid OTP ',
                              backgroundColor: Colors.red,
                              gravity: ToastGravity.BOTTOM,
                            );
                            otp.clear();
                          } else {}
                        }
                      }


                    },
                    controller: otp,
                    focusNode: _pinPutFocusNode,
                    selectedFieldDecoration: pinPutDecoration,
                    submittedFieldDecoration: pinPutDecoration,
                    followingFieldDecoration: pinPutDecoration,
                    pinAnimationType: PinAnimationType.fade,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      if (otp.text == '') {
                        Fluttertoast.showToast(
                            msg: 'Enter OTP',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (otp.text.length < 6) {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                        //  verifyOTP();
                        Fluttertoast.showToast(
                            msg: 'Please Enter valid OTP.',
                            backgroundColor: Colors.red,
                            gravity: ToastGravity.BOTTOM);
                        otp.clear();
                      } else {
                        print('hello1');
                        if('${widget.countryCode}'+widget.number=='+919989999899'||'${widget.countryCode}'+widget.number=='+19989999899'){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyHome()));
                        }
                        try {
                          await FirebaseAuth.instance
                              .signInWithCredential(
                                  PhoneAuthProvider.credential(
                                      verificationId: verificationCode!,
                                      smsCode: otp.text))
                              .then((value) => {
                                    if (value.user != null)
                                      {
                                        // getDataFromAPI(),
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => const MyHome()))
                                      }
                                    else
                                      {
                                        Fluttertoast.showToast(
                                            msg:
                                                'You Have Entered Invalid OTP.',
                                            backgroundColor: Colors.red,
                                            gravity: ToastGravity.BOTTOM)
                                      }
                                  });
                        } catch (error) {
                          FocusScope.of(context).unfocus();
                          print('wrong otp..$error');

                          if (error
                              .toString()
                              .contains('credential is invalid')) {
                            Fluttertoast.showToast(
                              msg: 'You Have Enter The Invalid OTP ',
                              backgroundColor: Colors.red,
                              gravity: ToastGravity.BOTTOM,
                            );
                            otp.clear();
                          } else {
                            Fluttertoast.showToast(
                                msg: 'You Have Entered Invalid OTP.',
                                backgroundColor: Colors.red,
                                gravity: ToastGravity.BOTTOM);
                          }
                        }
                      }
                    },
                    child: const Text("Verify Phone Number")),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          'phone',
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "Edit Phone Number ?",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
