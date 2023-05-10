import 'package:flutter/material.dart';

import '../constants/styles.dart';

void customShowDialog(BuildContext context, String message,
    [Widget? widgetOnTop, Widget? widgetOnButtom]) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.center,
          insetPadding: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: MediaQuery.of(context).size.height / 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widgetOnTop != null)
                Column(
                  children: [
                    widgetOnTop,
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              Text(
                message,
                style: Styles.titleStyle,
              ),
              if (widgetOnButtom != null)
                Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    widgetOnButtom,
                  ],
                ),
            ],
          ),
        );
      });
}
