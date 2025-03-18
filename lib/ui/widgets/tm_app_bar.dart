import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';

class TMAppbar extends StatelessWidget implements PreferredSize {
  const TMAppbar({
    super.key,
    this.formUpdateProfileScreen,
  });

  final bool? formUpdateProfileScreen;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: () {
          if (formUpdateProfileScreen ?? false) {
            return;
          }
          _onTapProfileUpdate(context);
        },
        child: Row(
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
                      style:
                          textTheme.bodyLarge?.copyWith(color: Colors.white)),
                  Text(
                    'Email',
                    style: textTheme.bodySmall?.copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  void _onTapProfileUpdate(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => UpdateProfileScreen()));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
