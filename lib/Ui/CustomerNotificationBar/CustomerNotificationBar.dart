import 'package:autopart/Ui/VendorUi/VendorRequests.dart';
import 'package:autopart/Ui/splash_screen/bloc/loginbloc_bloc.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustpmerNotificationsBar {
  LoginblocBloc p;

  Widget appbar(BuildContext context ,bool isvendor) {
    int count = 0;
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      centerTitle: false,
      actions: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                'assets/images/Messages.svg',
                width: 24,
                height: 24,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: lightRed,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(
                      "$count",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 6,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        InkWell(
          onTap: () {
            context.read<LoginblocBloc>().add(ZeroNotification());
          
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VendorNotificatios()));
          },
          child: BlocBuilder(
            bloc: p,
            builder: (context, state) {
              if (state is GetNotifications) {
                print("here from the state is app bar");
                count = state.number;
              }
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      'assets/images/notifications.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  (count != 0)
                      ? Positioned(
                          bottom: 10,
                          left: 10,
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: lightRed,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  "$count",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 6,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
