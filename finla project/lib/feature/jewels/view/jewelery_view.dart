import 'package:dev_template/feature/jewels/cubit/jewelery_cubit.dart';
import 'package:dev_template/feature/jewels/cubit/jewelery_state.dart';
import 'package:dev_template/feature/jewels/service/jewelery_service.dart';
import 'package:dev_template/product/core/model/jewelery.dart';
import 'package:dev_template/product/utils/localization/locale_keys.g.dart';
import 'package:dev_template/product/utils/service/dio_service_manager.dart';
import 'package:dev_template/product/widget/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class JeweleryView extends StatefulWidget {
  const JeweleryView({super.key});

  @override
  State<JeweleryView> createState() => _PostViewState();
}

class _PostViewState extends State<JeweleryView>
    with AutomaticKeepAliveClientMixin<JeweleryView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<JeweleryCubit>(
      create: (context) => JeweleryCubit(
        JeweleryService(
          DioServiceManager(),
        ),
      )..getJewelery(),
      child: const _JeweleryBody(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

final class _JeweleryBody extends StatelessWidget {
  const _JeweleryBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: LocaleKeys.jewelery_title,
        ),
      ),
      body: BlocBuilder<JeweleryCubit, JeweleryState>(
        builder: (context, state) {
          switch (state.status) {
            case JeweleryStatus.initial:
              return const _InitialField._();
            case JeweleryStatus.loading:
              return const _LoadingField._();
            case JeweleryStatus.loaded:
              return const _JeweleryList._();
            case JeweleryStatus.error:
              return const _ErrorField._();
          }
        },
      ),
    );
  }
}

final class _LoadingField extends StatelessWidget {
  const _LoadingField._();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

final class _InitialField extends StatelessWidget {
  const _InitialField._();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

final class _ErrorField extends StatelessWidget {
  const _ErrorField._();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<JeweleryCubit, JeweleryState, String>(
      selector: (state) => state.error,
      builder: (context, state) {
        return Center(
          child: Text(state),
        );
      },
    );
  }
}

final class _JeweleryList extends StatelessWidget {
  const _JeweleryList._();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<JeweleryCubit, JeweleryState, List<Jewelery>>(
      selector: (state) => state.products,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              mainAxisExtent: 300,
            ),
            itemCount: state.length,
            itemBuilder: (context, index) {
              final post = state[index];
              return Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.network(
                      post.image ?? '',
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: post.title ?? '',
                          ),
                          const SizedBox(height: 8),
                          CustomText(
                            text: post.price.toString(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
