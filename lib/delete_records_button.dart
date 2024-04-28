import 'package:driving_buddy/main.dart';
import 'package:flutter/material.dart';

class DeleteRecordsButton extends StatelessWidget {
  final BuildContext pageContext;

  const DeleteRecordsButton({
    super.key,
    required this.pageContext,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Wrap(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.insights),
                    title: const Text('Driving Log'),
                    onTap: () async {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirm Delete'),
                            content: const Text(
                                'Are you sure you want to delete all driving log entries? This action is not reversible.'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              TextButton(
                                child: const Text('Delete'),
                                onPressed: () async {
                                  Navigator.pop(context);
                                  await db.delete(db.drivingLog).go();
                                  if (!pageContext.mounted) return;
                                  Navigator.pop(pageContext);
                                  DefaultTabController.of(pageContext)
                                      .animateTo(1);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.event),
                    title: const Text('Gas Log'),
                    onTap: () async {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirm Delete'),
                            content: const Text(
                                'Are you sure you want to delete all gas log entries? This action is not reversible.'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              TextButton(
                                child: const Text('Delete'),
                                onPressed: () async {
                                  Navigator.pop(context);
                                  await db.delete(db.gasLog).go();
                                  if (!pageContext.mounted) return;
                                  Navigator.pop(pageContext);
                                  DefaultTabController.of(pageContext)
                                      .animateTo(0);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
        icon: const Icon(Icons.delete),
        label: const Text('Delete records'));
  }
}
