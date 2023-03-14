import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dto/batch/batch_list.dart';
import 'package:stoke/screens/batch/batch_controller.dart';

import '../../dto/category/category_list_dto.dart';
import '../../dto/product/product_list.dart';
import '../../utils/dialog.dart';

class BatchScreen extends ConsumerWidget {
  const BatchScreen({Key? key,required this.listData}) : super(key: key);

  final ProductListData listData;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final list = ["ffewf", "efefef","wefwefwefw","fwefwefw"];
    final batchListProd = ref.watch(batchListController(listData.id));
    final batchUpdateProd = ref.watch(batchUpdateController);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: const Text("Batch"),
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
            // ListView.builder(
            //   // clipBehavior: Clip.antiAlias,
            //   padding: const EdgeInsets.only(top: 5, bottom: 70),
            //   itemCount: list.length,
            //   shrinkWrap: true,
            //   itemBuilder: (BuildContext ctx, int index) {
            //     return BatchCard(listData: list[index]);
            //   },
            // ),
            batchListProd.map(
                data: (data) {
                  // if(data.value!.isNotEmpty){
                    return ListView.builder(
                      // clipBehavior: Clip.antiAlias,
                      padding: const EdgeInsets.only(top: 5, bottom: 70),
                      itemCount: data.value?.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext ctx, int index) {
                        return BatchItem(listData: data.value![index]);
                      },
                    );
                  // }else {
                  //   return const Center(child: Text("Products not found"));
                  // }
                },
                error: (t) => Center(
                  child: Text(t.toString()),
                ),
                loading: (t) =>
                const Center(child: CircularProgressIndicator())
            )
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add",arguments: 'Add Batch');
        },
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(), padding: const EdgeInsets.all(16)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
    ;
  }
}

class BatchItem extends StatelessWidget {
  const BatchItem({Key? key, required this.listData}) : super(key: key);
  final BatchListData listData;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(context, "/product");
        },
        onLongPress: () {
          DialogUtils.showUpdateDialog(
              context,
              updateFrom: UpdateFrom.batch,
              txt: "",
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

class BatchCard extends StatelessWidget {
  const BatchCard({Key? key, required this.listData}) : super(key: key);
  final String listData;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {},
        onLongPress: () {
          DialogUtils.showUpdateDialog(
              context,
              updateFrom: UpdateFrom.batch,
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
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                child: Text(
                  listData,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Text(
                '8',
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: CircleAvatar(
                      backgroundColor: Color(0x0028009CFF),
                      child: IconButton(
                        onPressed: () {
                          DialogUtils.showIncDialog(context, txt: "", onUpdateCall: (name){});
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                   CircleAvatar(
                    backgroundColor: Color(0x0028009CFF),
                    child: IconButton(
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
