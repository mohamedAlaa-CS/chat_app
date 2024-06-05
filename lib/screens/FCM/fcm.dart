import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class Fcm {
  // instance from firebase messaging .....................
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<void> fcmMessage() async {
    requestPermissionIos();
    getToken();
    onForGround();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

// permission ios ..................................................
  Future<void> requestPermissionIos() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
  }

// get token .................................................
  Future<String?> getToken() async {
    String? token;
    token = await messaging.getToken();
    print(token);
    return token;
  }

  Future<void> onForGround() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.max,
    );
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: "ic_launcher",
                // other properties...
              ),
            ));
      }
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }
}

// sendMessage() async {
//   var headersList = {
//     'Accept': '*/*',
//     'Content-Type': 'application/json',
//     'Authorization':
//         'key=AAAAoE6L2EY:APA91bHEgr_ztI8RYbTTu4ruIbm9CfL-94iV9dYPwl5pi_yh2bt_lsPFpB4V401G1ahuumsGwnFq2K4Eq5xxo4LZPeZwVwbpw9FST4N-p7ZeTPLBNP_qPJyalal0AI9rXkX2rDV07-gR'
//   };
//   var url = Uri.parse('https://fcm.googleapis.com/fcm/send');

//   var body = {
//     "to":
//         "cltDm-cYSTyRVZe-1f88kw:APA91bGpZNNNEDUKXF-9la89v5_ESqLr_hSBLg_m4_Fq2cXdJRjKH5TkjTKFuKKEMXZ7gcMrkw8QwlDt2Vpbxgh6ZZ2stENG5WGIyp2NQVGunI9NwYdzEi4QCp44pC3mMFWrxPbaYJ3U",
//     "notification": {
//       "title": "welcome to my app",
//       "body": "mohamed",
//       "mutable_content": true,
//       "sound": "Tri-tone"
//     },
//     "data": {
//       "url": "<url of media image>",
//       "dl": "<deeplink action on tap of notification>"
//     }
//   };

//   var req = http.Request('POST', url);
//   req.headers.addAll(headersList);
//   req.body = json.encode(body);

//   var res = await req.send();
//   final resBody = await res.stream.bytesToString();

//   if (res.statusCode >= 200 && res.statusCode < 300) {
//     print(resBody);
//   } else {
//     print(res.reasonPhrase);
//   }
// }
