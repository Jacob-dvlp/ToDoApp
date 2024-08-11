import 'package:flutter/material.dart';
import 'package:todo_app/src/presentation/home/details/details.dart';
import 'package:todo_app/src/presentation/routes/app_routes.dart';

import '../../../utils/app_theme.dart';
import '../../shared/controller/task_cubit.dart';

class CustomCardWidget extends StatelessWidget {
  final TaskLoadedState taskState;
  const CustomCardWidget({super.key, required this.taskState});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.0,
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 3,
      ),
      itemCount: taskState.task!.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => AppRoutes.go(
                context: context,
                page: const Details(),
              ),
              child: Card(
                elevation: 10,
                child: SizedBox(
                  height: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Jacob"),
                            CircleAvatar(
                              backgroundColor: primaryColor,
                              child: const Icon(
                                Icons.bookmark_border,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
