import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoiceproject/Model_class.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfDemo extends StatefulWidget {
  final List cartList;
  final double data;

  const PdfDemo({Key? key, required this.cartList,required this.data}) : super(key: key);

  @override
  State<PdfDemo> createState() => _PdfDemoState();
}

class _PdfDemoState extends State<PdfDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (PdfPageFormat format) {
          return pdfDemo();
        },
      ),
    );
  }

  Future<Uint8List> pdfDemo() async {
    final pdfDoc = pw.Document();

    pdfDoc.addPage(pw.Page(
        // pageFormat: PdfPageFormat.a6,
        build: (pw.Context context) {
      // pw.MultiPage;
      return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          pw.Text(
            'Invoice',
            style: pw.TextStyle(
                fontSize: 40, letterSpacing: 1, color: PdfColors.grey),
          ),
          pw.SizedBox(height: 20),
          pw.Container(
            height: 50,
            width: 200,
            decoration: pw.BoxDecoration(
              color: PdfColors.grey,
              border: pw.Border(
                left: pw.BorderSide(
                  color: PdfColors.black,
                ),
                right: pw.BorderSide(
                  color: PdfColors.black,
                ),
                top: pw.BorderSide(color: PdfColors.black),
                bottom: pw.BorderSide(color: PdfColors.black),
              ),
            ),
            child: pw.Center(
              child: pw.Text('Date', style: pw.TextStyle(fontSize: 25)),
            ),
          ),
          pw.Container(
            height: 50,
            width: 200,
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text(DateTime.now().day.toString(),
                    style: pw.TextStyle(fontSize: 25)),
                pw.SizedBox(width: 3),
                pw.Text('/', style: pw.TextStyle(fontSize: 26)),
                pw.SizedBox(width: 3),
                pw.Text(DateTime.now().month.toString(),
                    style: pw.TextStyle(fontSize: 25)),
                pw.SizedBox(width: 3),
                pw.Text('/', style: pw.TextStyle(fontSize: 26)),
                pw.SizedBox(width: 3),
                pw.Text(DateTime.now().year.toString(),
                    style: pw.TextStyle(fontSize: 25)),
              ],
            ),
            decoration: pw.BoxDecoration(
              color: PdfColors.white,
              border: pw.Border(
                left: pw.BorderSide(
                  color: PdfColors.black,
                ),
                right: pw.BorderSide(
                  color: PdfColors.black,
                ),
                top: pw.BorderSide(color: PdfColors.black),
                bottom: pw.BorderSide(color: PdfColors.black),
              ),
            ),
          ),
          pw.SizedBox(height: 15),
          pw.Column(
            children: [
              pw.Row(
                children: [
                  pw.Container(
                    height: 480,
                    width: 230,
                    decoration: pw.BoxDecoration(
                      color: PdfColors.white,
                      border: pw.Border(
                        left: pw.BorderSide(
                          color: PdfColors.black,
                        ),
                        right: pw.BorderSide(
                          color: PdfColors.black,
                        ),
                        top: pw.BorderSide(color: PdfColors.black),
                        bottom: pw.BorderSide(color: PdfColors.black),
                      ),
                    ),
                    child: pw.Column(
                      children: [
                        pw.Text(
                          'Product Name',
                          style: pw.TextStyle(fontSize: 25),
                        ),
                        pw.Divider(),
                        pw.Column(
                          children: cartlist
                              .map((e) => pw.Center(
                                    child: pw.Container(
                                      height: 25,
                                      width: 250,
                                      color: PdfColors.white,
                                      child: pw.Text(e.name!,
                                          style: pw.TextStyle(fontSize: 20)),
                                    ),
                                  ))
                              .toList(),
                        ),
                        // pw.Text(widget.name,style: pw.TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  // pw.SizedBox(height: 10),
                  pw.Container(
                    height: 480,
                    width: 180,
                    decoration: pw.BoxDecoration(
                      color: PdfColors.white,
                      border: pw.Border(
                        left: pw.BorderSide(
                          color: PdfColors.black,
                        ),
                        right: pw.BorderSide(
                          color: PdfColors.black,
                        ),
                        top: pw.BorderSide(color: PdfColors.black),
                        bottom: pw.BorderSide(color: PdfColors.black),
                      ),
                    ),
                    child: pw.Column(
                      children: [
                        pw.Text(
                          'Amount',
                          style: pw.TextStyle(fontSize: 25),
                        ),
                        pw.Divider(),
                        pw.Column(
                          children: cartlist
                              .map((e) => pw.Center(
                                    child: pw.Container(
                                      height: 25,
                                      width: 190,
                                      color: PdfColors.white,
                                      child: pw.Text(e.price!.toString(),
                                          style: pw.TextStyle(fontSize: 20)),
                                    ),
                                  ))
                              .toList(),
                        ),
                        // pw.Text(widget.price.toString(),style: pw.TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  pw.Column(
                    children: [
                      pw.Container(
                        height: 480,
                        width: 70,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.white,
                          border: pw.Border(
                            left: pw.BorderSide(
                              color: PdfColors.black,
                            ),
                            right: pw.BorderSide(
                              color: PdfColors.black,
                            ),
                            top: pw.BorderSide(color: PdfColors.black),
                            bottom: pw.BorderSide(color: PdfColors.black),
                          ),
                        ),
                        child: pw.Column(
                          children: [
                            pw.Text('GST',style: pw.TextStyle(fontSize: 25),),
                            pw.Divider(),
                            pw.Column(
                              children: cartlist
                                  .map((e) => pw.Center(
                                child: pw.Container(
                                  height: 25,
                                  width: 190,
                                  color: PdfColors.white,
                                  child: pw.Text('3.50',
                                      style: pw.TextStyle(fontSize: 20)),
                                ),
                              ))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              pw.Row(
                children: [
                  pw.Container(
                      height: 50,
                      width: 230,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.grey,
                        border: pw.Border(
                          left: pw.BorderSide(
                            color: PdfColors.black,
                          ),
                          right: pw.BorderSide(
                            color: PdfColors.black,
                          ),
                          top: pw.BorderSide(color: PdfColors.black),
                          bottom: pw.BorderSide(color: PdfColors.black),
                        ),
                      ),
                      child:
                          pw.Text('Total', style: pw.TextStyle(fontSize: 25))),
                  pw.Container(
                    height: 50,
                    width: 250,
                    decoration: pw.BoxDecoration(
                      color: PdfColors.grey,
                      border: pw.Border(
                        left: pw.BorderSide(
                          color: PdfColors.black,
                        ),
                        right: pw.BorderSide(
                          color: PdfColors.black,
                        ),
                        top: pw.BorderSide(color: PdfColors.black),
                        bottom: pw.BorderSide(color: PdfColors.black),
                      ),
                    ),
                    child: pw.Text(widget.data.toString(),style: pw.TextStyle(fontSize: 35)),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdfDoc.save());
    return pdfDoc.save();
  }
}
