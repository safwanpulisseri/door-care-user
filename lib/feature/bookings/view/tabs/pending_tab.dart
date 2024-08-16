import 'dart:developer';
import 'package:door_care/core/widget/padding_booking.dart';
import 'package:door_care/core/widget/padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/theme/color/app_color.dart';
import '../../../../core/util/png_asset.dart';
import '../../../auth/data/service/local/auth_local_service.dart';
import '../../bloc/bloc/fetch_all_pending_services_bloc.dart';
import '../../data/repository/fetch_all_booked_service_repo.dart';
import '../../data/service/remote/fetch_all_booked_service_details.dart';

class TabScreenOne extends StatefulWidget {
  const TabScreenOne({super.key});

  @override
  State<TabScreenOne> createState() => _TabScreenOneState();
}

class _TabScreenOneState extends State<TabScreenOne> {
  Future<String> _getLocationName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      if (placemarks.isNotEmpty) {
        final Placemark placemark = placemarks.first;
        return '${placemark.locality}, ${placemark.administrativeArea}';
      } else {
        return 'Location not found';
      }
    } catch (e) {
      return 'Failed to get location name: $e';
    }
  }

  Widget _buildPendingContent() {
    return BlocProvider(
      create: (context) => FetchAllPendingServicesBloc(
        FetchAllBookedServiceRepo(
            FetchAllBookedServiceDetails(), AuthLocalService()),
      )..add(FetchAllBookedPendingServicesEvent()),
      child: Scaffold(
        body: PaddingWidgetBooking(
          child: BlocBuilder<FetchAllPendingServicesBloc,
              FetchAllPendingServicesState>(builder: (context, state) {
            if (state is FetchAllPendingServicesLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FetchAllPendingServicesSuccessState) {
              final services = state.fetchAllBookedServiceModel;

              return ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return Card(
                    color: AppColor.background,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: PaddingWidget(
                      // padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: service.serviceImg.isNotEmpty
                                    ? NetworkImage(service.serviceImg)
                                    : const AssetImage(AppPngPath.homeCleanTwo),
                                // onBackgroundImageError:
                                //     (exception, stackTrace) {
                                //   // Optionally handle image loading errors here
                                // },
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    service.serviceName,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Booking ID:${service.id}',
                                    style: const TextStyle(
                                      color: AppColor.toneThree,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Work Status',
                                style: TextStyle(
                                  color: AppColor.toneThree,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Chip(
                                side: BorderSide.none,
                                label: Text(
                                  service.status,
                                  style:
                                      const TextStyle(color: AppColor.toneSix),
                                ),
                                backgroundColor:
                                    AppColor.toneSix.withOpacity(0.2),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Payment Status',
                                style: TextStyle(
                                  color: AppColor.toneThree,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Chip(
                                side: BorderSide.none,
                                label: const Text(
                                  'Pending',
                                  style: TextStyle(color: AppColor.toneSix),
                                ),
                                backgroundColor:
                                    AppColor.toneSix.withOpacity(0.2),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                          AppColor.toneThree.withOpacity(0.7),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                        "assets/svg/booking_one.svg"),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                DateFormat('dd-MM-yyyy')
                                    .format(service.createdAt),
                                style: const TextStyle(
                                  color: AppColor.secondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          FutureBuilder<String>(
                            future: _getLocationName(
                                service.latitude, service.longitude),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColor.toneThree
                                                .withOpacity(0.7),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              "assets/svg/booking_two.svg"),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      'Fetching location...',
                                      style: TextStyle(
                                        color: AppColor.secondary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                );
                              } else if (snapshot.hasError) {
                                return Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColor.toneThree
                                                .withOpacity(0.7),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              "assets/svg/booking_two.svg"),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Error fetching location',
                                      style: const TextStyle(
                                        color: AppColor.secondary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColor.toneThree
                                                .withOpacity(0.7),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              "assets/svg/booking_two.svg"),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        snapshot.data ?? 'Unknown location',
                                        style: const TextStyle(
                                          color: AppColor.secondary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          )
                          // const Divider(),
                          // Align(
                          //   alignment: Alignment.centerRight,
                          //   child: ElevatedButton(
                          //     onPressed: () {},
                          //     style: ElevatedButton.styleFrom(
                          //       backgroundColor:
                          //           AppColor.toneSeven.withOpacity(0.8),
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(8),
                          //       ),
                          //     ),
                          //     child: const Text(
                          //       'Cancel',
                          //       style: TextStyle(color: AppColor.background),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is FetchAllPendingServicesFailState) {
              return const Center(child: Text('Failed to fetch services.'));
            } else {
              return const Center(child: Text('No data available.'));
            }
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPendingContent(),
    );
  }
}
