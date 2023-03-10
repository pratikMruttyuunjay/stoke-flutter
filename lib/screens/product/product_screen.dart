import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/screens/product/product_controller.dart';
import '../../utils/dialog.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    const categoryList = ["fwefwef","fwefwef","ergergerg","ergerg"];
    final productListProd = ref.watch(productListController);
    final productUpdateProd = ref.watch(productUpdateController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: const Text("Product"),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child:
            ListView.builder(
              // clipBehavior: Clip.antiAlias,
              padding: const EdgeInsets.only(top: 5, bottom: 70),
              itemCount: categoryList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, int index) {
                return ProductItem(listData: categoryList[index]);
              },
            )
            // productListProd.map(
            //     data: (data) {
            //       return ListView.builder(
            //         // clipBehavior: Clip.antiAlias,
            //         padding: const EdgeInsets.only(top: 5, bottom: 70),
            //         itemCount: data.value?.length,
            //         shrinkWrap: true,
            //         itemBuilder: (BuildContext ctx, int index) {
            //           return ProductItem(listData: data.value[index]);
            //         },
            //       );
            //     },
            //     error: (t) => Center(
            //       child: Text(t.toString()),
            //     ),
            //     loading: (t) =>
            //     const Center(child: CircularProgressIndicator())),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add", arguments: 'Add Product');
        },
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
  // final CategoryListData listData;
  final String listData;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/batch");
        },
        onLongPress: () {
          DialogUtils.showUpdateDialog(context,
              updateFrom: UpdateFrom.product,
              txt : listData,
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
