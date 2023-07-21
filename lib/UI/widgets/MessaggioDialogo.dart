import 'package:front_end_ecommerce/UI/widgets/RoundedDialog.dart';
import 'package:flutter/material.dart';
import '../aspects/TextStyles.dart';


class MessaggioDialogo extends StatelessWidget {
  final String titleText;
  final String bodyText;


  const MessaggioDialogo({required this.titleText, required this.bodyText}) : super();

  @override
  Widget build(BuildContext context) {
    return RoundedDialog(
      title: Text(
        titleText,
        style: TitleStyle(),
        textAlign: TextAlign.center,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Text(
          bodyText,
          style: ParagraphStyle(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }


}