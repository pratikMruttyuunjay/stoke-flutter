import 'dart:math';

import 'package:flutter/material.dart';

enum UpdateFrom {
  category,
  product,
  batch
  // Add more options as needed
}

class DialogUtils {
  static final DialogUtils _instance = DialogUtils.internal();

  DialogUtils.internal();

  static void showUpdateDialog(
    BuildContext context, {
    required updateFrom,
    required String txt,
    required Function(String?) onUpdateCall,
    // required Function() onDismiss,
  }) {
    late final TextEditingController textController1 = TextEditingController()
      ..text = txt;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 17.0, vertical: 24.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              height: 250,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 40),
                       Text((){
                       switch (updateFrom){
                         case UpdateFrom.category : return "Update Category";
                         case UpdateFrom.product : return "Update Product";
                         case UpdateFrom.batch : return "Update Batch";
                         default : return "Category";
                       }
                      }(), style: const TextStyle(
                         color: Colors.black,
                         fontSize: 23,
                         fontFamily: 'sans-serif-condensed-medium',
                       ),),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: textController1,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        prefixIcon: const Icon(Icons.drive_file_rename_outline),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => {textController1.clear()},
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      onPressed: () =>
                          {onUpdateCall(textController1.text.toString())},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Update'),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static void showIncDialog(
    BuildContext context, {
    // required updateFrom,
    required String txt,
    required Function(String?) onUpdateCall,
    // required Function() onDismiss,
  }) {
    late final TextEditingController textController1 = TextEditingController()
      ..text = txt;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 17.0, vertical: 24.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              height: 300,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 40),
                      const Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontFamily: 'sans-serif-condensed-medium',
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      TextField(
                        controller: textController1,
                        decoration: InputDecoration(
                          hintText: 'Quantity',
                          prefixIcon: const Icon(Icons.drive_file_rename_outline),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => {textController1.clear()},
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Qty',
                          prefixIcon: const Icon(Icons.drive_file_rename_outline),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => {textController1.clear()},
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      onPressed: () =>
                          {onUpdateCall(textController1.text.toString())},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Update'),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  factory DialogUtils() => _instance;
}
