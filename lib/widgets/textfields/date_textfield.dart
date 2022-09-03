import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:registration/resources/constants/colors.dart';
import 'package:registration/resources/localization/english_localization.dart';


class DateTextField extends StatefulWidget {
  final void Function(DateTime) callback;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  DateTextField(
      {Key? key, required this.callback, this.validator, this.controller});
  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    if (widget.controller == null) {
      dateinput.text = '';
    } else {
      dateinput = widget.controller!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.h,
      width: 328.w,
      child: TextFormField(
        key: widget.key,
        validator: widget.validator,
        controller: dateinput,
        decoration: InputDecoration(
          label: const Text(
            Localization.date,
            style: TextStyle(
              color: Color.fromRGBO(27, 27, 27, 0.5),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 23),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.purple),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              builder: ((context, child) {
                return Theme(
                  data: ThemeData.dark().copyWith(
                      colorScheme: const ColorScheme.dark(
                        primary: AppColor.purple,
                        onPrimary: Color.fromARGB(85, 27, 27, 27),
                        surface: Color.fromARGB(255, 97, 69, 113),
                        onSurface: Color.fromARGB(255, 224, 177, 251),
                      ),
                      dialogBackgroundColor:AppColor. purple,
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                        ),
                      )),
                  child: child!,
                );
              }),
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101));

          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

            setState(() {
              dateinput.text = formattedDate;
              widget.callback(pickedDate);
            });
          } else {}
          ;
        },
      ),
    );
  }
}
