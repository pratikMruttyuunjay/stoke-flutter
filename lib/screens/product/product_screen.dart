import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dto/product/product_list.dart';
import 'package:stoke/screens/category/category_screen.dart';
import 'package:stoke/screens/product/product_controller.dart';
import '../../dto/category/category_list_dto.dart';
import '../../utils/dialog.dart';
import '../add/add_screen.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({Key? key,required this.categoryListData}) : super(key: key);

  final CategoryListData categoryListData;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    print(categoryListData.title);
    final productListProd = ref.watch(productListController(categoryListData.id));
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
          Consumer(builder: (_, ref, child) {
            final ProductUpdateState addState = ref.watch(productUpdateStateProvider);
            print("Update Consumer Called");
            if(addState is ProductUpdateLoaded){
              print("Update Loaded State = ${addState.updateData.toString()}");
              ref.refresh(productListController(categoryListData.id));
              Navigator.pop(context);
            }else if(addState is ProductUpdateError){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(addState.errorData.message)));
              print("Update Error State = ${addState.errorData.toString()}");
            }
            return Container();
          },),
          Flexible(
            child:
            productListProd.map(
                data: (data) {
                  if(data.value.isNotEmpty){
                    return RefreshIndicator(
                      onRefresh: () async => await ref.refresh(productListController(categoryListData.id)),
                      child: ListView.builder(
                        // clipBehavior: Clip.antiAlias,
                        padding: const EdgeInsets.only(top: 5, bottom: 70),
                        itemCount: data.value.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext ctx, int index) {
                          return ProductItem(listData: data.value[index]);
                        },
                      ),
                    );
                  }else {
                   return const Center(child: Text("Products not found"));
                  }
                },
                error: (t) => Center(
                  child: Text(t.toString()),
                ),
                loading: (t) =>
                const Center(child: CircularProgressIndicator())),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add", arguments: AddScreenArg(from: AddScreenFrom.product,categoryId: categoryListData.id));
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

class ProductItem extends ConsumerWidget {
  const ProductItem({Key? key, required this.listData}) : super(key: key);
  final ProductListData listData;
  // final String listData;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/batch",arguments: listData);
        },
        onLongPress: () {
          DialogUtils.showUpdateDialog(context,
              updateFrom: UpdateFrom.product,
              txt : listData.title,
              // onDismiss: () {},
              onUpdateCall: (title) {
                print("onUpdateCall");
                ref.read(productUpdateStateProvider.notifier).update(ref: ref, title: title,productId: listData.id);
              });
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
  // void handleAdd(){
  //   Consumer(builder: (context, ref, child) {
  //     final ProductUpdateState addState = ref.watch(productUpdateStateProvider);
  //     print("handleAddCalled");
  //     if(addState is ProductUpdateLoading){
  //       // print("Add Loading = ${addState.updateData.toString()}");
  //       return Container();
  //     }else if(addState is ProductUpdateLoaded){
  //       print("Add Loaded = ${addState.updateData.toString()}");
  //       Navigator.pop(context);
  //     }else if(addState is ProductUpdateError){
  //       print("Add Error = ${addState.errorData.toString()}");
  //     }
  //     return Container();
  //   },);
  // }
}
