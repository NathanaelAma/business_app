import 'package:business_app/core/providers/auth_provider.dart';
import 'package:business_app/ui/components/drawer_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    
    return  Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(onPressed: ()async{
            
            await auth.logOutUser();
            Navigator.popAndPushNamed(context, '/login');
          }, icon: const Icon(Icons.logout),tooltip: "Logout",)
        ],
      ),
      body:  Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Text(auth.currentCompany!.companyName),
      ),
    );
  }
}
