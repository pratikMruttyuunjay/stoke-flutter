import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/screens/category/category_controller.dart';
import 'package:stoke/dto/category/category_list_dto.dart';
import 'package:stoke/utils/dialog.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryList = ["efewfef", 'efefe'];
    // final categoryList = ref.watch(categoryListController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: const Text("Category"),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // const Toolbar(),
          Flexible(
              child: ListView.builder(
            // clipBehavior: Clip.antiAlias,
            padding: const EdgeInsets.only(top: 5, bottom: 70),
            itemCount: categoryList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext ctx, int index) {
              return CategoryItem(listData: categoryList[index]);
            },
          )
              // categoryList.map(
              //     data: (data) {
              //       return ListView.builder(
              //         // clipBehavior: Clip.antiAlias,
              //         padding: const EdgeInsets.only(top: 5, bottom: 70),
              //         itemCount: data.value.length,
              //         shrinkWrap: true,
              //         itemBuilder: (BuildContext ctx, int index) {
              //           return CategoryItem(listData: data.value[index]);
              //         },
              //       );
              //     },
              //     error: (t) => Center(
              //           child: Text(t.toString()),
              //         ),
              //     loading: (t) =>
              //         const Center(child: CircularProgressIndicator())),
              ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add", arguments: 'Add Category');
        },
        // onLongPress: () {
        //   DialogUtils.showIncDialog(
        //       context,
        //       updateFrom: UpdateFrom.category,
        //       txt: "",
        //       onUpdateCall: (text) {
        //           print(text);
        //           Navigator.pop(context);
        //       });
        // },
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(), padding: const EdgeInsets.all(16)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.listData}) : super(key: key);
  final String listData;

  // final CategoryListData listData;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/product");
        },
        onLongPress: () {
          DialogUtils.showUpdateDialog(context,
              updateFrom: UpdateFrom.category,
              txt: listData,
              // onDismiss: () {},
              onUpdateCall: (title) {});
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 50,
              child: VerticalDivider(
                color: Color(0xFF7540EE),
                thickness: 5,
                width: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Text(listData,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'sans-serif-condensed',
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            )
          ],
        ),
      ),
    );
  }
}

class Toolbar extends StatelessWidget {
  const Toolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.purple, // set color of status bar
    ));

    return SizedBox(
      height: 60,
      child: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: const Text("Category"),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
      ),
      // body: AnnotatedRegion<SystemUiOverlayStyle>(
      //   value: const SystemUiOverlayStyle(
      //     statusBarColor: Colors.red
      //   ),
      //   child: SafeArea(
      //     child: Container(),
      //   ),
      // ),
    );
  }
}
