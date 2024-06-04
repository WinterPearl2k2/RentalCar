import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/utils/date_time_format_untils.dart';
import 'package:rental_car/data/dtos/rental_contract_dto.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:rental_car/application/utils/format_utils.dart';

final statusStr = [
  'Processing',
  'Active',
  'Canceled',
  'Expired',
];

pw.Widget buildPDFContract(RentalContractDto data) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Center(
        child: pw.Text(
          'Car Rental Agreement',
          style: pw.TextStyle(
            fontSize: 24,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
      ),
      pw.SizedBox(height: 20.h),
      pw.Text(
          "This Car Rental Agreement is made and entered into by and between ${data.nameOwner} and ${data.nameCustomer} on ${DateTimeFormatUtils.convertDateFormat(format: 'dd/MM/yyyy', inputDate: data.startDate)}."),
      pw.SizedBox(height: 16.h),
      _buildTitleRow('1. Rental Vehicle Information:'),
      pw.Text('The Lessor agrees to rent to the Renter the following vehicle:'),
      _buildDetailRow('Transaction Code:', data.transaction),
      _buildDetailRow('Car Name:', data.nameCar),
      pw.SizedBox(height: 10.h),
      _buildTitleRow('2. Rental Period:'),
      pw.Text(
        'The rental period shall commence on ${DateTimeFormatUtils.convertDateFormat(format: 'dd/MM/yyyy', inputDate: data.startDate)} and terminate on ${DateTimeFormatUtils.convertDateFormat(format: 'dd/MM/yyyy', inputDate: data.endDate)}.',
      ),
      pw.SizedBox(height: 10.h),
      _buildTitleRow('3. Rental Fees and Charges:'),
      pw.Text(
          'The Renter agrees to pay the following fees and charges for the rental of the vehicle:'),
      _buildDetailRow(
        'Rental Fee:',
        '${FormatUtils.formatNumber(data.rentalPrice)} USD',
      ),
      _buildDetailRow(
        'Security Deposit:',
        '${FormatUtils.formatNumber(data.rentalPrice)} USD',
      ),
      _buildDetailRow(
        'Additional Charges:',
        'Any additional charges incurred during the rental period, including but not limited to fuel charges, late return fees, and cleaning fees, shall be the responsibility of the Renter.',
      ),
      pw.SizedBox(height: 10.h),
      _buildTitleRow('4. Use of Vehicle:'),
      pw.Text(
        'The Renter agrees to use the vehicle solely for personal use and not for any illegal or prohibited purposes. The vehicle shall not be driven by anyone other than the Renter, unless otherwise specified and approved by the Lessor.',
      ),
      pw.SizedBox(height: 10.h),
      _buildTitleRow('5. Maintenance and Repairs:'),
      pw.Text(
        'The Lessor shall provide a well-maintained and roadworthy vehicle to the Renter. In the event of any mechanical failure or damage to the vehicle during the rental period, the Renter shall immediately notify the Lessor and follow the instructions provided.',
      ),
      pw.SizedBox(height: 10.h),
      _buildTitleRow('6. Insurance:'),
      pw.Text(
          'The vehicle is insured under ${data.nameOwner} with coverage for liability, collision, and comprehensive damages. The Renter agrees to comply with all terms and conditions of the insurance policy.'),
      pw.SizedBox(height: 10.h),
      _buildTitleRow('7. Return of Vehicle:'),
      pw.Text(
          'The Renter agrees to return the vehicle to the Lessor at the agreed-upon date and time specified in this Agreement. Failure to return the vehicle on time may result in additional charges as specified in Section 3.'),
      pw.SizedBox(height: 10.h),
      _buildTitleRow('8. Condition of Vehicle:'),
      pw.Text(
          'The Renter acknowledges receipt of the vehicle in good condition and agrees to return it to the Lessor in the same condition, normal wear and tear excepted. Any damage beyond normal wear and tear shall be the responsibility of the Renter and may result in additional charges.'),
      pw.SizedBox(height: 10.h),
      _buildTitleRow('9. Governing Law:'),
      pw.Text(
          'This Agreement shall be governed by and construed in accordance with the laws of VietNam'),
      pw.SizedBox(height: 10.h),
      _buildTitleRow('10. Entire Agreement:'),
      pw.Text(
          'This Agreement constitutes the entire agreement between the Lessor and the Renter and supersedes all prior agreements and understandings, whether written or oral, relating to the subject matter herein.'),
      pw.SizedBox(height: 10.h),
      _buildTitleRow('11. Signatures:'),
      pw.Text(
          'The parties hereto have executed this Agreement as of the date first above written.'),
      _buildDetailRow('Owner:', data.nameOwner),
      _buildDetailRow('Customer:', data.nameCustomer),
      _buildDetailRow(
        'From:',
        DateTimeFormatUtils.convertDateFormat(
            format: 'dd/MM/yyyy', inputDate: data.startDate),
      ),
      _buildDetailRow(
        'To:',
        DateTimeFormatUtils.convertDateFormat(
            format: 'dd/MM/yyyy', inputDate: data.endDate),
      ),
      _buildDetailRow('Status:', statusStr[data.statusCar]),
    ],
  );
}

pw.Widget _buildDetailRow(String label, String value) {
  return pw.Container(
    margin: const pw.EdgeInsets.symmetric(vertical: 1),
    child: pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          '   $label ',
          style: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.Expanded(
          child: pw.Text(value),
        ),
      ],
    ),
  );
}

pw.Widget _buildTitleRow(
  String label,
) {
  return pw.Text(
    label,
    style: pw.TextStyle(
      fontWeight: pw.FontWeight.bold,
    ),
  );
}
