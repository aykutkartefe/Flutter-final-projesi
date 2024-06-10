import 'package:dev_template/feature/jewel/cubit/jewel_cubit.dart';
import 'package:dev_template/feature/jewel/cubit/jewel_state.dart';
import 'package:dev_template/product/core/model/jewel.dart';
import 'package:dev_template/product/utils/localization/locale_keys.g.dart';
import 'package:dev_template/product/utils/service/json_service.dart';
import 'package:dev_template/product/widget/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class JewelView extends StatelessWidget {
  const JewelView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JewelCubit>(
      create: (context) => JewelCubit(
        JsonService(),
      )..getJewel(),
      child: const _ShoesBody(),
    );
  }
}

final class _ShoesBody extends StatelessWidget {
  const _ShoesBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: LocaleKeys.products_title,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'add',
        onPressed: () {
          context.read<JewelCubit>().loadShoesFromFile();
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<JewelCubit, JewelState>(
        builder: (context, state) {
          switch (state.status) {
            case JewelStatus.loading:
              return const _LoadingField();
            case JewelStatus.success:
              return const _ShoesListField._();
            case JewelStatus.failure:
              return const _ErrorField._();
            case JewelStatus.initial:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

final class _ErrorField extends StatelessWidget {
  const _ErrorField._();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<JewelCubit, JewelState, String>(
      selector: (state) => state.error!,
      builder: (context, state) {
        return Center(
          child: Text(state),
        );
      },
    );
  }
}

final class _LoadingField extends StatelessWidget {
  const _LoadingField();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

final class _ShoesListField extends StatelessWidget {
  const _ShoesListField._();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<JewelCubit, JewelState, List<Jewel>>(
      selector: (state) => state.shoes,
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            final shoe = state[index];
            return ListTile(
              title: Text(shoe.brand.toString()),
              trailing: Text('${shoe.price} \$'),
              subtitle: Text('${shoe.brand}'),
            );
          },
        );
      },
    );
  }
}
