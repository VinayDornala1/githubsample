import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:githubsample/home.dart';
import 'package:githubsample/phone.dart';
import 'package:githubsample/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'LoginScreen.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter/foundation.dart';
import 'OTPScreen.dart';
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//
//
//   runApp(/*MaterialApp(
//     initialRoute: 'phone',
//     debugShowCheckedModeBanner: false,
//     routes: {
//       'phone': (context) => const MyPhone(),
//       'verify': (context) => MyVerify(),
//       'home':(context)=>const MyHome()
//
//     },
//   )*/
//       OTPSCreen()
//   );
// }

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SentryFlutter.init((options){
    options.dsn='https://ff67f80d95dc4e23a92fb7ef40d7c875@o4504569324503040.ingest.sentry.io/4504819768033280';
  });
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OTPSCreen(),
    );
  }
}
// class MyWidget extends StatefulWidget {
//   const MyWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }
//
// class _MyWidgetState extends State<MyWidget> {
//   // final performance = SentryPerformance( 'expensive-operation-transaction',
//   //   'expensive-operation',);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SentryFlu,
//       ),
//     );
//   }
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   // void initState() {
//   //   super.initState();
//   //   _initializeSentry();
//   // }
//   // Future<void> _initializeSentry() async {
//   //   await SentryFlutter.init(
//   //         (options) => options.dsn = 'YOUR_DSN_HERE',
//   //     // Enable performance monitoring
//   //     performanceTracking: true,
//   //   );
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('My Button'),
//           onPressed: (){
//             _myButtonPressed();
//           },
//         ),
//       ),
//     );
//   }
//   void _myButtonPressed() {
//     SentryFlutter.withTransaction(
//       name: 'MyButtonPressed',
//       measure: () async {
//         // Your code here
//         await Future.delayed(const Duration(seconds: 1)); // simulate some work
//         print('Button Pressed');
//       },
//     );
//   }
// }

// Future<void> main() async {
//   await SentryFlutter.init((options) {
//     options.dsn =
//         'https://ff67f80d95dc4e23a92fb7ef40d7c875@o4504569324503040.ingest.sentry.io/4504819768033280';
//     // options.tracesSampleRate = 1.0;
//   }, appRunner: () => runApp(const MyApp()));
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//    SentryTransaction? _transaction;
//   // Widget testErrorButton = IconButton(
//   //     onPressed: () async {
//   //       try {
//   //         throw const FormatException('Test');
//   //       } catch (exception, stackTrace) {
//   //         if (kDebugMode) {
//   //           print(exception);
//   //         }
//   //       }
//   //     },
//   //     icon: const Icon(Icons.error_rounded));
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _transaction=SentryPerformance.(
//       name: 'Load Widget',
//       operation: 'widget.load',)
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(''),
//       ),
//     );
//   }
// }

//onesignal crash start
// Future<void> main() async{
//   await SentryFlutter.init((option) => option.dsn='https://ff67f80d95dc4e23a92fb7ef40d7c875@o4504569324503040.ingest.sentry.io/4504819768033280',appRunner: ()=>runApp(MyApp()));
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: ElevatedButton(
//             style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
//             child: Text('I AM buggy'),
//             onPressed: (){throw new StateError('This is the Dart exception error.');},
//           ),
//         ),
//       )
//     );
//   }
// }
//onesignal crash stop
class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({Key? key}) : super(key: key);

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  bool _requireConsent = false;

  String _verificationId = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
    // OneSignal.shared.setLogLevel(OSLogLevel.debug, OSLogLevel.none);
    // OneSignal.shared.setAppId('1530e9e7-e87b-4526-b3e0-855bc206fc70');
  }

  static final String oneSignalAppId = "1530e9e7-e87b-4526-b3e0-855bc206fc70";

  Future<void> initPlatformState() async {
    OneSignal.shared.setAppId(oneSignalAppId);
    OneSignal.shared
        .promptUserForPushNotificationPermission()
        .then((accepted) {});
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      if (result.notification.body!.contains("MyPhone")) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyPhone(),
          ),
        );
      } else if (result.notification.body!.contains("MyVerify")) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyVerify(),
          ),
        );
      }
      var payload;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Authentication'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  hintText: 'Enter phone number',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _sendVerificationCode(),
                child: const Text('Send verification code'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _smsController,
                decoration: const InputDecoration(
                  hintText: 'Enter verification code',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _verifyCode(),
                child: const Text('Verify code'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sendVerificationCode() async {
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential credential) async {
      await FirebaseAuth.instance.signInWithCredential(credential);
      // Perform any necessary actions after sign in
    };
    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      print('${exception.message}');
    };
    final PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingToken]) async {
      // Save the verification ID for later use
      _verificationId = verificationId;
    };
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      // Save the verification ID for later use
      _verificationId = verificationId;
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _phoneNumberController.text.trim(),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        timeout: const Duration(seconds: 60));
  }

  Future<void> _verifyCode() async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: _smsController.text.trim(),
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    // Perform any necessary actions after sign in
  }
}
