import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../theme/theme_cubit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int clickCount = 0;
  List<String> messages = [];
  String message = '';

  void PlusClick(ThemeMode themeMode) {
    if (themeMode == ThemeMode.dark) {
      clickCount += 3;
      emit(ClickState(clickCount));
    } else {
      clickCount++;
      emit(ClickState(clickCount));
    }
/*
    if (clickCount >= 100) {
      emit(FinishState());
    }*/

    message = "Значение кликера: $clickCount. Тема: ${themeMode.name}";

    messages.add(message);
  }

  void MinusClick(ThemeMode themeMode) {
    if (themeMode == ThemeMode.dark) {
      clickCount -= 3;
    } else {
      clickCount--;
    }

    message = "Значение кликера: $clickCount. Тема: ${themeMode.name}";

    emit(ClickState(clickCount));

    messages.add(message);
  }

  void themeSwitched(BuildContext context) {
    messages
        .add('Смена темы на - ${context.read<ThemeCubit>().themeMode.name}');
  }
}
