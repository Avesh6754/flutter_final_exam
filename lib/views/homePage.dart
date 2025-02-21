import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_exam/modal/modal_class.dart';
import 'package:flutter_final_exam/services/authFirebase.dart';
import 'package:flutter_final_exam/views/signIn.dart';
import 'package:get/get.dart';

import '../controller/habitController.dart';

var habitController = Get.put(HabitController());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Habit Tracker"),
        actions: [
          IconButton(onPressed: () async {
             await AuthServices.authServices.signOut();
             if(AuthServices.authServices.getCurrentUser()==null)
               {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Signin(),));
               }
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
      StreamBuilder<List<ConnectivityResult>>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        final result = snapshot.data;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () async {
                  if (result!.contains(ConnectivityResult.mobile) ||
                      result.contains(ConnectivityResult.wifi)) {
                   await habitController.uploadDataOnServer();
                  } else if (result.contains(ConnectivityResult.none)) {
                    Get.snackbar('You are Offline', '');
                  }
                },

                icon: Icon(Icons.cloud)),
            SizedBox(width: 20,),
            IconButton(
                onPressed: () async {
                  if (result!.contains(ConnectivityResult.mobile) ||
                      result.contains(ConnectivityResult.wifi)) {
                   await habitController.fetchFromCloudData();
                  } else if (result.contains(ConnectivityResult.none)) {
                    Get.snackbar('You are Offline', '');
                  }
                },
                icon: Icon(Icons.sync))
          ],
        );
      },
      ),

      Obx(() => CircularProgressIndicator(
          value: (habitController.status.value*habitController.modalList.length)/100,
        color: Colors.blue,

        ),
      ),
      Expanded(
              child: FutureBuilder(
            future: habitController.fetchAllData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                List<ModalClass> modalData = snapshot.data!;
                return Obx(
                  () => ListView.builder(
                    itemCount: modalData.length,
                    itemBuilder: (context, index) {
                      return (modalData.isNotEmpty)
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Habit ${modalData[index].habitName}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Category ${modalData[index].category}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "Target ${modalData[index].targetDays}",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "Reminder ${modalData[index].remindertime}",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Obx(
                                          () => Checkbox(
                                              value:
                                                  (modalData[index].progress ==
                                                          1)
                                                      ? true
                                                      : false,
                                              onChanged: (bool? value) {
                                                var i = (value!) ? 1 : 0;
                                                habitController.updateChanhe(
                                                    modalData[index], i);
                                              }),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              habitController.txtHabit =
                                                  TextEditingController(
                                                      text: modalData[index]
                                                          .habitName);
                                              habitController.targetDay =
                                                  TextEditingController(
                                                      text: modalData[index]
                                                          .targetDays
                                                          .toString());
                                              habitController.remainder =
                                                  TextEditingController(
                                                      text: modalData[index]
                                                          .remindertime
                                                          .toString());
                                              habitController.category =
                                                  modalData[index].category.obs;

                                              return AlertDialog(
                                                title: Text("Add Task"),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  spacing: 10,
                                                  children: [
                                                    TextField(
                                                      controller:
                                                          habitController
                                                              .txtHabit,
                                                      decoration: InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          hintText:
                                                              'Habit Name'),
                                                    ),
                                                    TextField(
                                                      controller:
                                                          habitController
                                                              .targetDay,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration: InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          hintText:
                                                              'Target Days'),
                                                    ),
                                                    TextField(
                                                      controller:
                                                          habitController
                                                              .remainder,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration: InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          hintText:
                                                              'Remainder Days'),
                                                    ),
                                                    Obx(
                                                      () => DropdownButton<
                                                          String>(
                                                        value: habitController
                                                            .category.value,
                                                        icon: const Icon(Icons
                                                            .arrow_downward),
                                                        elevation: 16,
                                                        style: const TextStyle(
                                                            color: Colors
                                                                .deepPurple),
                                                        underline: Container(
                                                            height: 2,
                                                            color: Colors
                                                                .deepPurpleAccent),
                                                        onChanged:
                                                            (String? value) {
                                                          habitController
                                                              .categoryChange(
                                                                  value!);
                                                        },
                                                        items: habitController
                                                            .list
                                                            .map<
                                                                DropdownMenuItem<
                                                                    String>>((String
                                                                value) {
                                                          return DropdownMenuItem<
                                                                  String>(
                                                              value: value,
                                                              child:
                                                                  Text(value));
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        habitController.category
                                                            .value = 'Health';
                                                        habitController.progress
                                                            .value = false;
                                                        habitController
                                                            .remainder
                                                            .clear();
                                                        habitController
                                                            .targetDay
                                                            .clear();
                                                        habitController.txtHabit
                                                            .clear();
                                                        Get.back();
                                                      },
                                                      child: Text('Cancel')),
                                                  TextButton(
                                                      onPressed: () {
                                                        habitController
                                                            .updateData(
                                                                modalData[
                                                                    index]);
                                                        habitController.category
                                                            .value = 'Health';
                                                        habitController.progress
                                                            .value = false;
                                                        habitController
                                                            .remainder
                                                            .clear();
                                                        habitController
                                                            .targetDay
                                                            .clear();
                                                        habitController.txtHabit
                                                            .clear();
                                                        Get.back();
                                                      },
                                                      child: Text('Update')),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {
                                          habitController.deleteDataFromList(
                                              modalData[index].id!);
                                        },
                                        icon: Icon(Icons.delete))
                                  ],
                                ),
                              ),
                            )
                          : Text('No data found');
                    },
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Task"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    TextField(
                      controller: habitController.txtHabit,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Habit Name'),
                    ),
                    TextField(
                      controller: habitController.targetDay,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Target Days'),
                    ),
                    TextField(
                      controller: habitController.remainder,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Remainder Days'),
                    ),
                    Obx(
                      () => DropdownButton<String>(
                        value: habitController.category.value,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                            height: 2, color: Colors.deepPurpleAccent),
                        onChanged: (String? value) {
                          habitController.categoryChange(value!);
                        },
                        items: habitController.list
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        habitController.category.value = 'Health';
                        habitController.progress.value = false;
                        habitController.remainder.clear();
                        habitController.targetDay.clear();
                        habitController.txtHabit.clear();
                        Get.back();
                      },
                      child: Text('Cancel')),
                  TextButton(
                      onPressed: () {
                        ModalClass items = ModalClass(
                            category: habitController.category.value,
                            habitName: habitController.txtHabit.text,
                            progress: (habitController.progress.value) ? 1 : 0,
                            remindertime: habitController.remainder.text,
                            targetDays: habitController.targetDay.text);
                        habitController.insertData(items);
                        habitController.category.value = 'Health';
                        habitController.progress.value = false;
                        habitController.remainder.clear();
                        habitController.targetDay.clear();
                        habitController.txtHabit.clear();
                        Get.back();
                      },
                      child: Text('Add')),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
