import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:async';
import 'adminservice.dart';

class Usage extends StatefulWidget {
  @override
  _UsageState createState() => _UsageState();
}

class _UsageState extends State<Usage> {
  // final SupabaseClient _supabaseClient = Supabase.instance.client;
  Map<String, int> _usageData = {};
final AdminService _adminService = AdminService();

  @override
  void initState() {
    super.initState();
    _fetchUsageData();
  }

  Future<void> _fetchUsageData() async {
    _usageData = await _adminService.fetchUsageData(); // Call the service function to get usage data
    setState(() {}); // Refresh the UI
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Usage Statistics')),
    body: Column(
      children: [
        Text(
          'Usage Statistics for ${DateTime.now().toLocal().toString().split(' ')[0]}', // Display today's date
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: _buildBarChart(), // Build the bar chart even if there's no data
        ),
      ],
    ),
  );
}

Widget _buildBarChart() {
  if (_usageData.isEmpty) {
    // If there's no data, create a default bar chart with zero values
    return Center(
      child: Text(
        'No data available for today.',
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  } else {
    // Create the bar chart with available data
    List<BarChartGroupData> barGroups = _usageData.entries.map((entry) {
      int index = _usageData.keys.toList().indexOf(entry.key);
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: entry.value.toDouble(),
            color: Colors.blueAccent,
            width: 50,
            borderRadius: BorderRadius.zero,
            backDrawRodData: BackgroundBarChartRodData(
              show: false,
            ),
          ),
        ],
      );
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 38,
                getTitlesWidget: (value, meta) {
                  final userLabel = 'User ${value.toInt() + 1}'; // Generic labels
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      userLabel,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          barGroups: barGroups,
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: true, verticalInterval: 1, horizontalInterval: 1),
          maxY: _usageData.values.isNotEmpty ? _usageData.values.reduce((a, b) => a > b ? a : b).toDouble() : 1,
        ),
      ),
    );
  }
}
}
