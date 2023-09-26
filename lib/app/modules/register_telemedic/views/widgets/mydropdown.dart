import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/register_telemedic_controller.dart';

class WidgetTitle3 extends GetView<RegisterTelemedicController> {
  const WidgetTitle3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 0, 10, 0),
      child: Column(children: [
        Row(
          children: [
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Obx(
                    () => DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    items: List.generate(
                      controller.items.length,
                          (index) {
                        final data = controller.items[index];
                        return DropdownMenuItem<String>(
                          value: data,
                          child: Text(
                            data,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      },
                    ),
                    value: controller.selectedValue.value,
                    onChanged: (value) {
                      HapticFeedback.lightImpact();
                      controller.selectedValue.value = value!;
                      controller.jenisPx(value);
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 40,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: const Color(0xff4babe7),
                      ),
                      elevation: 0,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      padding: null,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                      offset: const Offset(2, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all<double>(6),
                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
