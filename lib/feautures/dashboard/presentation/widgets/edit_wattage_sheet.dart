// lib/feautures/dashboard/presentation/widgets/edit_wattage_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/sheet_close_button.dart';

class EditWattageSheet extends StatefulWidget {
  final String applianceName;
  final String applianceImage;
  final int initialWattage;
  final List<int> presetWattages;
  final ValueChanged<int> onSave;

  const EditWattageSheet({
    super.key,
    required this.applianceName,
    required this.applianceImage,
    required this.initialWattage,
    this.presetWattages = const [
      30, 60, 80, 100, 150,
      200, 300, 400, 500,
      600, 850, 900, 1000,
      1200, 1500,
    ],
    required this.onSave,
  });

  static void show(
      BuildContext context, {
        required String applianceName,
        required String applianceImage,
        required int initialWattage,
        List<int>? presetWattages,
        required ValueChanged<int> onSave,
      }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: EditWattageSheet(
          applianceName: applianceName,
          applianceImage: applianceImage,
          initialWattage: initialWattage,
          presetWattages: presetWattages ??
              const [30, 60, 80, 100, 150, 200, 300, 400, 500, 600, 850, 900, 1000, 1200, 1500],
          onSave: onSave,
        ),
      ),
    );
  }

  @override
  State<EditWattageSheet> createState() => _EditWattageSheetState();
}

class _EditWattageSheetState extends State<EditWattageSheet> {
  late int _wattage;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _wattage = widget.initialWattage;
    _controller = TextEditingController(text: _wattage.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _selectPreset(int value) {
    setState(() {
      _wattage = value;
      _controller.text = value.toString();
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    });
  }

  void _onWattageChanged(String value) {
    setState(() => _wattage = int.tryParse(value) ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.r),
          topRight: Radius.circular(28.r),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SheetCloseButton(),
          SizedBox(height: 10.h),


          Row(
            children: [
              Container(
                width: 56.w,
                height: 56.h,
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.appliancesContainer,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Image.asset(widget.applianceImage, fit: BoxFit.contain),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MText(
                      inputText: "Edit Wattage",
                      textAlign: TextAlign.left,
                      textColor: AppColors.textColor,
                      weight: FontWeight.w700,
                      size: 18.spMin,
                    ),
                    SizedBox(height: 2.h),
                    MText(
                      inputText: widget.applianceName,
                      textAlign: TextAlign.left,
                      textColor: AppColors.textColor2,
                      weight: FontWeight.w400,
                      size: 13.spMin,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 22.h),

          // Wattage display / input
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: AppColors.kitchen,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    onChanged: _onWattageChanged,
                    style: TextStyle(
                      fontSize: 40.spMin,
                      fontWeight: FontWeight.w800,
                      color: AppColors.appliancestext,
                      fontFamily: "Inter",
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                MText(
                  inputText: "W",
                  textColor: AppColors.appliancestext2,
                  weight: FontWeight.w700,
                  size: 20.spMin,
                ),
              ],
            ),
          ),

          SizedBox(height: 20.h),

          // Preset wattage chips
          Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: widget.presetWattages.map((value) {
              final bool selected = value == _wattage;
              return GestureDetector(
                onTap: () => _selectPreset(value),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: selected ? AppColors.primary : AppColors.main,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: selected ? AppColors.primary : AppColors.surgeContainer,
                      width: 1.w,
                    ),
                  ),
                  child: MText(
                    inputText: "${value}W",
                    textColor: selected ? AppColors.main : AppColors.appliancestext2,
                    weight: FontWeight.w600,
                    size: 14.spMin,
                  ),
                ),
              );
            }).toList(),
          ),

          SizedBox(height: 30.h),

          // Cancel / Save row
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 55.h,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.appliancestext2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: MText(
                      inputText: "Cancel",
                      textColor: AppColors.appliancestext2,
                      weight: FontWeight.w700,
                      size: 16.spMin,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: SizedBox(
                  height: 55.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                    ),
                    onPressed: () {
                      widget.onSave(_wattage);
                      Navigator.pop(context);
                    },
                    child: MText(
                      inputText: "Save ${_wattage}W",
                      textColor: AppColors.main,
                      weight: FontWeight.w700,
                      size: 16.spMin,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}

