import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/deputizations%20bloc/deputizations_bloc.dart';
import 'package:salvest_app/presentation/certification/widgets/deputization_item.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/somthing_wrong.dart';
import 'package:salvest_app/utility/elevated_button_widget.dart';

class DeputizationsView extends StatefulWidget {
  const DeputizationsView({super.key});

  @override
  State<DeputizationsView> createState() => _DeputizationsViewState();
}

class _DeputizationsViewState extends State<DeputizationsView> {
  @override
  void initState() {
    super.initState();
    context.read<DeputizationsBloc>().add(GetDeputizationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text(
          'Deputizations',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<DeputizationsBloc, DeputizationsState>(
        builder: (context, state) {
          if (state is GetDeputizationsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is GetDeputizationsSuccess) {
            final deputizations = state.deputizationsResponse.data?.deputizations ?? [];
            
            if (deputizations.isEmpty) {
              return SomethingWrongWidget(
                title: "No deputizations found!",
                svgPath: 'assets/images/search.svg',
                elevatedButtonWidget: ElevatedButtonWidget(
                  title: "Refresh",
                  onPressed: () {
                    context.read<DeputizationsBloc>().add(GetDeputizationsEvent());
                  },
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<DeputizationsBloc>().add(GetDeputizationsEvent());
              },
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: deputizations.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final deputization = deputizations[index];
                  return DeputizationItem(deputization: deputization);
                },
              ),
            );
          }

          if (state is GetDeputizationsFailure) {
            return SomethingWrongWidget(
              title: "Failed to load deputizations",
              svgPath: 'assets/images/no-internet.svg',
                              elevatedButtonWidget: ElevatedButtonWidget(
                  title: "Retry",
                  onPressed: () {
                    context.read<DeputizationsBloc>().add(GetDeputizationsEvent());
                  },
                ),
            );
          }

          return const Center(
            child: Text("No data available"),
          );
        },
      ),
    );
  }
}
