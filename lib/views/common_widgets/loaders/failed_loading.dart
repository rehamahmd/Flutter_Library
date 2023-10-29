
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FailedLoading extends StatelessWidget {
  final String? message;
  final VoidCallback ?onReload;

  const FailedLoading({
    Key ?key,
    this.message,
    this.onReload,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 3,
            child: Image(
              image: AssetImage(
                  "assets/images/request_error.png"
              ),
              fit: BoxFit.contain,
            ),
          ),
          //SizedBox(height: 8,),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                  message?? "Error Request Failed",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.refresh_rounded),
                    Text("Refresh?"),
                  ],
                ),
                style: TextButton.styleFrom(
                  primary: Theme.of(context).colorScheme.primary,
                  textStyle: Theme.of(context).textTheme.subtitle2?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  //side: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                onPressed: onReload,
              ),
            ],
          ),
         //SizedBox(height: 16,),
        ],
      ),
    );
  }
}
