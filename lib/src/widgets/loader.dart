import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/injection_container.dart';
import '../bloc/loader_cubit.dart';
import '../bloc/loader_state.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoaderCubit, LoaderState>(
      bloc: sl<LoaderCubit>(),
      builder: (context, state) {
        if (!state.isLoading) return SizedBox.shrink();
        return Stack(
          children: [
            Opacity(
              opacity: 0.3,
              child: ModalBarrier(dismissible: false, color: Colors.black),
            ),
            Center(child: CircularProgressIndicator()),
          ],
        );
      },
    );
  }
}
