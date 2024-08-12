import 'package:flutter/material.dart';

import '../controller/task_details_cubit.dart';

class CustomDetailsWidget extends StatelessWidget {
  final TaskDetailsLoaded state;
  final bool taskIsCompleted;
  const CustomDetailsWidget(
      {super.key, required this.state, required this.taskIsCompleted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                state.taskEntitie!.title!,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                child: Text(
                  state.taskEntitie!.description!,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Text(
            state.taskEntitie!.date!,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
