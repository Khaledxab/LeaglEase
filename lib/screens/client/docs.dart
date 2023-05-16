import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  List<File> _pdfFiles = [];

  @override
  void initState() {
    super.initState();
    _getPdfFiles();
  }

  Future<void> _getPdfFiles() async {
    Directory directory = await getApplicationDocumentsDirectory();
    List<FileSystemEntity> files = directory.listSync();

    List<File> pdfFiles = [];
    for (FileSystemEntity file in files) {
      if (file is File && file.path.endsWith('.pdf')) {
        pdfFiles.add(file);
      }
    }

    setState(() {
      _pdfFiles = pdfFiles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Files'),
      ),
      body: ListView.builder(
        itemCount: _pdfFiles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_pdfFiles[index].path),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfViewPage(pdfFile: _pdfFiles[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PdfViewPage extends StatelessWidget {
  final File pdfFile;

  PdfViewPage({required this.pdfFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pdfFile.path),
      ),
      body: PDFView(
        filePath: pdfFile.path,
      ),
    );
  }
}
