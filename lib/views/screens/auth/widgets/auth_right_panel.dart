import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_assets.dart';

class AuthRightPanel extends StatelessWidget {
  const AuthRightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final mh = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0C76E1),
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage(AppAssets.loginDashBoardBG),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: mh * 0.06,
            left: mh * 0.05,
            right: mh * 0.05,
            child: const Column(
              children: [
                Text(
                  "Complete Control of Your Cafe &",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Restaurant with Ease",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "From billing to inventory access everything you need\nin a single powerful dashboard.",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              AppAssets.loginDashBoard,
              height: mh * 0.5,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
