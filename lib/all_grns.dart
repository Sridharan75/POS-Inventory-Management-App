import 'package:flutter/material.dart';
import 'add_grn_form.dart';

class AllGRNs extends StatefulWidget {
  const AllGRNs({Key? key}) : super(key: key);

  @override
  State<AllGRNs> createState() => _AllGRNsState();
}

class _AllGRNsState extends State<AllGRNs> {
  String date = "";
  String timeFilter = 'All';
  String categoryFilter = 'All';
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GRN'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddGRN()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 300),
              child: DropdownButton<String>(
                value: timeFilter,
                icon: const Icon(Icons.keyboard_arrow_down),
                elevation: 16,
                underline: Container(
                  height: 2,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    timeFilter = newValue!;
                  });
                },
                items: <String>['All', 'Today', 'This Week', 'This Month']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Row(
              children: [
                const Text("From"),
                IconButton(
                  icon: const Icon(
                    Icons.calendar_today_sharp,
                    color: Colors.blueGrey,
                  ),
                  onPressed: () {
                    _fromDate(context);
                  },
                ),
                Text("${fromDate.day}/${fromDate.month}/${fromDate.year}"),
                const SizedBox(
                  width: 120.0,
                ),
                const Text("To"),
                IconButton(
                  icon: const Icon(
                    Icons.calendar_today_sharp,
                    color: Colors.blueGrey,
                  ),
                  onPressed: () {
                    _toDate(context);
                  },
                ),
                Text("${toDate.day}/${toDate.month}/${toDate.year}"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 300),
              child: DropdownButton<String>(
                value: categoryFilter,
                icon: const Icon(Icons.keyboard_arrow_down),
                elevation: 16,
                underline: Container(
                  height: 2,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    categoryFilter = newValue!;
                  });
                },
                items: <String>['All', 'Supplier', 'Total', 'BillNo', 'Date']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text('Supplier1'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text('Total Amount - 10,000'),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text('BillNo - A31'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text('Date - 21/04/2022'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _fromDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: fromDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != fromDate) {
      setState(() {
        fromDate = selected;
      });
    }
  }

  _toDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: toDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != toDate) {
      setState(() {
        toDate = selected;
      });
    }
  }
}
