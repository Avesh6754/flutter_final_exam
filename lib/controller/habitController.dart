import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_final_exam/services/firebase.dart';
import 'package:get/get.dart';

import '../modal/modal_class.dart';
import '../services/dbhelper.dart';

class HabitController extends GetxController {
  var txtHabit = TextEditingController();
  RxString category = "Health".obs;
  RxInt status=0.obs;
  var targetDay = TextEditingController();
  var remainder = TextEditingController();
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();

  RxBool progress = false.obs;

  RxList<ModalClass> modalList = <ModalClass>[].obs;
  List<String> list = <String>['Health', 'Personal', 'Work'];

  Future<List<ModalClass>> fetchAllData() async {
    final data = await DbHelper.dbHelper.fetchAll();
    modalList.value = data
        .map(
          (e) => ModalClass.fromMap(e),
        )
        .toList();
    return modalList;
  }

  void categoryChange(var value) {
    category.value = value;
  }

  Future<void> deleteDataFromList(int id) async {
    await DbHelper.dbHelper.deleteData(id);
    await fetchAllData();
  }

  Future<void> insertData(ModalClass items) async {
    try {
      await DbHelper.dbHelper.insertData(items);
      await fetchAllData();
    } catch (e) {
      log('not insert');
    }
  }

  Future<void> updateData(ModalClass items) async {
    items.category = category.value;
    items.remindertime = remainder.text;
    items.targetDays = targetDay.text;
    items.habitName = txtHabit.text;
    try {
      await DbHelper.dbHelper.updateData(items);
      await fetchAllData();
    } catch (e) {
      log('not update');
    }
  }

  Future<void> updateChanhe(ModalClass items, var value) async {
    items.progress = value;
    if(value==1)
      {
        status.value++;
      }
    else{
      status.value--;
    }
    try {
      await DbHelper.dbHelper.updateData(items);
      await fetchAllData();
    } catch (e) {
      log('not update');
    }
  }


  Future<void> fetchFromCloudData()
  async {
    await CloudFirebase.cloudFirebase.fetchAllDataFromCloud();
    await fetchAllData();
  }
  Future<void> uploadDataOnServer()
  async {
    await CloudFirebase.cloudFirebase.uploadDataOnCloud();
    await fetchAllData();
  }
}
