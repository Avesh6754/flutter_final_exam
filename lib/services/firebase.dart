import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_final_exam/modal/modal_class.dart';
import 'package:flutter_final_exam/services/dbhelper.dart';
import 'package:get/get.dart';

class CloudFirebase {
  CloudFirebase._();

  static CloudFirebase cloudFirebase = CloudFirebase._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> uploadDataOnCloud() async {
    final result = await DbHelper.dbHelper.fetchAll();
    final batch = _firestore.batch();

    for (var habit in result) {
      final id = habit['id'].toString();
      final data = _firestore.collection("habit").doc(id);
      batch.set(data, habit, SetOptions(merge: true));

    }
    await batch.commit();
    Get.snackbar("Data Save on Cloud", "",duration:Duration(seconds: 1));
  }

  Future<void> fetchAllDataFromCloud() async {
    final records = await _firestore.collection("habit").get();
    final loaclData = await DbHelper.dbHelper.fetchAll();
    final localDataId = loaclData.map((habit) => habit['id'],).toSet();
    for (var listData in records.docs) {
      final data = listData.data();
      final conationId = data['id'];
      if (!localDataId.contains(conationId)) {
        ModalClass items = ModalClass(category: data['category'],
            habitName: data['habitName'],
            progress: data['progress'],
            remindertime: data['remindertime'],
            targetDays: data['targetDays']);
        await DbHelper.dbHelper.insertData(items);
        Get.snackbar("Data Fetch on Cloud", "",duration:Duration(seconds: 1));
      }
    }
  }

}