import 'package:door_care/core/theme/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart';
import '../../../home/data/model/fetch_all_service_model.dart';

class EnterDetailsBookService extends StatefulWidget {
  final FetchAllServiceModel service;
  final GlobalKey<FormState> formKey;
  const EnterDetailsBookService({
    super.key,
    required this.service,
    required this.formKey,
  });

  @override
  State<EnterDetailsBookService> createState() =>
      _EnterDetailsBookServiceState();
}

class _EnterDetailsBookServiceState extends State<EnterDetailsBookService> {
  DateTime? selectedDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  TextEditingController commentsController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            // Change the background color
            colorScheme: const ColorScheme.light(primary: AppColor.toneTen),
            // Change the text color
            textTheme: const TextTheme().copyWith(
              bodyLarge: const TextStyle(
                  color: AppColor.secondary), // Your desired text color here
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            // Change the background color
            colorScheme: const ColorScheme.light(primary: AppColor.toneOne),

            // Change the text color
            textTheme: const TextTheme().copyWith(
              bodyLarge: const TextStyle(
                  color: AppColor.secondary), // Your desired text color here
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          selectedStartTime = picked;
        } else {
          selectedEndTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: widget.formKey,
            child: Column(
              children: [
                // Service Details
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.toneNine,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.service.serviceName, // Display service name
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.secondary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget
                            .service.description, // Display service description
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.secondary.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Price: ${widget.service.firstHourCharge}', // Display service price
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.secondary.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        'Price: ${widget.service.laterHourCharge}', // Display service price
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.secondary.withOpacity(0.7),
                        ),
                      ),
                      Image.network(
                        widget.service.serviceImg,
                        height: 100,
                        width: 100,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.toneTen,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(IconlyLight.calendar),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Date')
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 45,
                            ),
                            Text(
                              selectedDate != null
                                  ? DateFormat.yMMMd().format(selectedDate!)
                                  : 'Select your Date',
                              style: TextStyle(
                                color: AppColor.secondary.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => _selectTime(context, true),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.toneOne,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(IconlyLight.timeSquare),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Time')
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 45,
                            ),
                            Text(
                              selectedStartTime != null
                                  ? selectedStartTime!.format(context)
                                  : 'Select your Start Time',
                              style: TextStyle(
                                color: AppColor.secondary.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => _selectTime(context, false),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.toneOne,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(IconlyLight.timeSquare),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Time')
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 45,
                            ),
                            Text(
                              selectedEndTime != null
                                  ? selectedEndTime!.format(context)
                                  : 'Select your End Time',
                              style: TextStyle(
                                color: AppColor.secondary.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.toneNine,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        const Row(
                          children: [
                            Icon(IconlyLight.message),
                            SizedBox(
                              width: 10,
                            ),
                            Text('COMMENTS'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: TextField(
                            controller: commentsController,
                            decoration: InputDecoration(
                              hintText: 'Write your Message to Worker',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: AppColor.secondary.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
