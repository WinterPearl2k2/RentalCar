import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/detail_contract_state.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

part 'detail_contract_notifier.g.dart';

@riverpod
class DetailContractNotifier extends _$DetailContractNotifier {
  @override
  DetailContractState build() => const DetailContractState();

  void printPDFContract({required pw.Widget contract}) async {
    final doc = pw.Document();

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
          pw.Center(child: contract)

          ];
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => doc.save(),
    );
  }
}
