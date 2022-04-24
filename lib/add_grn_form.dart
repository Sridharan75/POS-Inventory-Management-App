import 'package:flutter/material.dart';

import 'add_grn_form_2.dart';

class AddGRN extends StatefulWidget {
  const AddGRN({Key? key}) : super(key: key);

  @override
  State<AddGRN> createState() => _AddGRNState();
}

class _AddGRNState extends State<AddGRN> {
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
            onPressed: () {},
          )
        ],
      ),
      body: const AddGRNForm(),
    );
  }
}

class AddGRNForm extends StatefulWidget {
  const AddGRNForm({Key? key}) : super(key: key);

  @override
  AddGRNFormState createState() {
    return AddGRNFormState();
  }
}

enum PaymentOption { cash, credit }

class AddGRNFormState extends State<AddGRNForm> {
  final _formKey = GlobalKey<FormState>();
  String supplier = 'Supplier -1';
  String date = "";
  DateTime addedDate = DateTime.now();
  DateTime billDate = DateTime.now();
  DateTime dueDate = DateTime.now();
  PaymentOption? _payment = PaymentOption.cash;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 10),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              SizedBox(
                child: DropdownButton<String>(
                  value: supplier,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 16,
                  underline: Container(
                    height: 2,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      supplier = newValue!;
                    });
                  },
                  items: <String>[
                    'Supplier -1',
                    'Supplier -2',
                    'Supplier -3',
                    'Supplier -4',
                    'Supplier -5'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Batch No'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Batch No is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Text("Date"),
                  IconButton(
                    icon: const Icon(
                      Icons.calendar_today_sharp,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {
                      _addedDate(context);
                    },
                  ),
                  Text("${addedDate.day}/${addedDate.month}/${addedDate.year}"),
                ],
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Bill No',
                  border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Bill No is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: 200.0,
                height: 50.0,
                child: Row(
                  children: [
                    const Text("Bill Date"),
                    IconButton(
                      icon: const Icon(
                        Icons.calendar_today_sharp,
                        color: Colors.blueGrey,
                      ),
                      onPressed: () {
                        _billDate(context);
                      },
                    ),
                    Text("${billDate.day}/${billDate.month}/${billDate.year}"),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Text("Due Date"),
                  IconButton(
                    icon: const Icon(
                      Icons.calendar_today_sharp,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {
                      _dueDate(context);
                    },
                  ),
                  Text("${dueDate.day}/${dueDate.month}/${dueDate.year}"),
                ],
              ),
              const SizedBox(height: 10.0),
              const Text("Payment"),
              Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Cash'),
                    leading: Radio<PaymentOption>(
                      value: PaymentOption.cash,
                      groupValue: _payment,
                      onChanged: (PaymentOption? value) {
                        setState(() {
                          _payment = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Credit'),
                    leading: Radio<PaymentOption>(
                      value: PaymentOption.credit,
                      groupValue: _payment,
                      onChanged: (PaymentOption? value) {
                        setState(() {
                          _payment = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                minLines: 6,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Optional',
                    labelText: 'Comments'),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddGRNSecondPage()),
                    );
                  }
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _addedDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: addedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != addedDate) {
      setState(() {
        addedDate = selected;
      });
    }
  }

  _billDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: billDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != billDate) {
      setState(() {
        billDate = selected;
      });
    }
  }

  _dueDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: dueDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != dueDate) {
      setState(() {
        dueDate = selected;
      });
    }
  }
}
