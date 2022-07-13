import 'package:arcadia_app/gen/fonts.gen.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:flutter/material.dart';

class DropdownField<T> extends StatelessWidget {
  const DropdownField({
    super.key,
    required this.value,
    this.onChanged,
    this.options = const [],
    this.optionToString,
  });

  final T value;
  final ValueChanged<T?>? onChanged;
  final List<T> options;
  final String Function(T)? optionToString;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: Center(
        child: SizedBox(
          height: 40,
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: value,
                onChanged: onChanged,
                icon: const Icon(Icons.chevron_left),
                iconSize: 30,
                iconEnabledColor: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(10),
                isExpanded: true,
                elevation: 0,
                menuMaxHeight: 500,
                style: const TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  height: 1.2,
                  color: AppColors.black,
                ),
                alignment: Alignment.centerLeft,
                items: options.map((o) {
                  final text =
                      optionToString == null ? '$o' : optionToString!(o);
                  return DropdownMenuItem<T>(
                    value: o,
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontFamily: FontFamily.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        height: 1.2,
                        color: AppColors.black,
                      ),
                    ),
                  );
                }).toList(),
                onTap: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
