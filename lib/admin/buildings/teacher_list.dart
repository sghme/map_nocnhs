import 'package:flutter/material.dart';
import 'service.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:csv/csv.dart';
import 'dart:convert';
import 'dart:html' as html;  // For web
import 'package:flutter/foundation.dart';  // Import for kIsWeb
import 'package:shared_preferences/shared_preferences.dart';

class TeacherList extends StatefulWidget {
  @override
  _TeacherListState createState() => _TeacherListState();
}

class _TeacherListState extends State<TeacherList> {
  final BuildingService _buildingService = BuildingService();
  List<Map<String, dynamic>> _teachers = [];
  List<Map<String, dynamic>> _filteredTeachers = [];
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchTeachers();
    _searchController.addListener(_filterTeachers);
  }

 Future<void> _fetchTeachers() async {
    setState(() {
      _isLoading = true;
    });

    _teachers = await _buildingService.fetchTeachers();
    _filteredTeachers = _teachers;

    setState(() {
      _isLoading = false;
    });
  }


  void _filterTeachers() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTeachers = _teachers.where((teacher) {
        return (teacher['teacher'] ?? '').toLowerCase().contains(query) ||
               (teacher['room_no'] ?? '').toLowerCase().contains(query) ||
               (teacher['section'] ?? '').toLowerCase().contains(query) ||
               (teacher['yearlevel'] ?? '').toLowerCase().contains(query) ||
               (teacher['program'] ?? '').toLowerCase().contains(query) ||
               (teacher['building_name'] ?? '').toLowerCase().contains(query);
      }).toList();
    });
  }


//PDF Function
Future<pw.Document> generatePdf() async {
  final pdf = pw.Document();
  final now = DateTime.now();
  final date = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

  // Get the username from SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final user = prefs.getString('username') ?? 'Unknown User';

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return [
          // pw.Text(
          //   'Advisers or Personnel List',
          //   style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
          // ),
          // pw.SizedBox(height: 20),
          pw.Table(
            border: pw.TableBorder.all(width: 1, color: PdfColors.grey),
            columnWidths: {
              0: pw.FlexColumnWidth(1),
              1: pw.FlexColumnWidth(1.2),
              2: pw.FlexColumnWidth(2),
              3: pw.FlexColumnWidth(2),
              4: pw.FlexColumnWidth(1),
              5: pw.FlexColumnWidth(1.5),
            },
            children: [
              pw.TableRow(
                decoration: pw.BoxDecoration(color: PdfColors.grey300),
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Text('Year Level', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Text('Curriculum', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Text('Name', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Text('Room Name or Section', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Text('Room No.', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Text('Building', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                ],
              ),
              ..._filteredTeachers.map((teacher) {
                return pw.TableRow(
                  decoration: pw.BoxDecoration(
                    border: pw.Border(
                      bottom: pw.BorderSide(width: 0.5, color: PdfColors.grey),
                    ),
                  ),
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(teacher['yearlevel'] ?? 'N/A'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(teacher['program'] ?? 'None'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(teacher['teacher'] ?? 'Unknown'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(teacher['section'] ?? 'N/A'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(teacher['room_no'] ?? 'N/A'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(teacher['building_name'] ?? 'N/A'),
                    ),
                  ],
                );
              }).toList(),
            ],
          ),
        ];
      },
      footer: (pw.Context context) {
        return pw.Container(
          alignment: pw.Alignment.centerRight,
          margin: const pw.EdgeInsets.only(top: 20),
          child: pw.Text(
            'Printed by: $user on $date',
            style: pw.TextStyle(fontSize: 10, color: PdfColors.grey),
          ),
        );
      },
    ),
  );

  return pdf;
}

  void printPdf() async {
    final pdf = await generatePdf();
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) => pdf.save(),
    );
  }
 // Web CSV Export Function
  void exportToCsvWeb() {
    List<List<String>> csvData = [
      ['Year Level', 'Curriculum', 'Name', 'Room Name/Section', 'Room No.', 'Building'],
      ..._filteredTeachers.map((teacher) => [
        teacher['yearlevel'] ?? 'N/A',
        teacher['program'] ?? 'None',
        teacher['teacher'] ?? 'Unknown',
        teacher['section'] ?? 'N/A',
        teacher['room_no'] ?? 'N/A',
        teacher['building_name'] ?? 'N/A',
      ]),
    ];

    String csvContent = const ListToCsvConverter().convert(csvData);
    final bytes = utf8.encode(csvContent);
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);

    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "teachers_data.csv")
      ..click();
      ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('CSV file saved')),
);

    html.Url.revokeObjectUrl(url);
  }

  // Windows CSV Export Function
//   Future<void> exportToCsvDesktop() async {
//   List<List<String>> csvData = [
//     ['Year Level', 'Curriculum', 'Name', 'Room Name/Section', 'Room No.', 'Building'],
//     ..._filteredTeachers.map((teacher) => [
//       teacher['yearlevel'] ?? 'N/A',
//       teacher['program'] ?? 'None',
//       teacher['teacher'] ?? 'Unknown',
//       teacher['section'] ?? 'N/A',
//       teacher['room_no'] ?? 'N/A',
//       teacher['building_name'] ?? 'N/A',
//     ]),
//   ];

//   String csvContent = const ListToCsvConverter().convert(csvData);

//   // Use file_selector for the save path dialog
//   final savePath = await getSavePath(suggestedName: 'teachers_data.csv');
//   if (savePath != null) {
//     final file = File(savePath);
//     await file.writeAsString(csvContent);

//     // Notify the user that the file has been saved
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('CSV file saved at $savePath')),
//     );
//   }
// }


  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }



@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Advisers or Personnel List'),
     actions: [
  Tooltip(
    message: 'Click to Print',  // Tooltip for the print button
    child: IconButton(
      icon: Icon(Icons.print),
      onPressed: printPdf, // Print the document when pressed
    ),
  ),
  Tooltip(
    message: 'Export as CSV',  // Tooltip for the CSV export button
    child: IconButton(
      icon: Icon(Icons.save_alt),
      onPressed: () {
        // Call the correct export function based on platform
        if (kIsWeb) {
          exportToCsvWeb();  // For Web
        }
        // Uncomment and use this for Windows
        // else if (Platform.isWindows) {
        //   exportToCsvDesktop();
        // }
      },
    ),
  ),
          SizedBox(width: 10),

        SizedBox(
          height: 35.0,
          width: 250.0,
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
        SizedBox(width: 10),
      ],
    ),
    body: _isLoading
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    bool isNarrowScreen = constraints.maxWidth < 600;
                    
                    return isNarrowScreen
                        ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: buildTable(isNarrowScreen),
                          )
                        : buildTable(isNarrowScreen);
                  },
                ),
                if (_filteredTeachers.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(
                        'No data available',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
              ],
            ),
          ),
  );
}

// Separate function to build the table based on screen size
Widget buildTable(bool isNarrowScreen) {
  return Table(
    border: TableBorder.all(color: const Color.fromARGB(255, 218, 218, 218)),
    columnWidths: isNarrowScreen
        ? { // Minimum width for each column on narrow screens
            0: IntrinsicColumnWidth(),
            1: IntrinsicColumnWidth(),
            2: IntrinsicColumnWidth(),
            3: IntrinsicColumnWidth(),
            4: IntrinsicColumnWidth(),
            5: IntrinsicColumnWidth(),
          }
        : const {
            0: FlexColumnWidth(0.5), 
            1: FlexColumnWidth(0.5),
            2: FlexColumnWidth(1),
            3: FlexColumnWidth(1),
            4: FlexColumnWidth(1),
            5: FlexColumnWidth(1),
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
              'Year Level',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Curriculum',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Room Name or Section',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Room No.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Building',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      ..._filteredTeachers.asMap().entries.map((entry) {
        Map<String, dynamic> teacher = entry.value;

        String teacherName = teacher['teacher'] ?? '';
        if (teacherName.isEmpty || teacherName == 'Unknown') {
          return TableRow(children: []);
        }
        return TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(teacher['yearlevel']),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(teacher['program'] ?? 'None'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(teacher['teacher']),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(teacher['section']),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(teacher['room_no']),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(teacher['building_name']),
            ),
          ],
        );
      }).toList(),
    ],
  );
}
}