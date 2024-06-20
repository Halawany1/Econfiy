import 'package:econfiy/controller/profile/profile_cubit.dart';
import 'package:econfiy/modules/sign_up/sign_up_screen.dart';
import 'package:econfiy/shared/component/material_button.dart';
import 'package:econfiy/shared/component/snak_bar_component.dart';
import 'package:econfiy/shared/component/text_form_field.dart';
import 'package:econfiy/shared/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_icons/solar_icons.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var cubit = context.read<ProfileCubit>();
    var formKey = GlobalKey<FormState>();
    nameController.text=cubit.profileModel!.data!.user!.name!;
    emailController.text=cubit.profileModel!.data!.user!.email!;

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if(state is SuccessUpdateProfileState){
          Navigator.pop(context);
        }
        if(state is ErrorUpdateProfileState){
          showMessageResponse(message: state.error,
              context: context, success: false);
        }
      },
      builder: (context, state) {
        var cubit = context.read<ProfileCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Edit Profile'),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding:  EdgeInsets.all(20.h),
                child: Column(
                  children: [
                    SizedBox(height: 20.h,),
                    CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.grey.shade200,
                      child: Icon(
                        SolarIconsOutline.user,
                        size: 30.r,
                      ),
                    ),
                    SizedBox(height: 35.h,),
                    BuildTextFormField(
                        controller: nameController,
                        maxLength: 40,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        hintText: 'Name'),
                    SizedBox(
                      height: 15.h,
                    ),
                    BuildTextFormField(
                        controller: emailController,
                        maxLength: 120,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else if (!isValidEmail(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        hintText: 'Email Address'),
                    SizedBox(
                      height: 30.h,
                    ),

                    state is LoadingUpdateProfileState ?
                     Center(child: CircularProgressIndicator(
                      color: ColorConstant.generalColor,))
                        : BuildMaterialButton(
                      text: 'Save',
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          cubit.updateProfile(
                            id: cubit.profileModel!.data!.user!.id!,
                            email: emailController.text,
                            name: nameController.text,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
