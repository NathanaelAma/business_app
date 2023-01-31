import 'package:business_app/core/models/picklist/picklist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeaderCard extends StatelessWidget {
  final PickList pickList;
  const HeaderCard({super.key, required this.pickList});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Pick List: '),
                Text(pickList.absEntry.toString()),
              ],
            ),
            Row(
              children: [
                const Text('Picker: '),
                Text(pickList.pickerName),
              ],
            ),
            Row(
              children: [
                const Text('Owner: '),
                Text(pickList.owner),
              ],
            ),
            Row(
              children: [
                const Text('Pick Date: '),
                Text(pickList.pickDate.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}