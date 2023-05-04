import 'package:flutter/material.dart';
import 'package:flutter_app/constants/export_constants.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 24),
        ),
        const SizedBox(height: 16),
        Text(
          "Thank you for joining LetTutor team. Please kindly wait for our approval process. The final result "
              "shall be sent through your email.",
          style: bodyLarge(context)?.copyWith(
              height: ConstValue.courseNameTextScale, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
//https://educity.app/flutter/how-to-pick-an-image-from-gallery-and-display-it-in-flutter
