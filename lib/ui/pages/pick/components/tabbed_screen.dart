import 'package:business_app/core/providers/pick_provider.dart';
import 'package:business_app/ui/pages/pick/components/table_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class TabbedScreens extends StatefulWidget {
  const TabbedScreens({super.key});

  @override
  State<TabbedScreens> createState() => _TabbedScreensState();
}

class _TabbedScreensState extends State<TabbedScreens>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.black,
            controller: _tabController,
            tabs: const [
              Tab(
                icon: Icon(Icons.directions_car),
                text: 'Header',
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
                text: 'Lines',
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
                text: 'Pick List',
              ),
            ],
          ),
          Expanded(
            child: Consumer<PickProvider>(
              builder: (context, value, child) {
                if (value.uniquePickListLines == null) {
                  return const Placeholder();
                } else {
                  return TabBarView(
                    controller: _tabController,
                    children: [
                      TableDetailView(
                          pickListLines: value.uniquePickListLines, tableType: _tabController.index),
                      TableDetailView(
                          pickListLines: value.uniquePickListLines, tableType: _tabController.index),
                      TableDetailView(
                          pickListLines: value.uniquePickListLines, tableType: _tabController.index),
                    ],
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
