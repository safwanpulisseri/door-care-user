import 'package:door_care/core/theme/color/app_color.dart';
import 'package:door_care/feature/navigation_menu/page/home_navigation_menu.dart';
import 'package:door_care/feature/service/bloc/enter_details_bloc/enter_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/widget/toastifiaction_widget.dart';
import '../../../auth/view/widget/loading_dialog.dart';
import '../../../home/data/model/fetch_all_service_model.dart';
import '../widget/bottom_app_bar_widget.dart';
import '../widget/circle_avathar_widget.dart';
import 'comepleted_book_service.dart';

class EnterDetailsBookService extends StatefulWidget {
  final FetchAllServiceModel service;
  final double latitude;
  final double longitude;

  const EnterDetailsBookService({
    super.key,
    required this.service,
    required this.latitude,
    required this.longitude,
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
            colorScheme: const ColorScheme.light(primary: AppColor.toneTen),
            textTheme: const TextTheme().copyWith(
              bodyLarge: const TextStyle(color: AppColor.secondary),
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
            colorScheme: const ColorScheme.light(primary: AppColor.toneOne),
            textTheme: const TextTheme().copyWith(
              bodyLarge: const TextStyle(color: AppColor.secondary),
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
    return BlocListener<EnterDetailsBloc, EnterDetailsState>(
      listener: (context, state) {
        if (state is EnterDetailsLoadingState) {
          LoadingDialog.show(context);
        } else if (state is EnterDetailsSuccessState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => const CompletedBookService(),
            ),
            (route) => false,
          );
          ToastificationWidget.show(
            context: context,
            type: ToastificationType.success,
            title: 'Success',
            description: 'Successfully Booked a Service!',
            // backgroundColor: AppColor.toneEight,
            // textColor: AppColor.background,
          );
        } else if (state is EnterDetailsFailState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => HomeNavigationMenu(),
            ),
            (route) => false,
          );
          Navigator.pop(context);
          ToastificationWidget.show(
            context: context,
            type: ToastificationType.error,
            title: 'Error',
            description: 'Failed to book a service. Please try again.',
            // backgroundColor: AppColor.toneSeven,
            // textColor: AppColor.background,
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const StepperWidget(
                  titleOne: 'Location',
                  titleTwo: 'Details',
                  titleThree: 'Success',
                  titleColorOne: AppColor.toneThree,
                  titleColorTwo: AppColor.secondary,
                  titleColorThree: AppColor.toneThree,
                  circleColorOne: AppColor.toneFive,
                  circleColorTwo: AppColor.primary,
                  circleColorThree: AppColor.toneFive,
                  iconOne: Icon(
                    FontAwesomeIcons.check,
                    color: AppColor.background,
                  ),
                  iconTwo: Icon(
                    FontAwesomeIcons.check,
                    color: AppColor.background,
                  ),
                  iconThree: Icon(
                    Icons.add,
                    color: AppColor.background,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(widget.latitude.toString()),
                      Text(widget.longitude.toString()),
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
                                        ? DateFormat.yMMMd()
                                            .format(selectedDate!)
                                        : 'Select your Date',
                                    style: TextStyle(
                                      color:
                                          AppColor.secondary.withOpacity(0.5),
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
                                      color:
                                          AppColor.secondary.withOpacity(0.5),
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
                                      color:
                                          AppColor.secondary.withOpacity(0.5),
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
                                      color:
                                          AppColor.secondary.withOpacity(0.5),
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
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBarWidget(
          leftButtonText: 'Back',
          rightButtonText: 'Finish',
          onLeftButtonPressed: () {
            Navigator.of(context).pop();
          },
          onRightButtonPressed: () {
            if (selectedDate != null &&
                selectedStartTime != null &&
                selectedEndTime != null) {
              // Format the selected date and time for the event
              final formattedDate =
                  DateFormat('yyyy-MM-dd').format(selectedDate!);
              final formattedStartTime = selectedStartTime!.format(context);
              final formattedEndTime = selectedEndTime!.format(context);

              // Pass the data to the BLoC event
              context.read<EnterDetailsBloc>().add(
                    EnterServiceDetailsEvent(
                      serviceName: widget.service.serviceName,
                      serviceImg: widget.service.serviceImg,
                      firstHourCharge: widget.service.firstHourCharge,
                      laterHourCharge: widget.service.laterHourCharge,
                      comments: commentsController.text,
                      date: formattedDate,
                      startTime: formattedStartTime,
                      endTime: formattedEndTime,
                      latitude: widget.latitude,
                      longitude: widget.longitude,
                    ),
                  );
            } else {
              // Show an error message if any required fields are missing
              ToastificationWidget.show(
                context: context,
                type: ToastificationType.error,
                title: 'Error',
                description: 'Please select date, start time, and end time.',
              );
            }
          },
        ),
      ),
    );
  }
}
