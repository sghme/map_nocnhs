import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CRAddForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function(Map<String, String>) onAddCR;
  final VoidCallback onCancel;

  const CRAddForm({
    Key? key,
    required this.formKey,
    required this.onAddCR,
    required this.onCancel,
  }) : super(key: key);

  @override
  _CRAddFormState createState() => _CRAddFormState();
}

class _CRAddFormState extends State<CRAddForm> {
  List<Map<String, dynamic>> _buildings = [];
  late SupabaseClient _supabaseClient;
  String? _facilityName;
  int? _floorNo, _buildingId;

  @override
  void initState() {
    super.initState();
    _supabaseClient = Supabase.instance.client;
    _fetchDropdownData();
  }

  Future<void> _fetchDropdownData() async {
    final buildingsResponse = await _supabaseClient
        .from('buildings')
        .select();

    if (buildingsResponse != null) {
      setState(() {
        _buildings = (buildingsResponse as List)
            .map((item) => {'id': item['id'], 'name': item['building_name']})
            .toList();
      });
    } else {
      // Handle errors here
      print(buildingsResponse);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400.0,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add New CR Info',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Form(
              key: widget.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 5),
                  if (_buildings.isNotEmpty)
                    _buildDropdownFormField(
                      'Building:',
                      _buildings,
                      (value) {
                        _buildingId = value;
                      },
                    ),
                   SizedBox(height: 5),
                  _buildFormField('Facility Name:', (value) {
                    _facilityName = value;
                  }, (value) {
                    return value!.isEmpty ? 'Please enter the facility name' : null;
                  }),
                  SizedBox(height: 5),
                  _buildFormField('Floor No.:', (value) {
                    _floorNo = int.tryParse(value ?? '');
                  }, (value) {
                    return value!.isEmpty ? 'Please enter the floor number' : null;
                  }),
                  // SizedBox(height: 5),
                  // _buildFormField('No. of CRs:', (value) {
                  //   _noOfCRs = int.tryParse(value ?? '');
                  // }, (value) {
                  //   return value!.isEmpty ? 'Please enter the number of CRs' : null;
                  // }),
                  
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (widget.formKey.currentState!.validate()) {
                            widget.formKey.currentState!.save();
                            widget.onAddCR({
                              'facility_name': _facilityName!,
                              'floor_no': _floorNo.toString(),
                              // 'no_of_crs': _noOfCRs.toString(),
                              'building_id': _buildingId.toString(),
                            });
                            widget.onCancel();
                          }
                        },
                        child: Text('Add CR'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          minimumSize: Size(80, 36),
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: widget.onCancel,
                        child: Text('Cancel'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          minimumSize: Size(80, 36),
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Form Fields
  Widget _buildFormField(
    String labelText,
    void Function(String?)? onSaved,
    String? Function(String?)? validator, {
    bool obscureText = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.0,
          child: Text(
            labelText,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            ),
            obscureText: obscureText,
            onSaved: onSaved,
            validator: validator,
          ),
        ),
      ],
    );
  }

  // Helper Widget for Dropdown Fields
  Widget _buildDropdownFormField(
    String labelText,
    List<Map<String, dynamic>> options,
    void Function(int?)? onSaved,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.0,
          child: Text(
            labelText,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: DropdownButtonFormField<int>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            ),
            items: options.map((option) {
              return DropdownMenuItem<int>(
                value: option['id'],
                child: Text(option['name'].toString()),
              );
            }).toList(),
            onChanged: (value) {},
            onSaved: onSaved,
            validator: (value) {
              return value == null ? 'Please select an option' : null;
            },
          ),
        ),
      ],
    );
  }
}
