import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      surfaceTintColor: Colors.transparent,
      backgroundColor: const Color(0xff101010),
      centerTitle: true,
      title: Container(
        padding: const EdgeInsets.all(15),
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 20,
            fontWeight: FontWeight.w100,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/egnitify.png",
                height: 25,
                fit: BoxFit.scaleDown,
                cacheHeight: 25,
              ),
              const SizedBox(width: 80),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: const Text('Home'),
              ),
              const SizedBox(width: 25),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: const Text('Expertise'),
              ),
              const SizedBox(width: 25),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: const Text('Products'),
              ),
              const SizedBox(width: 25),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: const Text('About'),
              ),
              const SizedBox(width: 80),
              const Text('Contact'),
            ],
          ),
        ),
      ),
    );
  }
}
