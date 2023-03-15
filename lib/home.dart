import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver observer =
  FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    analytics.logEvent(
      name: 'my_event',
      parameters: {
        'param1': 'value1',
        'param2': 'value2',
      },

    );
    analytics.setCurrentScreen(
      screenName: 'my_screen',
    );
    SentryFlutter.init((options)=>options.enableAutoSessionTracking=true );
    throw new StateError('message');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
    );
  }
}
