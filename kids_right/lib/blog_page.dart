import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart'; // Import the PDF viewer package

class BlogPage extends StatelessWidget {
  // Method to display the PDF
  void _openPdf(BuildContext context, String pdfPath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(pdfPath: pdfPath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPdfButton(
                context,
                'Right To be Treated Fairly',
                'assets/pdf/right_to_be_treated_fairly.pdf',
                Icons.star,
                Colors.blue,
              ),
              SizedBox(width: 20),
              _buildPdfButton(
                context,
                'Right To Identity',
                'assets/pdf/right_to_identity.pdf',
                Icons.star,
                Colors.green,
              ),
              SizedBox(width: 20),
              _buildPdfButton(
                context,
                'Right To Privacy',
                'assets/pdf/right_to_privacy.pdf',
                Icons.lock,
                Colors.red,
              ),
              /*SizedBox(width: 20),
              _buildPdfButton(
                context,
                'Right To Freedom Of Expression',
                'assets/pdf/right_to_freedom_of_expression.pdf',
                Icons.public,
                Colors.purple,
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPdfButton(
    BuildContext context,
    String title,
    String pdfPath,
    IconData icon,
    Color color,
  ) {
    return GestureDetector(
      onTap: () => _openPdf(context, pdfPath),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: color.withOpacity(0.3),
          shape: BoxShape.circle,
          border: Border.all(color: color, width: 3),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            size: 40,
            color: color,
          ),
        ),
      ),
    );
  }
}

class PdfViewerPage extends StatelessWidget {
  final String pdfPath;

  PdfViewerPage({required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SfPdfViewer.asset(pdfPath), // Using syncfusion_pdfviewer
    );
  }
}
