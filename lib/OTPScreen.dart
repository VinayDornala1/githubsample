import 'package:flutter/material.dart';

class OTPSCreen extends StatefulWidget {
  const OTPSCreen({Key? key}) : super(key: key);
  @override
  State<OTPSCreen> createState() => _OTPSCreenState();
}

class _OTPSCreenState extends State<OTPSCreen> {
  String xp = '0';
  FocusNode focusNode = FocusNode();
  bool isFocused = false;
  TextEditingController otp = TextEditingController();
  @override
  void initState() {
    focusNode.addListener(_onFocusChange);
    super.initState();
  }

  void _onFocusChange() {
    setState(() => isFocused = !isFocused);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                'assets/bnnaaa.png',
                // width: double.infinity,
                // height: double.infinity,
                // fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 260.0),
                child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                        color: Color(0XFFffffff),
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(20))),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "OTP Verification",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Color(0XFF1b1b1b)),
                        ),
                        const Text(
                          'Enter the verification code we have just sent you',
                          style: TextStyle(color: Color(0XFF131313)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '+91 00000 00000',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.edit,
                              size: 20,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'assets/bnnaaa.png',
                          height: 70,
                          width: 70,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                       /* Stack(
                          children: [
                            Container(
                              height: 80,
                              width: double.maxFinite,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                height: 60,
                                width: double.maxFinite,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    border: Border(
                                        top: BorderSide(color: Colors.black),
                                        bottom: BorderSide(color: Colors.black),
                                        right: BorderSide(color: Colors.black),
                                        left: BorderSide(color: Colors.black))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    Expanded(
                                      child: TextField(
                                        style: TextStyle(
                                            fontSize: 21,
                                            letterSpacing: 1,
                                            color: Color(0xFF1b1b1b)),
                                        maxLength: 10,
                                        inputFormatters: [
                                          *//*    MaskTextInputFormatter(
                                            mask:'##########',filter: {"#":RegExp(r'[0-9]')}
                                      )*//*
                                        ],
                                        keyboardType: TextInputType.phone,
                                        // controller: mobilenumber,
                                        decoration: InputDecoration(
                                          hintText: "0000",
                                          hintStyle: TextStyle(
                                              fontSize: 21,
                                              letterSpacing: 1,
                                              color: Color(0xFFb9b9b9)),
                                          border: InputBorder.none,
                                          counterText: "",
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 30,
                                width: (MediaQuery.of(context).size.width) / 3,
                                color: Color(0xFFfafafa),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 9, right: 9),
                                  child: Center(
                                      child: Text(
                                    'Mobile Number',
                                    maxLines: 1,
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),*/
                        Container(
                          height: 65,
                          margin:
                              const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(

                                          focusedBorder: OutlineInputBorder(
                                              borderSide:
                                                  const BorderSide(color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(30)),

                                          enabledBorder: OutlineInputBorder(
                                              borderSide:
                                                  const BorderSide(color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          hintText: '0 0 0 0',

                                          hintStyle: const TextStyle(fontSize: 20)),
                                      controller: otp,
                                      cursorColor: Colors.grey,
                                    ),
                                  )),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  color: Colors.white,
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text('OTP'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              color: const Color(0XFF6c1d3d),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Submit",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              )
                            ],
                          )),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
