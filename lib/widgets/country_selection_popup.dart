import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class CountrySelectionPopup extends StatefulWidget {
  String? selected;

  CountrySelectionPopup({super.key, this.selected = "Dubai"});

  @override
  State<CountrySelectionPopup> createState() => _CountrySelectionPopupState();
}

class _CountrySelectionPopupState extends State<CountrySelectionPopup> {


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.6,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F9F6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Select country or emirate",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: countries.map((country) {
                final isSelected = country == widget.selected;
                return ChoiceChip(
                  label: Text(
                    country,
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
                    widget.selected = country;
                    setState(() {});
                    // Navigator.of(context).pop(country);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                  label: const Text("Close"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF0D3440),
                    side: const BorderSide(color: Color(0xFF0D3440)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                  },
                  icon: const Text("Continue"),
                  label: const Icon(Icons.arrow_forward_ios),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0D3440),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
