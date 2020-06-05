import 'package:flutter/material.dart';
import 'package:temis/User/ui/widgets/home/profile/settings_profile.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      flexibleSpace: Center(
        widthFactor: 0.1,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "TEMIS",
                style: Theme.of(context).textTheme.headline5.copyWith(
                    fontSize: 22, color: Theme.of(context).colorScheme.primary),
              ),
              IconButton(
                //padding: EdgeInsets.all(0.0),
                color: Theme.of(context).colorScheme.primary,
                icon: Icon(
                  Icons.more_vert,
                  size: 10.0,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.black12,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        child: SettingsProfile(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      elevation: 0,
    );
  }
}
