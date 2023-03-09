import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 56,
      //   titleSpacing: 0,
      //   backgroundColor: const Color(0xFF7540EE),
      //   elevation: 0,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       IconButton(
      //         icon: const Icon(
      //           Icons.arrow_back,
      //           color: Colors.black,
      //         ),
      //         onPressed: () {
      //         },
      //       ),
      //       const SizedBox(width: 16),
      //       const Text(
      //         'Add',
      //         style: TextStyle(
      //           fontSize: 25,
      //           color: Colors.white,
      //           fontFamily: 'sans-serif-condensed-medium',
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
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
          title: const Text(
            'Add',
            style: TextStyle(
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
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)))),
                    onPressed: () {},
                    child: const Text('Add Screen'),
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
