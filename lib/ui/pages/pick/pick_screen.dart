import 'package:business_app/core/providers/pick_provider.dart';
import 'package:business_app/ui/pages/pick/components/header_card.dart';
import 'package:business_app/ui/pages/pick/components/tabbed_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PickPage extends StatefulWidget {
  const PickPage({super.key});

  @override
  State<PickPage> createState() => _PickPageState();
}

class _PickPageState extends State<PickPage> {
  static final TextEditingController _textEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picklist'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Pick List #'),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _textEditingController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Pick List #',
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      Consumer<PickProvider>(
                        builder: (context, pickProvider, child) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              child: const Text('Search'),
                              onPressed: () {
                                pickProvider.getPickList(
                                    int.parse(_textEditingController.text));
                                pickProvider.getUniquePickListLines(
                                    pickId:
                                        int.parse(_textEditingController.text));
                                // print(pickProvider.getUniquePickListLines(pickList: pickProvider.pickList!));
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )
              ]),
          const SizedBox(height: 20),
          Consumer<PickProvider>(
            builder: (context, pickProvider, child) {
              return pickProvider.pickList != null
                  ? HeaderCard(pickList: pickProvider.pickList!)
                  : const Text('No Pick List');
            },
          ),
          const Expanded(child: TabbedScreens()),
        ]),
      ),
    );
  }
}
