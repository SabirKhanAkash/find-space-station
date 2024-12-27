import 'package:find_space_station/utils/config/app_color.dart';
import 'package:find_space_station/utils/config/app_text.dart';
import 'package:find_space_station/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

Widget buildHomeBody(BuildContext context) {
  return Center(child: Consumer<HomeViewModel>(builder: (ctx, data, _) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset('assets/icons/ic_lottie_satelite_home.json',
                fit: BoxFit.cover, frameRate: const FrameRate(144)),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    "Current Latitude: ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.issCurrentLat,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    "Current Longitude: ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.issCurrentLng,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    "Last Updated at (UTC): ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.lastUpdatedTimeInUtc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    "Last Updated at (Local): ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.lastUpdatedTime,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    "Currently Above Country: ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: data.locationStatus == "" ||
                          data.locationStatus == AppText().locationNotFetched
                      ? Text(
                          data.issOnCountry,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      : Text(
                          "${data.issOnCountry} (${data.locationStatus})",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: data.isLoading == true
                  ? Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: AppColor().lightGray,
                      ),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: AppColor().primary,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () async {
                        await data.getIssCurrentLocation();
                        if (data.isIssOnMyCountry == true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: AppColor().primary,
                                duration: const Duration(milliseconds: 250),
                                content: Text(
                                    style: TextStyle(color: AppColor().white),
                                    AppText().issOnMyCountryText)),
                          );
                        } else if (data.issOnCountry == 'Unknown') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                duration: const Duration(milliseconds: 150),
                                content: Text(
                                    style: TextStyle(color: AppColor().white),
                                    AppText().issCountryNotFound)),
                          );
                        } else if (data.error != "N/A") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                duration: const Duration(milliseconds: 150),
                                backgroundColor: AppColor().red,
                                content: Text(
                                    style: TextStyle(color: AppColor().white), AppText().errorMsg)),
                          );
                        }
                      },
                      child: Text(
                        "Refresh (${data.seconds}s)",
                        style: TextStyle(color: AppColor().white),
                      )),
            )
          ],
        ),
      ),
    );
  }));
}
