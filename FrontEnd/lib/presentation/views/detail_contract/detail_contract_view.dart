import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/data/dtos/rental_contract_dto.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/views/detail_contract/notifier/detail_contract_notifier.dart';
import 'package:rental_car/presentation/views/detail_contract/widgets/detail_contract_body_widget.dart';
import 'package:rental_car/presentation/views/detail_contract/widgets/detail_contract_pdf_widget.dart';
import '../../../application/routes/routes.dart';
import '../../../application/utils/colors_utils.dart';

class DetailContractView extends ConsumerStatefulWidget {
  const DetailContractView({super.key});

  @override
  BaseStateDelegate<DetailContractView, DetailContractNotifier> createState() =>
      _DetailContractViewState();
}

class _DetailContractViewState
    extends BaseStateDelegate<DetailContractView, DetailContractNotifier> {
  @override
  void initNotifier() {
    notifier = ref.read(
      detailContractNotifierProvider.notifier,
    );
  }

  final statusStr = [
    'Processing',
    'Active',
    'Canceled',
    'Expired',
  ];
  final statusColors = [
    ColorUtils.yellowColor,
    ColorUtils.greenColor,
    ColorUtils.redColor,
    ColorUtils.blueColor,
  ];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments
        as Map<String, RentalContractDto>;
    final data = args['rental'] ?? const RentalContractDto();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Contract',
          style: TextStyle(
            color: ColorUtils.primaryColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            AssetUtils.icBack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          InkWell(
            onTap: () {
              notifier.printPDFContract(
                contract: buildPDFContract(data),
              );
            },
            child: Icon(
              Icons.picture_as_pdf_outlined,
              size: 20.r,
            ),
          ),
          IconButton(
            onPressed: () => Routes.goToCarDetailView(
              context,
              data.idCar,
            ),
            icon: SvgPicture.asset(
              'assets/icons/ic_foot.svg',
              colorFilter: ColorFilter.mode(
                ColorUtils.primaryColor,
                BlendMode.srcIn,
              ),
              height: 20.h,
              width: 20.w,
            ),
          ),
        ],
      ),
      body: DetailContractBodyWidget(
        data: data,
        statusStr: statusStr,
        statusColors: statusColors,
      ),
    );
  }
}
