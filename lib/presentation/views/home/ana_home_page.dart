import 'package:ana_base_app/presentation/views/home/viewmodels/viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:meutrabalhoapp/meu_trabalho_mobile.dart' hide tr;
import 'package:skeleton/skeleton_module_routing.dart';

import '../../presentation.dart';

class AnaHomePage extends StatefulWidget {
  /// Creates a [AnaBaseAppWidget]
  const AnaHomePage({Key? key}) : super(key: key);

  @override
  State<AnaHomePage> createState() => _AnaHomePageState();
}

class _AnaHomePageState extends ViewState<AnaHomePage, AnaHomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //     Center(
          //   child: Column(
          //     children: [
          //       Text('Ana Home ' + tr.core.test),
          //       ElevatedButton(
          //           onPressed: () => Nav.navigate(MeuTrabalhoRouting.home),
          //           child: Text('Ir para Meu Trabalho'))
          //     ],
          //   ),
          // )
          ViewModelBuilder<AnaHomeViewModel, AnaHomeState>(
        viewModel: viewModel,
        buildWhen: (previous, current) {
          return previous.session != current.session;
        },
        builder: ((context, state) {
          return Padding(
            padding: EdgeInsets.all(Spacing.lg.value),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    CoreAssets.anaLogo.keyName,
                  ),
                  Column(
                    children: [
                      ContainedButton.large(
                        onPressed: () {
                          Nav.pushNamed(SkeletonRouting.multaList);
                        },
                        child: Text(tr.ana.apps.skeleton),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ContainedButton.large(
                        onPressed: () {
                          Nav.pushNamed(MeuTrabalhoRouting.admissionDicas);
                        },
                        child: Text(tr.ana.apps.meuTrabalho),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}


// class AnaHomePage extends StatefulWidget {
//   const AnaHomePage({Key? key}) : super(key: key);

//   @override
//   State<AnaHomePage> createState() => _AnaHomePageState();
// }

// class _AnaHomePageState extends ViewState<AnaHomePage, AnaHomeViewModel> {
//   final TextEditingController _textEditingController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//           //     Center(
//           //   child: Column(
//           //     children: [
//           //       Text('Ana Home ' + tr.core.test),
//           //       ElevatedButton(
//           //           onPressed: () => Nav.navigate(MeuTrabalhoRouting.home),
//           //           child: Text('Ir para Meu Trabalho'))
//           //     ],
//           //   ),
//           // )
//           ViewModelBuilder<AnaHomeViewModel, AnaHomeState>(
//         viewModel: viewModel,
//         buildWhen: (previous, current) {
//           return previous.session != current.session;
//         },
//         builder: ((context, state) {
//           return Center(
//             child: Column(
//               children: [
//                 TextField(
//                   controller: _textEditingController,
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 ElevatedButton(
//                     onPressed: () {
//                       viewModel.saveSession(
//                           Session(apikey: _textEditingController.text));
//                     },
//                     child: Text('Salvar código')),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 ElevatedButton(onPressed: () {}, child: Text('Ler código')),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 if (viewModel.state.session != null)
//                   Text('Seu código é: ${viewModel.state.session!.apikey}'),
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
