import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myprop/presentation/widgets/add_prop_form.dart';

class AddPropPage extends StatefulWidget {
  const AddPropPage({super.key});

  @override
  State<AddPropPage> createState() => _AddPropPageState();
}

class _AddPropPageState extends State<AddPropPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a property', style: TextStyle(),),
      ),
      body: Padding(
        padding: EdgeInsets.all(11),
        child: Column(
          children: [
            AddPropForm(formKey: formKey),
          ],
        ),
      ),
    );
  }
}
