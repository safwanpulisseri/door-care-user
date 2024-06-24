part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class OnboardingInitial extends OnboardingState {
  final int index;
  OnboardingInitial({required this.index});

  @override
  List<Object?> get props => [index];
}

final class SkipOnboarding extends OnboardingState {}
