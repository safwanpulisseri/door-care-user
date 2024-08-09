import 'package:door_care/core/theme/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart';

class EnterDetailsBookService extends StatefulWidget {
  const EnterDetailsBookService({super.key});

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
            colorScheme: ColorScheme.light(primary: AppColor.toneTen),
            // Change the text color
            textTheme: TextTheme().copyWith(
              bodyLarge: TextStyle(
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
            colorScheme: ColorScheme.light(primary: AppColor.toneOne),

            // Change the text color
            textTheme: TextTheme().copyWith(
              bodyLarge: TextStyle(
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
          child: Column(
            children: [
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
                        child: Expanded(
                          child: TextField(
                            controller: commentsController,
                            decoration: const InputDecoration(
                              hintText: 'Write your Message to Worker',
                              hintStyle: TextStyle(
                                  fontSize: 14, color: AppColor.secondary),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // ListTile(
              //   leading: const Icon(Icons.calendar_today),
              //   title: Text(
              //     selectedDate != null
              //         ? DateFormat.yMMMd().format(selectedDate!)
              //         : 'Select your Date',
              //   ),
              //   tileColor: Colors.orangeAccent.shade100,
              //   onTap: () => _selectDate(context),
              // ),
              // ListTile(
              //   leading: const Icon(Icons.access_time),
              //   title: Text(
              //     selectedStartTime != null
              //         ? selectedStartTime!.format(context)
              //         : 'Select your Start Time',
              //   ),
              //   tileColor: Colors.greenAccent.shade100,
              //   onTap: () => _selectTime(context, true),
              // ),
              // ListTile(
              //   leading: const Icon(Icons.access_time),
              //   title: Text(
              //     selectedEndTime != null
              //         ? selectedEndTime!.format(context)
              //         : 'Select your End Time',
              //   ),
              //   tileColor: Colors.greenAccent.shade100,
              //   onTap: () => _selectTime(context, false),
              // ),
              // ListTile(
              //   leading: const Icon(Icons.comment),
              //   title: TextField(
              //     controller: commentsController,
              //     decoration: const InputDecoration(
              //       hintText: 'Write your Message to Worker',
              //     ),
              //   ),
              //   tileColor: Colors.lightBlueAccent.shade100,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
