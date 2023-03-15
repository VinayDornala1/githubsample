// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:sms_autofill/sms_autofill.dart';
//
// class OTPScreen extends StatefulWidget {
//   final String phoneNumber;
//
//   OTPScreen({required this.phoneNumber});
//
//   @override
//   _OTPScreenState createState() => _OTPScreenState();
// }
//
// class _OTPScreenState extends State<OTPScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String? _verificationId;
//   final TextEditingController _otpController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _sendVerificationCode();
//     _listenForCode();
//   }
//
//   void _sendVerificationCode() async {
//     await _auth.verifyPhoneNumber(
//       phoneNumber: widget.phoneNumber,
//       verificationCompleted: (PhoneAuthCredential credential) {},
//       verificationFailed: (FirebaseAuthException e) {
//         print(e.message);
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         _verificationId = verificationId;
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }
//
//   void _listenForCode() async {
//     await SmsAutoFill().listenForCode;
//     final String? code = await SmsAutoFill().getAppSignature.then((signature) {
//       return SmsAutoFill().getSignatureCode;
//     });
//     if (code != null) {
//       _otpController.text = code;
//       _signInWithPhoneNumber();
//     }
//   }
//
//   void _signInWithPhoneNumber() async {
//     try {
//       final PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: _verificationId!,
//         smsCode: _otpController.text,
//       );
//       final UserCredential userCredential =
//       await _auth.signInWithCredential(credential);
//       final User? user = userCredential.user;
//       // User signed in successfully
//     } catch (e) {
//       // Error occurred while signing in
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Enter OTP')),
//       body: Column(
//         children: [
//           SizedBox(height: 30),
//           Text('Enter the OTP sent to ${widget.phoneNumber}'),
//           SizedBox(height: 30),
//           TextField(
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(hintText: 'Enter OTP'),
//             onChanged: (value) {},
//             controller: _otpController,
//             autofillHints: [AutofillHints.oneTimeCode],
//           ),
//           SizedBox(height: 30),
//           ElevatedButton(
//             onPressed: () => _signInWithPhoneNumber(),
//             child: Text('Verify OTP'),
//           ),
//         ],
//       ),
//     );
//   }
// }