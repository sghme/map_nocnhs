import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:async';
import 'adminservice.dart';
import 'package:intl/intl.dart';

class Usage extends StatefulWidget {
  @override
  _UsageState createState() => _UsageState();
}

class _UsageState extends State<Usage> {
  Map<String, Map<String, dynamic>> _usageData = {};
  final AdminService _adminService = AdminService();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _fetchUsageData(_selectedDate); // Fetch data for today's date initially
  }

  Future<void> _fetchUsageData(DateTime date) async {
    _usageData = await _adminService.fetchUsageData(date);
    setState(() {}); // Refresh the UI with new data
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      _fetchUsageData(picked); // Fetch data for the newly selected date
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(
                  text: 'Usage Statistics for ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(
                      text: DateFormat('yyyy-MM-dd').format(_selectedDate),
                      style: TextStyle(color: Colors.blue), // Blue color for the date
                    ),
                  ],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => _selectDate(context),
              icon: Icon(Icons.calendar_today, size: 20),
              label: Text('Select Date'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.white, // Button background color
                foregroundColor: Colors.blueAccent, // Text and icon color
              ),
            ),
          ],
        ),
      ),
      body: _buildBarChart(),
    );
  }

  Widget _buildBarChart() {
    if (_usageData.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/noreport.png', // Path to your image
              height: 300, // Adjust size as needed
              width: 300, // Adjust size as needed
            ),
            Text(
              'No data available for selected date.',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      );
    } else {
      double barWidth = _usageData.length > 15 ? 10 : 40;
      List<BarChartGroupData> barGroups = _usageData.entries.map((entry) {
        int index = _usageData.keys.toList().indexOf(entry.key);
        int usage = entry.value['usage'];
        DateTime lastUsed = entry.value['timestamp'];
        String formattedTime = DateFormat('hh:mm a').format(lastUsed);

        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: usage.toDouble(),
              color: Colors.blueAccent,
              width: barWidth,
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: const Color.fromARGB(255, 92, 92, 92)),
            ),
          ],
        );
      }).toList();

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            barGroups: barGroups,
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 38,
                  getTitlesWidget: (value, meta) {
                    final userLabel = 'U${value.toInt() + 1}';
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
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: true, verticalInterval: 1, horizontalInterval: 1),
            maxY: _usageData.values.isNotEmpty
                ? _usageData.values.map((e) => e['usage']).reduce((a, b) => a > b ? a : b).toDouble()
                : 1,
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  final deviceId = _usageData.keys.toList()[groupIndex];
                  final usage = _usageData[deviceId]!['usage'];
                  final lastUsed = DateFormat('hh:mm a').format(_usageData[deviceId]!['timestamp']);

                  return BarTooltipItem(
                    'Usage: $usage\n $lastUsed',
                    TextStyle(color: Colors.white),
                  );
                },
              ),
            ),
          ),
        ),
      );
    }
  }
}
