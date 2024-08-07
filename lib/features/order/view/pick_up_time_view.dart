import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PickUpTimeView extends StatelessWidget {
  const PickUpTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Time"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("TODAY"),
            const Text("Thursday, March 1, 2024"),
            const SizedBox(height: 12.0),
            FormBuilder(
              child: FormBuilderChoiceChip(
                spacing: 24.0,
                name: "time",
                options: const [
                  FormBuilderChipOption(
                    value: "10:00",
                    child: Column(
                      children: [
                        Text("ASAP"),
                        Text("5 - 10 mins"),
                      ],
                    ),
                  ),
                  FormBuilderChipOption(
                    value: "10:30",
                    child: Text("10:30 AM"),
                  ),
                  FormBuilderChipOption(
                    value: "11:00",
                    child: Text("11:00"),
                  ),
                  FormBuilderChipOption(
                    value: "11:30",
                    child: Text("11:30"),
                  ),
                  FormBuilderChipOption(
                    value: "12:00",
                    child: Text("12:00"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
