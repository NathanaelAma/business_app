import 'package:business_app/ui/pages/pick/components/header_card.dart';
import 'package:flutter/material.dart';

import 'components/lines_list.dart';

class PickPage extends StatefulWidget {
  const PickPage({super.key});

  @override
  State<PickPage> createState() => _PickPageState();
}

class _PickPageState extends State<PickPage> {

  
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Text('Pick List#'),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pick List#',
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                  ElevatedButton(
                    child: const Text('Search'),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ]),
          const HeaderCard(),
          const LinesList(),
        ]),
      ),
    );
  }
}
