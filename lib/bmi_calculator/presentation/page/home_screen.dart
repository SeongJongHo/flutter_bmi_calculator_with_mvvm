import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/presentation/enum/weight_category.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/presentation/view_model/home_screen_view_model.dart';

class HomeScreen extends StatefulWidget {
  final HomeScreenViewModel _viewModel;

  const HomeScreen({super.key, required HomeScreenViewModel viewModel})
      : _viewModel = viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cmController = TextEditingController();
  final TextEditingController _kgController = TextEditingController();

  void updateUI() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget._viewModel.addListener(updateUI);
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    await widget._viewModel.findAll();
  }

  @override
  void dispose() {
    _cmController.dispose();
    _kgController.dispose();
    widget._viewModel.removeListener(updateUI);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI 계산기'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 16),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _cmController,
                        decoration: InputDecoration(
                          hintText: '키를 적어주세요',
                          labelText: '키',
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          floatingLabelBehavior:
                              FloatingLabelBehavior.always, // 항상 라벨 표시
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _kgController,
                          decoration: InputDecoration(
                            hintText: '몸무게를 적어주세요',
                            labelText: '몸무게',
                            labelStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _resultButtonPressed(context),
                          child: const Text('계산'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Column(children: [
                  Column(
                    children: [
                      Text('최근 결과'),
                      ..._buildResult((widget._viewModel.bmiList.isNotEmpty
                          ? widget._viewModel.bmiList.first.bmi.toDouble()
                          : -1)),
                      Divider()
                    ],
                  ),
                  ...widget._viewModel.bmiList.map(
                    (e) => Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text('키: ${e.cm}cm, 몸무게: ${e.kg}kg'),
                          Text('BMI: ${e.bmi}'),
                          Text('BMI 검사일: ${e.createdTime}'),
                        ],
                      ),
                    ),
                  )
                ])
              ],
            ),
          ),
        ));
  }

  void _resultButtonPressed(BuildContext context) async {
    final double? cm = double.tryParse(_cmController.text);
    final double? kg = double.tryParse(_kgController.text);

    if (kg == null || cm == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('입력 오류'),
            content: const Text('키와 몸무게를 숫자로 입력해주세요.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('확인'),
              ),
            ],
          );
        },
      );
      return;
    }

    widget._viewModel.save(cm, kg);
  }

  List<Widget> _buildResult(double bmi) {
    return WeightCategory.getCategory(bmi).getWidget();
  }
}
