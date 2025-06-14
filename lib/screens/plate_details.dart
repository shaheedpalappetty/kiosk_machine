import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/logic/plate_details/plate_details_bloc.dart';
import 'package:testing/logic/plate_details/plate_details_event.dart';
import 'package:testing/logic/plate_details/plate_details_state.dart';
import 'package:testing/utilities/constants.dart';
import 'package:testing/utilities/textstyle.dart';
import 'package:testing/widgets/country_selection_popup.dart';
import 'package:testing/widgets/header.dart';
import 'package:testing/widgets/plate_widget.dart';

class PlateDetails extends StatelessWidget {
  const PlateDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlateDetailsBloc(),
      child: Scaffold(
        body: SafeArea(
            child: BlocConsumer<PlateDetailsBloc, PlateDetailsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              spacing: 25,
              children: [
                const Header(
                  title: "Select Plate Details",
                ),
                // const SizedBox(height: 25,),
                PlateWidget(
                  plateDetails: state.plateDetails,
                  isPlateDetailsSet: state.isPlateDetailsSet,
                ),
                if (state.plateCodeSelected)
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: alphabets.map((plateCode) {
                      final isSelected =
                          plateCode == state.plateDetails.plateCode;
                      return ChoiceChip(
                        label: Text(
                          plateCode,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: const Color(0xFF23657C),
                        backgroundColor: const Color(0xFF4DD8C7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onSelected: (_) {
                          BlocProvider.of<PlateDetailsBloc>(context)
                              .add(PlateCodeChanged(plateCode: plateCode));
                          // Navigator.of(context).pop(country);
                        },
                      );
                    }).toList(),
                  ),
                if (state.plateSourceSelected)
                  ElevatedButton(
                    onPressed: () => _showPopup(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF005060),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Select Country or Emirate',
                      style: AppTextStyles.buttonText,
                    ),
                  ),
                if (state.plateNumberSelected)
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: numbers.map((plateNumber) {
                      final isSelected =
                          plateNumber == state.plateDetails.plateNumber;
                      return ChoiceChip(
                        label: Text(
                          plateNumber,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: const Color(0xFF23657C),
                        backgroundColor: const Color(0xFF4DD8C7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onSelected: (_) {
                          BlocProvider.of<PlateDetailsBloc>(context).add(
                              PlateNumberChanged(plateNumber: plateNumber));
                          // Navigator.of(context).pop(country);
                        },
                      );
                    }).toList(),
                  ),
              ],
            );
          },
        )),
      ),
    );
  }

  void _showPopup(BuildContext context) async {
    final selectedCountry = await showDialog(
      context: context,
      builder: (context) => CountrySelectionPopup(),
    );

    if (selectedCountry != null) {
      debugPrint('User selected: $selectedCountry');
    }
  }
}
