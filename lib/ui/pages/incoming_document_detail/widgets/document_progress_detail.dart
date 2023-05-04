import 'package:flutter/material.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/ui/pages/incoming_document_detail/widgets/stepper_widget.dart';

import '../../../../constants/export_constants.dart';
import '../../../common_widgets/elevated_button.dart';

class DocumentProgressDetail extends StatefulWidget {
  const DocumentProgressDetail({Key? key, required this.incomingDocument})
      : super(key: key);
  final IncomingDocument incomingDocument;

  @override
  State<DocumentProgressDetail> createState() => _DocumentProgressDetailState();
}

class _DocumentProgressDetailState extends State<DocumentProgressDetail> {
  bool _isExpanded = false;
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(StyleConst.defaultRadius15)),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Padding(
          padding: const EdgeInsets.all(StyleConst.defaultPadding4),
          child: Text(
            "Thông tin luân chuyển",
            style: bodyLargeBold(context)?.copyWith(fontSize: 18,
                color: _isExpanded ? Colors.black : Colors.black),
          ),
        ),
        trailing: AnimatedRotation(
            turns: _isExpanded ? .5 : 0,
            duration: const Duration(milliseconds: 300),
            child: const Icon(Icons.keyboard_arrow_down_sharp)),
        onExpansionChanged: (value) {
          setState(() {
            _isExpanded = value;
          });
        },
        children: [
          const Divider(
            thickness: 1,
            height: 1,
            indent: StyleConst.defaultPadding16,
            endIndent: StyleConst.defaultPadding16
          ),
          Padding(
            padding: const EdgeInsets.all(StyleConst.defaultPadding16),
            child: Column(
              children: [
                Stepper(
                  currentStep: _index,
                  onStepCancel: () {
                    if (_index > 0) {
                      setState(() {
                        _index -= 1;
                      });
                    }
                  },
                  onStepContinue: () {
                    if (_index <= 1) {
                      setState(() {
                        _index += 1;
                      });
                    } else {
                      setState(() {
                        _index -= 1;
                      });
                    }
                  },
                  controlsBuilder: (BuildContext context, ControlsDetails details) {
                    final isLastStep = _index == 2;
                    return Container(
                        margin: const EdgeInsets.fromLTRB(0, 24, 0, 12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ConstrainedBox(
                                constraints: const BoxConstraints(minWidth: 120),
                                child: CustomElevatedButton(
                                  callback: details.onStepContinue ?? () {},
                                  title: isLastStep ? 'Return' : 'Next',
                                  radius: 15,
                                  buttonType: ButtonType.filledButton,
                                ),
                              ),
                              if (_index == 1)
                                const SizedBox(
                                  width: 24,
                                ),
                              if (_index == 1)
                                ConstrainedBox(
                                  constraints: const BoxConstraints(minWidth: 120),
                                  child: CustomElevatedButton(
                                    callback: details.onStepCancel ?? () {},
                                    title: 'Back',
                                    radius: 15,
                                    buttonType: ButtonType.filledWhiteButton,
                                  ),
                                ),
                            ]));
                  },
                  steps: <Step>[
                    Step(
                        state: _index > 2 ? StepState.complete : StepState.indexed,
                        title: const Text('Step 1: Complete your profile'),
                        content: const StepperWidget(),
                        isActive: _index >= 0),
                    Step(
                        state: _index > 2 ? StepState.complete : StepState.indexed,
                        title: const Text('Step 2: Video introduction'),
                        content: const StepperWidget(),
                        isActive: _index >= 1),
                    Step(
                        title: const Text('Step 3: Approval'),
                        content: const StepperWidget(),
                        isActive: _index >= 2),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
