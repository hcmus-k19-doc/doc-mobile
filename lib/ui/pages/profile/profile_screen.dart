import 'package:flutter/material.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_app/bloc/profile_bloc/profile_bloc.dart';
import 'package:flutter_app/constants/api_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/repositories/user_repository.dart';
import 'package:flutter_app/ui/pages/profile/widgets/title_textfield_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ProfileBloc(UserRepository("${UrlConst.DOC_SERVICE_URL}/users"))
            ..add(FetchCurrentProfile()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.mainPage("MY_PROFILE"),
            style: headLineSmall(context)?.copyWith(color: Colors.white),
          ),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          if (state is ProfileLoading || state is ProfileInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileError) {
            return Center(
              child: Text(state.errorMsg),
            );
          }
          if (state is ProfileSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(StyleConst.defaultPadding20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleTextFieldWidget(
                      title: AppLocalizations.of(context)!.name,
                      initialText: state.currentProfile.fullName!,
                      isTextReadOnly: true,
                    ),
                    const SizedBox(
                      height: StyleConst.defaultPadding16,
                    ),
                    TitleTextFieldWidget(
                      title: AppLocalizations.of(context)!.username,
                      initialText: state.currentProfile.username!,
                      isTextReadOnly: true,
                    ),
                    const SizedBox(
                      height: StyleConst.defaultPadding16,
                    ),
                    TitleTextFieldWidget(
                      title: "Email",
                      initialText: state.currentProfile.email!,
                      isTextReadOnly: true,
                    ),
                    const SizedBox(
                      height: StyleConst.defaultPadding16,
                    ),
                    TitleTextFieldWidget(
                      title: AppLocalizations.of(context)!.userID,
                      initialText: state.currentProfile.id.toString(),
                      isTextReadOnly: true,
                    ),
                    const SizedBox(
                      height: StyleConst.defaultPadding16,
                    ),
                    TitleTextFieldWidget(
                      title: AppLocalizations.of(context)!.role,
                      initialText: AppLocalizations.of(context)!
                          .selectRoleProfile(state.currentProfile.role!),
                      isTextReadOnly: true,
                    ),
                    const SizedBox(
                      height: StyleConst.defaultPadding16,
                    ),
                    TitleTextFieldWidget(
                      title: AppLocalizations.of(context)!.department,
                      initialText:
                          state.currentProfile.department!.departmentName!,
                      isTextReadOnly: true,
                    ),
                    const SizedBox(
                      height: StyleConst.defaultPadding24,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MyRouter.changePassword);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    StyleConst.defaultRadius15))),
                        child: Text(
                            AppLocalizations.of(context)!.changePassword,
                            style: bodyLargeBold(context)!
                                .copyWith(color: Colors.white, height: 0)),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
