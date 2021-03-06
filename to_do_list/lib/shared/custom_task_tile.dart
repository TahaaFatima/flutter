import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomTaskTile extends StatefulWidget {
  CustomTaskTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.isTapedOnStart,
    this.isTapedCallack,
  }) : super(key: key);

  String title;
  String subtitle;
  bool isTapedOnStart;
  void Function(bool)? isTapedCallack;

  @override
  State<CustomTaskTile> createState() => _CustomTaskTileState();
}

class _CustomTaskTileState extends State<CustomTaskTile> {
  bool isTaped = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isTaped = !isTaped;
          });
          if (widget.isTapedCallack != null) {
            widget.isTapedCallack!(isTaped);
          }
        },
        child: Row(
          children: [
            Container(
              padding: widget.isTapedOnStart
                  ? const EdgeInsets.all(0)
                  : isTaped
                      ? const EdgeInsets.all(0)
                      : const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xffDADADA),
                  width: 2,
                ),
              ),
              child: widget.isTapedOnStart
                  ? const Icon(
                      Icons.done,
                      size: 20,
                    )
                  : isTaped
                      ? const Icon(
                          Icons.done,
                          size: 20,
                        )
                      : const SizedBox(),
            ),
            const Gap(15),
            (widget.isTapedOnStart || isTaped)
                ? Text(
                    widget.title,
                    style: const TextStyle(
                      color: Color(0xffB9B9BE),
                      fontSize: 18,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          color: Color(0xff575767),
                          fontSize: 18,
                        ),
                      ),
                      const Gap(5),
                      Text(
                        widget.subtitle,
                        style: const TextStyle(
                          color: Color(0xffB9B9BE),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
