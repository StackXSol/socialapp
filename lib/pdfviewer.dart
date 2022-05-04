import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/widgets.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Pdf_Viewer extends StatelessWidget {
  Pdf_Viewer({required this.doc});
  String doc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SfPdfViewer.network(doc)));
  }
}
