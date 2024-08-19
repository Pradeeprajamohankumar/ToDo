import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback? deleteFunction; // Changed to VoidCallback

  const ToDoTile({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
    this.deleteFunction, // Made optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                if (deleteFunction != null) {
                  deleteFunction!();
                } else {
                  // Optionally show a message if deleteFunction is not provided
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Delete function is not provided.'),
                    ),
                  );
                }
              },
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: const Color(0xFF50586C),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Theme.of(context).colorScheme.secondary,
                // Added an accessibility label for the checkbox
                semanticLabel: taskCompleted
                    ? 'Task completed: $taskName'
                    : 'Task not completed: $taskName',
              ),

              // Task name
              Expanded(
                child: Text(
                  taskName,
                  style: TextStyle(
                    color: const Color(0xFFDCE2F0),
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
