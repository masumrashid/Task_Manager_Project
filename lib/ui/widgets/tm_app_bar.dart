
import 'package:flutter/material.dart';

class TMAppbar extends StatelessWidget implements PreferredSize{
  const TMAppbar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: Colors.green,
      title: Row(
        children: [
          CircleAvatar(
            radius: 16,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Masum Rashid',
                    style: textTheme.bodyLarge?.copyWith(color: Colors.white)),
                Text(
                  'Email',
                  style: textTheme.bodySmall?.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout),color: Colors.white,)
        ],
      ),
    );
  }


  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
