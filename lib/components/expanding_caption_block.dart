import 'package:flutter/material.dart';

class ExpandingCaption extends StatefulWidget {
  final String username;
  final String content;

  ExpandingCaption({super.key, required this.content, required this.username});

  // ValueNotifier<bool> expanded = ValueNotifier(false);
  final int maxLinesToShow = 1;

  @override
  State<ExpandingCaption> createState() => _ExpandingCaptionState();
}

class _ExpandingCaptionState extends State<ExpandingCaption> {
  late String firstHalf;
  late String secondHalf;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    if (widget.content.length > 70) {
      firstHalf = widget.content.substring(0, 70);
      secondHalf = widget.content.substring(70, widget.content.length);
    } else {
      firstHalf = widget.content;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: secondHalf.length == ""
            ? Text.rich(TextSpan(
                style: TextStyle(fontWeight: FontWeight.bold),
                text: widget.username,
                children: [
                    TextSpan(
                        text: widget.content,
                        style: TextStyle(fontWeight: FontWeight.normal))
                  ]))
            : Text.rich(TextSpan(
                style: TextStyle(fontWeight: FontWeight.bold),
                text: widget.username,
                children: [
                    TextSpan(
                        text: flag ? firstHalf : widget.content,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                    WidgetSpan(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          flag = !flag;
                        });
                      },
                      child: Text("Show more...",
                          style: TextStyle(
                            color: Colors.grey[600],
                          )),
                    ))
                  ])));

    // Expanded(
    //     child: secondHalf.length == ""
    //         ? Text(widget.content)
    //         : Flexible(
    //             fit: FlexFit.loose,
    //             child: Row(
    //               children: [
    //                 Text(flag ? firstHalf : widget.content),
    //                 SizedBox(
    //                   height: 5,
    //                 ),
    //                 InkWell(
    //                     onTap: () {
    //                       setState(() {
    //                         flag = !flag;
    //                       });
    //                     },
    //                     child: Text("Show more",
    //                         style: TextStyle(
    //                           color: Colors.grey[600],
    //                         )))
    //               ],
    //             ),
    //           ));
  }
}
