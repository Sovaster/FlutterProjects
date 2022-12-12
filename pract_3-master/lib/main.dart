import 'package:flutter/material.dart';
//import 'package:pract_3/cubit/click_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pract_3/cubit/home/home_cubit.dart';
import 'package:pract_3/provider/themes.dart';

import 'cubit/theme/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: context.read<ThemeCubit>().themeMode,
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          home: MyHomePage(),
        );
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is ClickState) {
                  if (state.clickCount >= 50) {
                    return Text(
                      'You Win!!!',
                      style: TextStyle(
                          color: Color.fromARGB(255, 72, 255, 0), fontSize: 40),
                    );
                  }
                  if (state.clickCount <= -50) {
                    return Text(
                      'You Lose!!!',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 0, 0), fontSize: 40),
                    );
                  }
                }
                return Container();
              },
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is ClickState) {
                  count = state.clickCount;

                  return Text(
                    state.clickCount.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                return Text(
                  '0',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<HomeCubit>()
                            .PlusClick(context.read<ThemeCubit>().themeMode);
                      },
                      child: const Icon(Icons.arrow_upward,
                          color: Color.fromARGB(255, 0, 255, 13)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<HomeCubit>()
                            .MinusClick(context.read<ThemeCubit>().themeMode);
                      },
                      child: const Icon(Icons.arrow_downward,
                          color: Color.fromARGB(255, 255, 0, 0)),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              height: 300,
              child: Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Center(
                          child:
                              Text(context.read<HomeCubit>().messages[index]),
                        );
                      },
                      itemCount: context.read<HomeCubit>().messages.length,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              context.read<ThemeCubit>().changeTheme();
              context.read<HomeCubit>().themeSwitched(context);
            },
            child: Icon(
                state is LightThemeState
                    ? Icons.accessibility_new
                    : Icons.accessible,
                color: Color.fromARGB(255, 251, 255, 0)),
          );
        },
      ),
    );
  }
}
