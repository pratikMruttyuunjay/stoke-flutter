import 'package:flutter/material.dart';
import 'package:stoke/screens/category/category_screen.dart';

import '../../dto/category_list_dto.dart';
import '../../utils/dialog.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: const Text("Product"),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Flexible(
          //   child: categoryList.map(
          //       data: (data) {
          //         return ListView.builder(
          //           // clipBehavior: Clip.antiAlias,
          //           padding: const EdgeInsets.only(top: 5, bottom: 70),
          //           itemCount: data.value.length,
          //           shrinkWrap: true,
          //           itemBuilder: (BuildContext ctx, int index) {
          //             return ProductItem(listData: data.value[index]);
          //           },
          //         );
          //       },
          //       error: (t) => Center(
          //         child: Text(t.toString()),
          //       ),
          //       loading: (t) =>
          //       const Center(child: CircularProgressIndicator())),
          // ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
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

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.listData}) : super(key: key);
  final CategoryListData listData;

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
          // DialogUtils.showUpdateDialog(
          //     context,
          //     updateFrom: UpdateFrom.category,
          //     txt: "",
          //     // onDismiss: () {},
          //     onUpdateCall: (title,dialog) {});
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
              child: Text(listData.title,
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
