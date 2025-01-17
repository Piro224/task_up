import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_up/Models/task_model.dart';

class FormController extends GetxController{
  Rx<List<TaskModel>> myTask = Rx<List<TaskModel>>([]);
  TextEditingController titleText = TextEditingController();
  TextEditingController taskText = TextEditingController();
  TextEditingController datetimeValue = TextEditingController();
  TextEditingController labelText = TextEditingController();
  late TaskModel taskModel;
  var itemCount = 0.obs;

  
  @override
  void onClose() {
    super.onClose();
    titleText.dispose();
    taskText.dispose();
    datetimeValue.dispose();
    labelText.dispose();

  }

  addMyTask(String title, String task, String datetime, String label) {
    taskModel = TaskModel(title: title, task: task, datetime: datetime, label: label);
    myTask.value.add(taskModel);
    itemCount.value = myTask.value.length;
    titleText.clear();
    taskText.clear();
    datetimeValue.clear();
    labelText.clear();
    
  }
  removeQR(int index){
    myTask.value.removeAt(index);
    itemCount.value = myTask.value.length;

  }
}