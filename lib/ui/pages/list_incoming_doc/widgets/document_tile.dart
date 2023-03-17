import 'package:flutter/material.dart';
import 'package:flutter_app/constants/style_const.dart';

class DocumentTile extends StatefulWidget {
  const DocumentTile({Key? key}) : super(key: key);

  @override
  State<DocumentTile> createState() => _DocumentTileState();
}

class _DocumentTileState extends State<DocumentTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(StyleConst.defaultRadius),
          side: const BorderSide(color: Colors.black, width: 0.5)),
      collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(StyleConst.defaultRadius),
          side: const BorderSide(color: Colors.black, width: 0.5)),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Text("1.")],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("120/ĐP"),
          const Text("1737/VP-VX"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Flexible(child: Text("Công văn")),
              Flexible(child: Text("Còn 5 ngày"))
            ],
          )
        ],
      ),
      trailing: Column(
        children: [
          AnimatedRotation(
              turns: _isExpanded ? .5 : 0,
              duration: const Duration(milliseconds: 300),
              child: const Icon(Icons.keyboard_arrow_down_sharp))
        ],
      ),
      onExpansionChanged: (value) {
        setState(() {
          _isExpanded = value;
        });
      },
      children: [
        const Divider(
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(StyleConst.defaultPadding),
          child: Column(
            children: [
              Row(
                children: const [
                  Expanded(child: Text("Cấp gửi:")),
                  Flexible(flex: 2, child: Text("Thành phố"))
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              const SizedBox(
                height: StyleConst.defaultPadding / 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(child: Text("Ngày đến:")),
                  Flexible(
                    child: Text("23/03/2022"),
                    flex: 2,
                  )
                ],
              ),
              const SizedBox(
                height: StyleConst.defaultPadding / 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(child: Text("Nơi phát hành:")),
                  Flexible(
                      flex: 2,
                      child: Text("Lorem ipsum dolor sit amet consectetur."))
                ],
              ),
              const SizedBox(
                height: StyleConst.defaultPadding / 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(child: Text("Trình yếu")),
                  Flexible(
                    flex: 2,
                    child: Text(
                        "Lorem ipsum dolor sit amet consectetur. Vitae turpis sed platea mauris tempus."),
                  )
                ],
              ),
              const SizedBox(
                height: StyleConst.defaultPadding / 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(child: Text("Toàn văn:")),
                  Flexible(flex: 2, child: Text(""))
                ],
              ),
              const SizedBox(
                height: StyleConst.defaultPadding / 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(child: Text("Trạng thái:")),
                  Flexible(flex: 2, child: Text(""))
                ],
              ),
              const SizedBox(
                height: StyleConst.defaultPadding / 2,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            StyleConst.defaultRadius), // <-- Radius
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal:
                              StyleConst.defaultPadding / 2), // and this
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text("Xem chi tiết"),
                        SizedBox(
                          width: StyleConst.defaultPadding / 2,
                        ),
                        Icon(Icons.arrow_circle_right_outlined)
                      ],
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}
