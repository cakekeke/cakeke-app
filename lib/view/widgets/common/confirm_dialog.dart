import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.confirmText,
    required this.leftButtonText,
    required this.rightButtonText,
    required this.onLeftButtonPressed,
    required this.onRightButtonPressed,
  });

  final String confirmText;
  final String leftButtonText;
  final String rightButtonText;
  final VoidCallback onLeftButtonPressed;
  final VoidCallback onRightButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 345,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    confirmText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          onLeftButtonPressed();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xffF3F3F3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            leftButtonText,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )),
                      const SizedBox(width: 20),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            onRightButtonPressed();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 44,
                            decoration: BoxDecoration(
                              color: DesignSystem.colors.appPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              rightButtonText,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
