import 'package:flutter/material.dart';
import 'fire_truck_movemet_page.dart';
import 'home_page.dart';


class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  ActivityPageState createState() => ActivityPageState();
}

class ActivityPageState extends State<ActivityPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Sample data for reports
    final reports = [
      {
        'title': 'Fire at Main Street',
        'status': 'Resolved',
        'date': '2024-08-15',
        'description': 'A fire reported at Main Street was resolved by the fire department.',
        'fireTruckNumber': '1234'
      },
      {
        'title': 'Electrical Issue at Elm Street',
        'status': 'In Progress',
        'date': '2024-08-13',
        'description': 'Electrical issues reported at Elm Street. Fire department is currently investigating.',
        'fireTruckNumber': '5678'
      },
      {
        'title': 'Fireworks Accident at High School',
        'status': 'Resolved',
        'date': '2024-08-12',
        'description': 'An accident due to fireworks was reported at the high school. Situation is under control.',
        'fireTruckNumber': '91011'
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Activity Reports',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
         );
        },
      ),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), // Custom height for the TabBar
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.white, // Text color for selected tab
            unselectedLabelColor: const Color.fromARGB(255, 255, 249, 249), // Text color for unselected tabs
            indicator: BoxDecoration(
              color: Colors.red, // Background color for selected tab
              borderRadius: BorderRadius.circular(5),
            ),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                alignment: Alignment.center,
                child: const Tab(text: 'Ongoing'),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                alignment: Alignment.center,
                child: const Tab(text: 'Completed'),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildReportList(reports.where((report) => report['status'] != 'Resolved').toList()),
          _buildReportList(reports.where((report) => report['status'] == 'Resolved').toList()),
        ],
      ),
      
    );
  }

  Widget _buildReportList(List<Map<String, String>> reports) {
    if (reports.isEmpty) {
      return const Center(
        child: Text('No report yet.'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: reports.length,
      itemBuilder: (context, index) {
        final report = reports[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FireTruckMovementPage(
                  reportTitle: report['title']!,
                  fireTruckNumber: report['fireTruckNumber']!, // Pass the fire truck number here
                ),
              ),
            );
          },
          child: Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    report['title']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Status: ${report['status']}',
                    style: TextStyle(
                      fontSize: 16,
                      color: _getStatusColor(report['status']!),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Date: ${report['date']}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    report['description']!,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Resolved':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'In Progress':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }
}