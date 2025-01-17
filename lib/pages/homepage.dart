// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_up/pages/formPage.dart';

import '../Models/formcontroller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    FormController controller = Get.find();
    return GetBuilder<FormController>(
      builder: (_) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: const Text("MY TASKS",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white)),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.itemCount.value,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListTile(
                        tileColor: isCompleted ? Colors.white54 : Colors.white,
                        leading: Checkbox(
                          value: isCompleted,
                          tristate: true,
                          onChanged: (bool? newValue) {
                            setState(() {

                              isCompleted = newValue ?? false;
                            });
                          },
                          checkColor: Colors.amber,
                          activeColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        title: Text(
                          controller.myTask.value[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            Expanded(
                                child:
                                    Text(controller.myTask.value[index].task)),
                            const SizedBox(width: 5),
                            const VerticalDivider(
                                thickness: 2, color: Colors.black),
                            Expanded(
                                child: Text(
                                    controller.myTask.value[index].datetime)),
                          ],
                        ),
                        trailing: Text(
                          controller.myTask.value[index].label,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Get.to(() => const FormPage());
          },
          child: const Icon(
            Icons.edit,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
