import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import '../widgets/summary_card.dart';
import '../widgets/task_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSummaryScetion(),
          Expanded(
            child: ListView.separated(
              itemCount: 6,
              // primary: false,
              // shrinkWrap: true,
              itemBuilder: (context, index) {
                return TaskCard(
                  text: 'New',
                  color: Colors.blue,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNewTask()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildSummaryScetion() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            SummaryCard(
              title: 'New',
              count: 12,
            ),
            SummaryCard(
              title: 'Progress',
              count: 10,
            ),
            SummaryCard(
              title: 'Complete',
              count: 20,
            ),
            SummaryCard(
              title: 'Canceled',
              count: 12,
            ),
          ],
        ),
      ),
    );
  }
}
