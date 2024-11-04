import 'package:flutter/material.dart';
import 'adminservice.dart';
class UserLogs extends StatefulWidget {
  @override
  _UserLogsState createState() => _UserLogsState();
}

class _UserLogsState extends State<UserLogs> {
  final AdminService _adminService = AdminService();
  List<Map<String, dynamic>> _logs = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserLogs();
  }

 Future<void> _fetchUserLogs() async {
    _logs = await _adminService.fetchUserLogs();  // Call the service function to fetch logs
    setState(() {
      _isLoading = false;
    });
  }

 
  TableRow _buildTableRow(Map<String, dynamic> log) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(log['username'] ?? 'Unknown'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_adminService.formatDateTime(log['login_time'] ?? 'N/A')),  // Use service to format login time
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_adminService.formatDateTime(log['logout_time'] ?? 'N/A')),  // Use service to format logout time
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Activity Logs'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Table(
                    border: TableBorder.all(color: const Color.fromARGB(255, 218, 218, 218)),
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade50,
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Username',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Login Time',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Logout Time',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      ..._logs.map(_buildTableRow).toList(),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
