import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/on_generate_route.dart';
import 'package:stoke/screens/add/add_controller.dart';


class AddScreen extends ConsumerWidget {

  const AddScreen({Key? key,required this.argument}) : super(key: key);

  final String? argument;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    // final routes =
    // ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    print(argument);
    final addCategoryProd = ref.watch(categoryAddController);
    final addProductProd = ref.watch(productAddController);
    final addBatchProd = ref.watch(batchAddController);

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
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          title: Text(
            argument!,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontFamily: 'sans-serif-condensed-medium',
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
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
              TextFormField(
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
                    onPressed: () {},
                    child: Text(argument!),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
