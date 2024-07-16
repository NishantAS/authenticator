import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyToClipboardButton extends StatelessWidget {
  const CopyToClipboardButton({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 2,
              offset: Offset(2, 2),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: RawMaterialButton(
          onPressed: text == null
              ? null
              : () async {
                  await Clipboard.setData(
                    ClipboardData(
                      text: text!,
                    ),
                  );
                  if (context.mounted) {
                    await ScaffoldMessenger.of(context)
                        .showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Copied to clipboard",
                            ),
                          ),
                        )
                        .closed;
                  }
                },
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(Icons.copy, size: 14),
          ),
        ),
      ),
    );
  }
}
