import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart' show GoRouter;
import 'package:salvest_app/business_logic/get%20suer%20properties%20owner%20ship%20bloc/get_user_properties_owner_ship_e_bloc.dart';
import 'package:salvest_app/business_logic/search%20user%20email%20bloc/search_user_email_bloc.dart';
import 'package:salvest_app/presentation/certification/widgets/stake_certificationI_tem.dart';
import 'package:salvest_app/presentation/certification/widgets/stake_certificationI_tem_shimmer.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/elevated_button_widget.dart';
import 'package:salvest_app/utility/somthing_wrong.dart'; // Assuming you have this

class OwneredStakesCretifications extends StatelessWidget {
  const OwneredStakesCretifications({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<
      GetUserPropertiesOwnerShipEBloc,
      GetUserPropertiesOwnerShipEState
    >(
      listener: (context, state) {
        if (state is TransferPropertiesOwnerShipLoading) {
          EasyLoading.show(status: 'loading...');
        }
        if (state is TransferPropertiesOwnerShipSuccess) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess(state.message);
          context.read<GetUserPropertiesOwnerShipEBloc>().add(
            GetOwneredProprtiesEvent(),
          );
        }
        if (state is TransferPropertiesOwnerShipFailure) {
          EasyLoading.dismiss();
          EasyLoading.showError(state.helperResponse.fullBody!['error']);
          context.read<GetUserPropertiesOwnerShipEBloc>().add(
            GetOwneredProprtiesEvent(),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => GoRouter.of(context).pop(),
          ),
          title: const Text(
            'My Certifications',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          backgroundColor: AppColors.green15,
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<
            GetUserPropertiesOwnerShipEBloc,
            GetUserPropertiesOwnerShipEState
          >(
            builder: (context, state) {
              if (state is GetUserPropertiesOwnerShipLoading ||
                  state is GetUserPropertiesOwnerShipEInitial ||
                  state is TransferPropertiesOwnerShipLoading ||
                  state is TransferPropertiesOwnerShipSuccess) {
                return ListView.builder(
                  itemCount: 6, // shimmer placeholders count
                  itemBuilder:
                      (context, index) =>
                          const OwneredCertificationItemShimmer(),
                );
              }

              if (state is GetUserPropertiesOwnerShipEInitial) {
                ListView.builder(
                  itemCount: 6, // shimmer placeholders count
                  itemBuilder:
                      (context, index) =>
                          const OwneredCertificationItemShimmer(),
                );
              }
              if (state is GetUserPropertiesOwnerShipSuccess &&
                  state.getUserPropertiesOwnerShipResposne.data!.isNotEmpty) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<GetUserPropertiesOwnerShipEBloc>().add(
                      GetOwneredProprtiesEvent(),
                    );
                  },
                  child: ListView.separated(
                    itemCount:
                        state.getUserPropertiesOwnerShipResposne.data!.length,
                    separatorBuilder:
                        (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item =
                          state.getUserPropertiesOwnerShipResposne.data![index];
                      // final cert = items[index]["certificate"];
                      // final invest = items[index]["investment"];

                      return OwneredCertificationItem(
                        location: item.propertyLocation!,
                        chances: item.numberChance!,
                        amount: item.price!,
                        onTransferPressed:
                            () =>
                                showTransferDialog(context, item.investmentId!),
                      );
                    },
                  ),
                );
              }
              if (state is GetUserPropertiesOwnerShipSuccess &&
                  state.getUserPropertiesOwnerShipResposne.data!.isEmpty) {
                return SomethingWrongWidget(
                  title: "No Requests found!",
                  svgPath: 'assets/images/search.svg',
                  elevatedButtonWidget: ElevatedButtonWidget(
                    title: "Refresh",
                    onPressed:
                        () => context
                            .read<GetUserPropertiesOwnerShipEBloc>()
                            .add(GetOwneredProprtiesEvent()),
                  ),
                );
              }

              return SomethingWrongWidget(
                elevatedButtonWidget: ElevatedButtonWidget(
                  title: "Refresh",
                  onPressed: () {
                    context.read<GetUserPropertiesOwnerShipEBloc>().add(
                      GetOwneredProprtiesEvent(),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

void showTransferDialog(BuildContext context, int certificateId) {
  final TextEditingController emailController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final bloc = context.read<GetUserPropertiesOwnerShipEBloc>();
  showDialog(
    context: context,
    builder: (context) {
      return BlocProvider.value(
        value: context.read<SearchUserEmailBloc>(),
        child: StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Transfer Ownership"),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Enter the recipient's email:"),
                    const SizedBox(height: 12),
                    TextField(
                      focusNode: focusNode,
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "User Email",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        if (value.trim().isNotEmpty) {
                          context.read<SearchUserEmailBloc>().add(
                            SearhForUserEvent(email: value.trim()),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    BlocBuilder<SearchUserEmailBloc, SearchUserEmailState>(
                      builder: (context, state) {
                        if (state is SearchUserEmailLoading) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is SearchUserEmailSuccess) {
                          final user = state.searchUserResponse.data;
                          if (user == null || user.isEmpty) {
                            return const Text("No user found.");
                          }
                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.4,
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: user.length,
                              itemBuilder: (context, index) {
                                final item = user[index];
                                return InkWell(
                                  onTap: () {
                                    bloc.add(
                                      TransferOwneredProprties(
                                        newUserId: item.userId!,
                                        certificateId: certificateId,
                                      ),
                                    );
                                  },
                                  child: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(item.name ?? item.email ?? ''),
                                    subtitle: Text(item.email ?? ''),
                                    onTap: () {
                                      bloc.add(
                                        TransferOwneredProprties(
                                          newUserId: item.userId!,
                                          certificateId: certificateId,
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                      // ScaffoldMessenger.of(
                                      //   context,
                                      // ).showSnackBar(
                                      //   SnackBar(
                                      //     content: Text(
                                      //       "Ownership transfer request sent to ${item.email}",
                                      //     ),
                                      //   ),
                                      // );
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        }

                        if (state is SearchUserEmailFailure) {
                          return const Text("Failed to search user.");
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
