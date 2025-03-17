import 'package:flutter/material.dart';
import '../widgets/task_card.dart';

class CanceledTaskScreen extends StatefulWidget {
  const CanceledTaskScreen({super.key});

  @override
  State<CanceledTaskScreen> createState() => _CanceledTaskScreenState();
}

class _CanceledTaskScreenState extends State<CanceledTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ListView.separated(
          itemCount: 6,
          // primary: false,
          // shrinkWrap: true,
          itemBuilder: (context, index) {
            return  TaskCard(text: 'Canceled', color: Colors.red);
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
        ),
      ),
    );
  }
}
