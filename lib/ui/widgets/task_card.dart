import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  String text;
  Color ? color;
   TaskCard({
    super.key,
     required this.text,
     required this.color,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title will be here',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text('Description Title will be here'),
            Text('Date: 18/03/25'),
            Row(
              children: [
                Chip(
                  label: Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: color,
                  side: BorderSide.none,
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete,color: Colors.red,)),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit,color: Colors.blue,)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
