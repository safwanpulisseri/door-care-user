import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial(index: 0)) {
    on<SkipOnboardingEvent>((event, emit) {});

    on<ScrollOnboardingEvent>((event, emit) {
      emit(OnboardingInitial(index: event.index));
    });
  }
}
