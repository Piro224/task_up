
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_up/utils/customTextField.dart';

import '../Models/formcontroller.dart';
import 'homepage.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String defaultValue= 'Low';
  @override
  Widget build(BuildContext context) {
    FormController formcontroller = Get.put(FormController());
    return GetBuilder<FormController>(
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'New Task',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  formcontroller: formcontroller,
                  labelText: 'Task Title',
                  controller: formcontroller.titleText,
                  icon: Icons.account_balance_sharp,
                ),
                CustomTextField(
                  formcontroller: formcontroller,
                  labelText: 'Task description',
                  controller: formcontroller.taskText,
                  icon: Icons.task,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 15,
                  ),
                  child: TextField(
                    controller: formcontroller.datetimeValue,
                    decoration: const InputDecoration(
                      labelText: 'DATE',
                      // filled: true,
                      prefixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectedDate(context);
                    },
                  ),
                ),
                DropdownButtonFormField(
                  value: defaultValue,
                  focusColor: Colors.white,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  hint: const Text('Select task priority'),
                  elevation: 0,
                  padding: const EdgeInsets.all(15),
                  items: const [
                    DropdownMenuItem(
                      value: 'Urgent',
                      child: Text('Urgent'),
                    ),
                    DropdownMenuItem(
                      value: 'High',
                      child: Text('High'),
                    ),
                    DropdownMenuItem(
                      value: 'Medium',
                      child: Text('Medium'),
                    ),
                    DropdownMenuItem(
                      value: 'Low',
                      child: Text('Low'),
                    ),
                  ],
                  onChanged: (newValue) {
                    formcontroller.labelText.text = newValue.toString();
                  },
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const HomePage());
                    formcontroller.addMyTask(
                      formcontroller.titleText.text,
                      formcontroller.taskText.text,
                      formcontroller.datetimeValue.text,
                      formcontroller.labelText.text,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'Add Task',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _selectedDate(BuildContext context) async {
  FormController formcontroller = Get.put(FormController());

  DateTime? Picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (Picked != null) {
    formcontroller.datetimeValue.text = Picked.toString().split(" ")[0];
  }
}
