import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/logic/plate_details/plate_details_bloc.dart';
import 'package:testing/logic/plate_details/plate_details_event.dart';
import 'package:testing/logic/plate_details/plate_details_state.dart';
import 'package:testing/models/plate_details.dart';
import 'package:testing/utilities/constants.dart';
import 'package:testing/utilities/textstyle.dart';

class PlateWidget extends StatelessWidget {
  final PlateDetails plateDetails;
  final bool isPlateDetailsSet;
  const PlateWidget(
      {super.key, required this.plateDetails, required this.isPlateDetailsSet});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlateDetailsBloc, PlateDetailsState>(
      builder: (context, state) {
        return Container(
          width: 300,
          height: 80,
          decoration: BoxDecoration(
            // color: backgroundColor,
            border: Border.all(
              color: const Color(0xFFC3C3C3),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 25,
            children: [
              InkWell(
                onTap: () => BlocProvider.of<PlateDetailsBloc>(context)
                    .add(const PlateCodeSelected()),
                child: Text(
                  isPlateDetailsSet ? plateDetails.plateCode : "AA",
                  style: plateDetails.plateCode.isNotEmpty
                      ? AppTextStyles.subHeading
                      : AppTextStyles.subHeadingFaded,
                ),
              ),
              InkWell(
                onTap: () => BlocProvider.of<PlateDetailsBloc>(context)
                    .add(const PlateSourceSelected()),
                child: state.plateDetails.plateSource == "DXB" ||
                        state.plateDetails.plateSource == ""
                    ? AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image(
                            image: AssetImage(
                                plateDetails.plateSource.isNotEmpty
                                    ? dubaiLogo
                                    : dubaiLogoFaded)),
                      )
                    : Text(
                        state.plateDetails.plateSource,
                        style: AppTextStyles.subHeading,
                      ),
              ),
              InkWell(
                onTap: () => BlocProvider.of<PlateDetailsBloc>(context)
                    .add(const PlateNumberSelected()),
                child: Text(
                    plateDetails.plateNumber.isNotEmpty
                        ? plateDetails.plateNumber
                        : "123456",
                    style: plateDetails.plateNumber.isNotEmpty
                        ? AppTextStyles.subHeading
                        : AppTextStyles.subHeadingFaded),
              )
            ],
          ),
        );
      },
    );
  }
}
