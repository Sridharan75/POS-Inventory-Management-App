import 'package:country_picker/country_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CreateCustomer extends StatefulWidget {
  const CreateCustomer({Key? key}) : super(key: key);

  @override
  State<CreateCustomer> createState() => _CreateCustomerState();
}

class _CreateCustomerState extends State<CreateCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Customer'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.save), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.person),
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.email),
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Phone",
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Address",
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.difference),
              title: TextField(
                decoration: InputDecoration(
                  hintText: "*City",
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.difference),
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Region",
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.difference),
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Postal code",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showCountryPicker(
                  context: context,
                  //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                  exclude: <String>['KN', 'MF'],
                  //Optional. Shows phone code before the country name.
                  showPhoneCode: false,
                  showWorldWide: false,
                  onSelect: (Country country) {
                    print('Select country: ${country.displayName}');
                  },
                  // Optional. Sets the theme for the country list picker.
                  countryListTheme: CountryListThemeData(
                    // Optional. Sets the border radius for the bottomsheet.
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    // Optional. Styles the search field.
                    inputDecoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Start typing to search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xFF8C98A8).withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Text('Contry'),
            ),
            const ListTile(
              leading: Icon(Icons.qr_code_scanner_rounded),
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Customer code",
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.message),
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Note",
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Add"))
          ],
        ),
      ),
    );
  }
}
