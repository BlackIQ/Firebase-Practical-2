import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = Firestore.instance;

final developers = firestore.collection('developers').snapshots();
