// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart' as http;

// Future<String> _downloadAndSaveFile(String url, String fileName) async {
//   final Directory? directory;
//   if (Platform.isAndroid) {
//     directory = await getExternalStorageDirectory();
//   } else {
//     directory = await getApplicationDocumentsDirectory();
//   }

//   final String filePath = '${directory?.path}/$fileName.png';
//   final http.Response response = await http.get(Uri.parse(url));
//   final File file = File(filePath);
//   await file.writeAsBytes(response.bodyBytes);
//   return filePath;
// }

// const DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings(
//   onDidReceiveLocalNotification: onDidReceiveLocalNotification,
// );

// onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
//   // display a dialog with the notification details, tap ok to go to another page
//   log(id.toString());
//   log(title ?? "");
//   log(body ?? "");
//   log(payload ?? "");
// }

// class LocalNotificationService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
//   static const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'Ideal Notifications', // title
//     description: 'For receiving various notifications.', // description
//     importance: Importance.max,
//   );

//   static void initialize(BuildContext context) {
//     const InitializationSettings initializationSettings = InitializationSettings(
//       android: AndroidInitializationSettings("@mipmap/launcher_icon"),
//       iOS: initializationSettingsDarwin,
//     );

//     _notificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
//     try {
//       _notificationsPlugin.initialize(
//         initializationSettings,
//         onDidReceiveNotificationResponse: onNotificationTap,
//         onDidReceiveBackgroundNotificationResponse: onNotificationTap,
//       );
//     } catch (e) {
//       log("error _notificationsPlugin: $e");
//     }
//   }

//   static void display(RemoteMessage message) async {
//     try {
//       final int id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

//       var imageUrl = message.data['image_url'] ?? message.data['imageUrl'] ?? '';
//       var expImageUrl = message.data['exp_image_url'] ?? message.data['expImageUrl'] ?? '';
//       String? payloadEncode;
//       try {
//         payloadEncode = json.encode(message.data);
//       } catch (e) {
//         log("error encode");
//       }
//       // var payload = json.encode(message.data);

//       String largeIconPath = '';
//       if (imageUrl.isNotEmpty) {
//         largeIconPath = await _downloadAndSaveFile(
//           imageUrl,
//           'largeIcon',
//         );
//       }

//       String bigPicturePath = '';
//       if (expImageUrl.isNotEmpty) {
//         bigPicturePath = await _downloadAndSaveFile(
//           expImageUrl,
//           'bigPicture',
//         );
//       }

//       final NotificationDetails notificationDetails = NotificationDetails(
//           android: AndroidNotificationDetails(
//         channel.id,
//         channel.name,
//         channelDescription: channel.description,
//         importance: channel.importance,
//         priority: Priority.high,
//         enableVibration: true,
//         largeIcon: largeIconPath.isNotEmpty ? FilePathAndroidBitmap(largeIconPath) : null,
//         styleInformation: bigPicturePath.isNotEmpty
//             ? BigPictureStyleInformation(
//                 FilePathAndroidBitmap(bigPicturePath),
//                 hideExpandedLargeIcon: false,
//               )
//             : null,
//       ));

//       await _notificationsPlugin.show(
//         id,
//         message.notification?.title ?? '',
//         message.notification?.body ?? '',
//         notificationDetails,
//         payload: payloadEncode,
//       );
//     } on Exception catch (e) {
//       log("display error : $e");
//     }
//   }

//   static void testNotif() async {
//     final NotificationDetails notificationDetails = NotificationDetails(
//         android: AndroidNotificationDetails(
//       channel.id,
//       channel.name,
//       channelDescription: channel.description,
//       importance: channel.importance,
//       priority: Priority.high,
//       enableVibration: true,
//     ));
//     await _notificationsPlugin.show(
//       1000,
//       'Hallo',
//       "hii",
//       notificationDetails,
//     );
//   }

//   static void onNotificationTapBG(RemoteMessage notificationResponse) async {
//     log('onNotificationTap (${notificationResponse.messageId.toString()}) action tapped: '
//         'payload: ${notificationResponse.data.toString()}');
//     Map<String, dynamic> payload = notificationResponse.data;
//     ActionTypeRouteHandler.instance.actionTypeRoutePage(payload);
//   }

//   static void onNotificationTap(NotificationResponse notificationResponse) async {
//     log('onNotificationTap (${notificationResponse.id.toString()}) action tapped: '
//         'payload: ${notificationResponse.payload.toString()}');
//     var payload = json.decode(notificationResponse.payload ?? '');
//     if (payload == null) {
//       return;
//     }
//     ActionTypeRouteHandler.instance.actionTypeRoutePage(payload);
//   }
// }
