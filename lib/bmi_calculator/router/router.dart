import 'package:flutter_bmi_calculator/bmi_calculator/core/use_case/impl/bmi_use_case_impl.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/data/data_source/impl/bmi_api_impl.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/data/repository/impl/bmi_repository_impl.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/presentation/page/home_screen.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/presentation/page/bmi_result.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/presentation/view_model/home_screen_view_model.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/bmi/home',
  routes: [
    GoRoute(
      path: '/bmi/home',
      builder: (context, state) {
        return HomeScreen(
          viewModel: HomeScreenViewModel(
            bmiUseCase: BmiUseCaseImpl(
              bmiRepository: BmiRepositoryImpl(
                bmiApi: BmiApiImpl(),
              ),
            ),
          ),
        );
      },
    ),
    // GoRoute(
    //   path: '/bmi/result',
    //   builder: (context, state) {
    //     final uri = Uri.parse(state.uri.toString());
    //     return BmiResult(
    //         cm: double.tryParse(uri.queryParameters['cm']!) ?? 0.0,
    //         weight: double.tryParse(uri.queryParameters['weight']!) ?? 0.0);
    //   },
    // ),
  ],
);
