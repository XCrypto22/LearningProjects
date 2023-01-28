import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatelessWidget {
  final String? taskTitle;
  final bool? isCompleted;
  final Function? onDelete;
  final Function? onEdit;
  final Function(bool?)? onChanged;

  const TaskTile({
    super.key,
    this.taskTitle,
    this.isCompleted,
    this.onDelete,
    this.onEdit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              onEdit!();
            },
            icon: Icons.edit,
            backgroundColor: Colors.blue.shade300,
            borderRadius: BorderRadius.circular(25),
          ),
          SlidableAction(
            onPressed: (context) {
              onDelete!();
            },
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(25),
            padding: EdgeInsets.only(left: 5),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(31, 255, 255, 255),
              offset: Offset(0, 2),
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 255, 17, 0),
              Colors.orange.withOpacity(0.5)
            ],
          ),
        ),
        child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(
                width: 2.0,
                color: Colors.transparent,
              ),
            ),
            child: ListTile(
              leading: Checkbox(
                activeColor: Colors.transparent,
                value: isCompleted,
                onChanged: onChanged,
              ),
              title: Text(
                taskTitle!,
                style: TextStyle(
                  decoration: isCompleted! ? TextDecoration.lineThrough : null,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  color: Colors.white,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert, color: Colors.orange),
                    onSelected: (String value) {
                      switch (value) {
                        case 'edit':
                          onEdit!();
                          break;
                        case 'delete':
                          onDelete!();
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
