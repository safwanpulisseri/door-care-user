part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

final class SkipOnboardingEvent extends OnboardingEvent {}

final class ScrollOnboardingEvent extends OnboardingEvent {
  final int index;
  ScrollOnboardingEvent({required this.index});
}
