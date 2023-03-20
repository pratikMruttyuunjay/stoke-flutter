import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/on_generate_route.dart';
import 'package:stoke/screens/add/add_controller.dart';

import '../category/category_controller.dart';


enum AddScreenFrom {
  category,
  product,
  batch
}

class AddScreenArg {
  final String? categoryId;
  final String? productId;
  final AddScreenFrom? from;

  AddScreenArg({this.categoryId, this.productId,this.from});
}

class AddScreen extends ConsumerWidget {

  const AddScreen({Key? key,required this.argument}) : super(key: key);

  final AddScreenArg argument;
  // final AddScreenArg arg;
  // final String categoryId;
  // final String productId;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController quantityController = TextEditingController();

    // final routes =
    // ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    print(argument);
    // final addProductProd = ref.watch(productAddController);
    // final addBatchProd = ref.watch(batchAddController);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          // automaticallyImplyLeading: false,
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  ref.invalidate(addStateNotifierProvider);
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          title:
          Text((){
            switch (argument.from){
              case AddScreenFrom.category : return "Add Category";
              case AddScreenFrom.product : return "Add Product";
              case AddScreenFrom.batch : return "Add Batch";
              default : return "Add";
            }
          }(), style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontFamily: 'sans-serif-condensed-medium',
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Consumer(
          builder: (context, ref, child) {
            final AddState addState = ref.watch(addStateNotifierProvider);

            if(addState is AddLoading){
              print("AddScreen in Loading State");
            }else if(addState is AddLoaded){
              print("AddScreen in Loaded State");
              Navigator.pop(context);
              ref.invalidate(addStateNotifierProvider);
            }else if(addState is AddError){
              print("AddScreen in Error State");
            }else if(addState is AddInit){
              print("AddScreen in Init State");
              return Container(
                padding: const EdgeInsets.only(right: 16, left: 16, top: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        prefixIcon: const Icon(Icons.drive_file_rename_outline),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {},
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x17004B7A),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF004B7A),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 16),
                    Visibility(
                      visible: argument.from == AddScreenFrom.batch,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Quantity',
                          prefixIcon: const Icon(Icons.add_shopping_cart),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {},
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x17004B7A),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF004B7A),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly,
                        // ],
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 90.0,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 20, top: 50, end: 20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)))),
                          onPressed: () {
                            handleAdd();
                            if(argument.from == AddScreenFrom.category){
                              print('From = Category');
                              ref.watch(addStateNotifierProvider.notifier).addCategory(ref: ref,title: titleController.text);
                            }else if (argument.from == AddScreenFrom.product){
                              print('From = Product');
                              ref.watch(addStateNotifierProvider.notifier).addProduct(ref: ref,title: titleController.text,categoryId: argument.categoryId);
                            }else if (argument.from == AddScreenFrom.batch){
                              print('From = Batch');
                              ref.watch(addStateNotifierProvider.notifier).addBatch(ref: ref,title: titleController.text,quantity: quantityController.text,productId: argument.productId);
                            }
                          },
                          child:  Text((){
                            switch (argument.from){
                              case AddScreenFrom.category : return "Add Category";
                              case AddScreenFrom.product : return "Add Product";
                              case AddScreenFrom.batch : return "Add Batch";
                              default : return "Add";
                            }
                          }()
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  void handleAdd(){
    Consumer(builder: (context, ref, child) {
      final AddState addState = ref.watch(addStateNotifierProvider);

      if(addState is AddLoading){
        return Container();
      }else if(addState is AddLoaded){
        print("Add Loaded Screen = ${addState.data.toString()}");
        Navigator.pop(context);
      }else if(addState is AddError){
        print("Add Loaded Screen = ${addState.data.toString()}");
      }
      return Container();
    },);
  }
}
