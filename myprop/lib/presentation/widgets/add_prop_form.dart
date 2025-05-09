import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myprop/core/usecases/usecase.dart';
import 'package:myprop/presentation/bloc/item/item_bloc.dart';
import 'package:myprop/presentation/bloc/item/item_event.dart';

class AddPropForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const AddPropForm({super.key, required this.formKey});

  @override
  State<AddPropForm> createState() => _AddPropFormState();
}

class _AddPropFormState extends State<AddPropForm> {
  final formBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.5),
    borderSide: BorderSide(color: Colors.transparent),
  );
  final _ownerController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _groupNameController = TextEditingController();
  final _propNoController = TextEditingController();
  final _currentEController = TextEditingController();
  final _currentWController = TextEditingController();
  @override
  void dispose() {
    _ownerController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _groupNameController.dispose();
    _propNoController.dispose();
    _currentEController.dispose();
    _currentWController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children:
            [
                  TextFormField(
                    controller: _ownerController,
                    decoration: InputDecoration(
                      enabledBorder: formBorder,
                      focusedBorder: formBorder,
                      prefixIcon: Icon(Icons.person, color: Colors.blue),
                      hintText: 'owner\'s name',
                      hintStyle: TextStyle(color: Colors.blue),
                      filled: true,
                      fillColor: Colors.blue[50],
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: formBorder,
                      focusedBorder: formBorder,
                      prefixIcon: Icon(Icons.email, color: Colors.blue),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.blue),
                      filled: true,
                      fillColor: Colors.blue[50],
                    ),
                  ),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      enabledBorder: formBorder,
                      focusedBorder: formBorder,
                      prefixIcon: Icon(Icons.home, color: Colors.blue),
                      hintText: 'address',
                      hintStyle: TextStyle(color: Colors.blue),
                      filled: true,
                      fillColor: Colors.blue[50],
                    ),
                  ),
                  TextFormField(
                    controller: _groupNameController,
                    decoration: InputDecoration(
                      enabledBorder: formBorder,
                      focusedBorder: formBorder,
                      prefixIcon: Icon(Icons.villa, color: Colors.blue),
                      hintText: 'Villa / Condo name',
                      hintStyle: TextStyle(color: Colors.blue),
                      filled: true,
                      fillColor: Colors.blue[50],
                    ),
                  ),
                  TextFormField(
                    controller: _propNoController,
                    decoration: InputDecoration(
                      enabledBorder: formBorder,
                      focusedBorder: formBorder,
                      prefixIcon: Icon(Icons.numbers, color: Colors.blue),
                      hintText: 'property no.',
                      hintStyle: TextStyle(color: Colors.blue),
                      filled: true,
                      fillColor: Colors.blue[50],
                    ),
                  ),
                  TextFormField(
                    controller: _currentEController,
                    decoration: InputDecoration(
                      enabledBorder: formBorder,
                      focusedBorder: formBorder,
                      prefixIcon: Icon(Icons.electric_bolt, color: Colors.blue),
                      hintText: 'Electricity meter',
                      hintStyle: TextStyle(color: Colors.blue),
                      filled: true,
                      fillColor: Colors.blue[50],
                    ),
                  ),
                  TextFormField(
                    controller: _currentWController,
                    decoration: InputDecoration(
                      enabledBorder: formBorder,
                      focusedBorder: formBorder,
                      prefixIcon: Icon(Icons.water, color: Colors.blue),
                      hintText: 'Water meter',
                      hintStyle: TextStyle(color: Colors.blue),
                      filled: true,
                      fillColor: Colors.blue[50],
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.green, fontSize: 18),
                    ),
                    onPressed: () {
                      final params = AddItemParams(
                        owner: _ownerController.text,
                        email: _emailController.text,
                        address: _addressController.text,
                        groupName: _groupNameController.text,
                        propNo: int.parse(_propNoController.text),
                        currentE: int.parse(_currentEController.text),
                        currentW: int.parse(_currentWController.text),
                      );
                      context.read<ItemBloc>().add(AddItemEvent(params));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Property added successfully')),
                      );
                      Navigator.pop(context);
                    },
                  ),
                ]
                .map(
                  (field) =>
                      Padding(padding: EdgeInsets.only(top: 8), child: field),
                )
                .toList(),
      ),
    );
  }
}
