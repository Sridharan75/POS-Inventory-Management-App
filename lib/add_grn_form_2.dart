import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'create_customer.dart';

class AddGRNSecondPage extends StatefulWidget {
  const AddGRNSecondPage({Key? key}) : super(key: key);

  @override
  State<AddGRNSecondPage> createState() => _AddGRNSecondPageState();
}

class _AddGRNSecondPageState extends State<AddGRNSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New GRN'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.person_add_alt_1,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateCustomer()),
            );},
          )
        ],
      ),
      body: const AddGRNFormSecondPage(),
    );
  }
}

class AddGRNFormSecondPage extends StatefulWidget {
  const AddGRNFormSecondPage({Key? key}) : super(key: key);

  @override
  AddGRNFormSecondPageState createState() {
    return AddGRNFormSecondPageState();
  }
}

enum PaymentOption { cash, credit }

class AddGRNFormSecondPageState extends State<AddGRNFormSecondPage> {
  final _formKey = GlobalKey<FormState>();
  String searchInput = '';
  String expenseType = 'Shipping Expense';
  bool shippingExpenseVisibility = false;
  bool warehouseExpenseVisibility = false;
  bool otherExpenseVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Invoice No'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Invoice No is required';
                  }
                  return null;
                },
              ),

              Row(
                children: [
                  SizedBox(width: 250.0,
                    child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItems: true,
                      items: const [],
                      dropdownSearchDecoration: const InputDecoration(
                      ),
                      popupItemDisabled: (String s) => s.startsWith('I'),
                      onChanged: print,
                    ),),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                ],
              ),

              const Padding(
                padding: EdgeInsets.only(left: 130.0, top: 20.0),
                child: Text(
                  "Product List",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),

              SizedBox(
                width: 350.0,
                height: 200.0,
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 150,
                          color: Colors.blue[500],
                          child: const Center(child: Text('Name')),
                        ),
                        Container(
                          height: 50,
                          width: 150,
                          color: Colors.blue[400],
                          child: const Center(child: Text('Qty')),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0,),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 150,
                          color: Colors.blue[500],
                          child: const Center(child: Text('Cost')),
                        ),
                        Container(
                          height: 50,
                          width: 150,
                          color: Colors.blue[400],
                          child: const Center(child: Text('Price')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Amount'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Amount is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              DropdownButton<String>(
                value: expenseType,
                icon: const Icon(Icons.keyboard_arrow_down),
                elevation: 16,
                underline: Container(
                  height: 2,
                ),
                onChanged: (String? newValue) {
                  if (newValue == 'Shipping Expense') {
                    shippingExpenseVisibility = true;
                    warehouseExpenseVisibility = false;
                    otherExpenseVisibility = false;
                  } else if (newValue == 'Warehouse Expense') {
                    warehouseExpenseVisibility = true;
                    shippingExpenseVisibility = false;
                    otherExpenseVisibility = false;
                  } else if (newValue == 'Other Expense') {
                    otherExpenseVisibility = true;
                    shippingExpenseVisibility = false;
                    warehouseExpenseVisibility = false;
                  } else {
                    shippingExpenseVisibility = false;
                    warehouseExpenseVisibility = false;
                    otherExpenseVisibility = false;
                  }
                  setState(() {
                    expenseType = newValue!;
                  });
                },
                items: <String>[
                  'Shipping Expense',
                  'Warehouse Expense',
                  'Other Expense'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Column(
                children: <Widget>[
                  Visibility(
                    visible: shippingExpenseVisibility,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Shipping Expense',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Shipping Expense Amount is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Visibility(
                    visible: warehouseExpenseVisibility,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Warehouse Expense',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Warehouse Expense Amount is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Visibility(
                    visible: otherExpenseVisibility,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Other Expense',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Other Expense Amount is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Total Amount'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Total Amount is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 140, top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

