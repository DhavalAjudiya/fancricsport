import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/res/assets_path.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:fancricsport/widget/app_text.dart';
import 'package:fancricsport/widget/image_lodar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

cricketCard({
  String? toss,
  String? header,
  String? result,
  String? subHeader,
  String? t1,
  String? t2,
  String? i1,
  String? i2,
  int? status,
  String? time,
  String? startTime,
  String? venue,
  String r1 = "00",
  String r2 = "00",
  bool showDate = false,
  GestureTapCallback? onTap,
}) {
  if ((toss?.isEmpty ?? false) && (result?.isEmpty ?? false)) {
    status = 0;
  } else if (result?.isEmpty ?? false) {
    status = 2;
  } else {
    status = 1;
  }
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        showDate
            ? Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: AppText(
                  time.toString(),
                  color: AppColor.darkGrayTextDarkT,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeUtils.fSize_16(),
                ),
              )
            : const SizedBox(),
        Container(
          decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.screen,
              color: AppColor.bgColorDarkT,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  SizeUtils.horizontalBlockSize * 2,
                  SizeUtils.horizontalBlockSize * 1.7,
                  SizeUtils.horizontalBlockSize * 2,
                  0,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 2),
                  child: Row(
                    children: [
                      SizedBox(
                        width: SizeUtils.horizontalBlockSize * 65,
                        child: AppText(
                          header ?? "",
                          color: AppColor.darkGrayTextDarkT,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeUtils.fSize_13(),
                        ),
                      ),
                      const Spacer(),
                      AppText(
                        status == 0
                            ? "UpComing"
                            : status == 1
                                ? "Completed"
                                : "Live",
                        color: status == 0
                            ? AppColor.goldMainColor
                            : status == 1
                                ? AppColor.bronzeColor
                                : AppColor.greenTextDarkT,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeUtils.fSize_14(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeUtils.horizontalBlockSize * 1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeUtils.horizontalBlockSize * 1.5,
                    horizontal: SizeUtils.horizontalBlockSize * 2),
                child: Column(
                  children: [
                    Row(
                      children: [
                        imageLoader(
                          h: SizeUtils.horizontalBlockSize * 7,
                          w: SizeUtils.horizontalBlockSize * 7,
                          url: i1 ?? "",
                        ),
                        SizedBox(width: SizeUtils.horizontalBlockSize * 2),
                        AppText(
                          t1 ?? "",
                          color: AppColor.pureWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeUtils.fSize_15(),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: int.parse(r1.toString()) < int.parse(r2.toString())
                                ? AppColor.redColor
                                : AppColor.greenTextDarkT,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                            child: AppText(
                              r1 == "" ? "00" : r1,
                              color: AppColor.white,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeUtils.fSize_12(),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                    Row(
                      children: [
                        imageLoader(
                          h: SizeUtils.horizontalBlockSize * 7,
                          w: SizeUtils.horizontalBlockSize * 7,
                          url: i2 ?? "",
                        ),
                        SizedBox(width: SizeUtils.horizontalBlockSize * 2),
                        AppText(
                          t2 ?? "",
                          color: AppColor.white,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeUtils.fSize_15(),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            borderRadius: BorderRadius.circular(5),
                            color: int.parse(r1.toString()) > int.parse(r2.toString())
                                ? AppColor.redColor
                                : AppColor.greenTextDarkT,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: AppText(
                              r2 == "" ? "00" : r2,
                              color: AppColor.white,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeUtils.fSize_12(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: AppText(
                  startTime?.split("at ").last ?? "",
                  fontWeight: FontWeight.bold,
                  fontSize: SizeUtils.fSize_13(),
                  color: AppColor.darkGrayTextDarkT,
                ),
              ),
              status == 1
                  ? Center(
                      child: AppText(
                        result ?? "",
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtils.fSize_13(),
                        color: AppColor.bronzeColor,
                      ),
                    )
                  : status == 2
                      ? (result?.isNotEmpty ?? false)
                          ? Center(
                              child: AppText(
                                result ?? "",
                                fontWeight: FontWeight.bold,
                                fontSize: SizeUtils.fSize_13(),
                                color: AppColor.greenTextDarkT,
                                textAlign: TextAlign.center,
                              ),
                            )
                          : Center(
                              child: AppText(
                                toss ?? "",
                                fontWeight: FontWeight.bold,
                                fontSize: SizeUtils.fSize_13(),
                                color: AppColor.greenTextDarkT,
                                textAlign: TextAlign.center,
                              ),
                            )
                      : const SizedBox(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: SizeUtils.horizontalBlockSize * 1.5,
                  left: SizeUtils.horizontalBlockSize * 3.5,
                  right: SizeUtils.horizontalBlockSize * 3.5,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: SizeUtils.horizontalBlockSize * 20,
                      child: AppText(
                        subHeader ?? "",
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtils.fSize_12(),
                        color: AppColor.darkGrayTextDarkT,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: SizeUtils.horizontalBlockSize * 65,
                      child: AppText(
                        venue ?? "",
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtils.fSize_12(),
                        color: AppColor.darkGrayTextDarkT,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

upComingCard({
  String? toss,
  String? header,
  String? result,
  String? subHeader,
  String? t1,
  String? t2,
  String? i1,
  String? i2,
  int? status,
  String? time,
  String? startTime,
  String? venue,
  String r1 = "00",
  String r2 = "00",
  bool showDate = false,
  List<Color>? headerColor,
}) {
  return Column(
    children: [
      showDate
          ? Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: AppText(
                time?.split(" at").first.toString() ?? "",
                color: AppColor.darkGrayTextDarkT,
                fontWeight: FontWeight.w600,
                fontSize: SizeUtils.fSize_16(),
              ),
            )
          : const SizedBox(),
      Container(
        decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.screen,
            color: AppColor.bgColorDarkT,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                SizeUtils.horizontalBlockSize * 2,
                SizeUtils.horizontalBlockSize * 1.7,
                SizeUtils.horizontalBlockSize * 2,
                0,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 2),
                child: Row(
                  children: [
                    SizedBox(
                      width: SizeUtils.horizontalBlockSize * 65,
                      child: AppText(
                        header ?? "",
                        color: AppColor.darkGrayTextDarkT,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeUtils.fSize_13(),
                      ),
                    ),
                    const Spacer(),
                    AppText(
                      "UpComing",
                      color: AppColor.goldMainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeUtils.fSize_14(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeUtils.horizontalBlockSize * 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeUtils.horizontalBlockSize * 1.5,
                  horizontal: SizeUtils.horizontalBlockSize * 2),
              child: Column(
                children: [
                  Row(
                    children: [
                      imageLoader(
                        h: SizeUtils.horizontalBlockSize * 7,
                        w: SizeUtils.horizontalBlockSize * 7,
                        url: i1 ?? "",
                      ),
                      SizedBox(width: SizeUtils.horizontalBlockSize * 2),
                      AppText(
                        t1 ?? "",
                        color: AppColor.pureWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeUtils.fSize_15(),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: int.parse(r1.toString()) < int.parse(r2.toString())
                              ? AppColor.redColor
                              : AppColor.greenTextDarkT,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: AppText(
                            r1 == "" ? "00" : r1,
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            fontSize: SizeUtils.fSize_12(),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                  Row(
                    children: [
                      imageLoader(
                        h: SizeUtils.horizontalBlockSize * 7,
                        w: SizeUtils.horizontalBlockSize * 7,
                        url: i2 ?? "",
                      ),
                      SizedBox(width: SizeUtils.horizontalBlockSize * 2),
                      AppText(
                        t2 ?? "",
                        color: AppColor.white,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeUtils.fSize_15(),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(5),
                          color: int.parse(r1.toString()) > int.parse(r2.toString())
                              ? AppColor.redColor
                              : AppColor.greenTextDarkT,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: AppText(
                            r2 == "" ? "00" : r2,
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            fontSize: SizeUtils.fSize_12(),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: AppText(
                startTime ?? "",
                fontWeight: FontWeight.bold,
                fontSize: SizeUtils.fSize_13(),
                color: AppColor.darkGrayTextDarkT,
              ),
            ),
            /*status == 1
                ? Center(
                    child: AppText(
                      result ?? "",
                      fontWeight: FontWeight.bold,
                      fontSize: SizeUtils.fSize_13(),
                      color: AppColor.bronzeColor,
                    ),
                  )
                : status == 2
                    ? (result?.isNotEmpty ?? false)
                        ? Center(
                            child: AppText(
                              result ?? "",
                              fontWeight: FontWeight.bold,
                              fontSize: SizeUtils.fSize_13(),
                              color: AppColor.greenTextDarkT,
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Center(
                            child: AppText(
                              toss ?? "",
                              fontWeight: FontWeight.bold,
                              fontSize: SizeUtils.fSize_13(),
                              color: AppColor.greenTextDarkT,
                              textAlign: TextAlign.center,
                            ),
                          )
                    : const SizedBox(),*/
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: SizeUtils.horizontalBlockSize * 1.5,
                left: SizeUtils.horizontalBlockSize * 3.5,
                right: SizeUtils.horizontalBlockSize * 3.5,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: SizeUtils.horizontalBlockSize * 20,
                    child: AppText(
                      subHeader ?? "",
                      fontWeight: FontWeight.bold,
                      fontSize: SizeUtils.fSize_12(),
                      color: AppColor.darkGrayTextDarkT,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: SizeUtils.horizontalBlockSize * 65,
                    child: AppText(
                      venue ?? "",
                      fontWeight: FontWeight.bold,
                      fontSize: SizeUtils.fSize_12(),
                      color: AppColor.darkGrayTextDarkT,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

completedCard({
  String? toss,
  String? header,
  String? result,
  String? subHeader,
  String? t1,
  String? t2,
  String? i1,
  String? i2,
  int? status,
  String? time,
  String? startTime,
  String? venue,
  String r1 = "00",
  String r2 = "00",
  bool showDate = false,
  GestureTapCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        showDate
            ? Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: AppText(
                  time?.split(" at").first.toString() ?? "",
                  color: AppColor.darkGrayTextDarkT,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeUtils.fSize_16(),
                ),
              )
            : const SizedBox(),
        Container(
          decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.screen,
              color: AppColor.bgColorDarkT,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  SizeUtils.horizontalBlockSize * 2,
                  SizeUtils.horizontalBlockSize * 1.7,
                  SizeUtils.horizontalBlockSize * 2,
                  0,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 2),
                  child: Row(
                    children: [
                      SizedBox(
                        width: SizeUtils.horizontalBlockSize * 65,
                        child: AppText(
                          header ?? "",
                          color: AppColor.darkGrayTextDarkT,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeUtils.fSize_13(),
                        ),
                      ),
                      const Spacer(),
                      AppText(
                        "Completed",
                        color: AppColor.bronzeColor,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeUtils.fSize_14(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeUtils.horizontalBlockSize * 1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeUtils.horizontalBlockSize * 1.5,
                    horizontal: SizeUtils.horizontalBlockSize * 2),
                child: Column(
                  children: [
                    Row(
                      children: [
                        imageLoader(
                          h: SizeUtils.horizontalBlockSize * 7,
                          w: SizeUtils.horizontalBlockSize * 7,
                          url: i1 ?? "",
                        ),
                        SizedBox(width: SizeUtils.horizontalBlockSize * 2),
                        AppText(
                          t1 ?? "",
                          color: AppColor.pureWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeUtils.fSize_15(),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: int.parse(r1.toString()) < int.parse(r2.toString())
                                ? AppColor.redColor
                                : AppColor.greenTextDarkT,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                            child: AppText(
                              r1 == "" ? "00" : r1,
                              color: AppColor.white,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeUtils.fSize_12(),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                    Row(
                      children: [
                        imageLoader(
                          h: SizeUtils.horizontalBlockSize * 7,
                          w: SizeUtils.horizontalBlockSize * 7,
                          url: i2 ?? "",
                        ),
                        SizedBox(width: SizeUtils.horizontalBlockSize * 2),
                        AppText(
                          t2 ?? "",
                          color: AppColor.white,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeUtils.fSize_15(),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            borderRadius: BorderRadius.circular(5),
                            color: int.parse(r1.toString()) > int.parse(r2.toString())
                                ? AppColor.redColor
                                : AppColor.greenTextDarkT,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: AppText(
                              r2 == "" ? "00" : r2,
                              color: AppColor.white,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeUtils.fSize_12(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: AppText(
                  startTime ?? "",
                  fontWeight: FontWeight.bold,
                  fontSize: SizeUtils.fSize_13(),
                  color: AppColor.darkGrayTextDarkT,
                ),
              ),
              Center(
                child: AppText(
                  result ?? "",
                  fontWeight: FontWeight.bold,
                  fontSize: SizeUtils.fSize_13(),
                  color: AppColor.bronzeColor,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: SizeUtils.horizontalBlockSize * 1.5,
                  left: SizeUtils.horizontalBlockSize * 3.5,
                  right: SizeUtils.horizontalBlockSize * 3.5,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: SizeUtils.horizontalBlockSize * 20,
                      child: AppText(
                        subHeader ?? "",
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtils.fSize_12(),
                        color: AppColor.darkGrayTextDarkT,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: SizeUtils.horizontalBlockSize * 65,
                      child: AppText(
                        venue ?? "",
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtils.fSize_12(),
                        color: AppColor.darkGrayTextDarkT,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

fantasyCard({
  String? t1,
  String? t2,
  String? i1,
  String? i2,
  String? time,
  int? m = 0,
  int? h = 0,
  int? s = 0,
  int? e = 0,
  bool? linUp,
  GestureTapCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.screen,
          color: AppColor.bgColorDarkT,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: SizeUtils.horizontalBlockSize * 1.5),
          Padding(
            padding: EdgeInsets.only(right: SizeUtils.horizontalBlockSize * 3),
            child: Align(
              alignment: Alignment.topRight,
              child: RichText(
                text: TextSpan(
                    text: "Based on ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeUtils.fSize_14(),
                      color: AppColor.boarderColor,
                      overflow: TextOverflow.fade,
                    ),
                    children: [
                      TextSpan(
                          text: e.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeUtils.fSize_14(),
                            color: AppColor.boarderColor,
                            overflow: TextOverflow.fade,
                          )),
                      TextSpan(
                          text: " Expert",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeUtils.fSize_14(),
                            color: AppColor.boarderColor,
                            overflow: TextOverflow.fade,
                          ))
                    ]),
              ),
            ),
          ),
          SizedBox(height: SizeUtils.horizontalBlockSize * 1.5),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeUtils.horizontalBlockSize * 3,
              vertical: SizeUtils.verticalBlockSize * 0.3,
            ),
            child: Row(
              children: [
                imageLoader(
                    h: SizeUtils.horizontalBlockSize * 8,
                    w: SizeUtils.horizontalBlockSize * 8,
                    url: i1 ?? ""),
                SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                AppText(t1 ?? "",
                    fontWeight: FontWeight.bold,
                    fontSize: SizeUtils.fSize_15(),
                    color: AppColor.silverColor),
                const Spacer(),
                AppText(
                  t2 ?? "",
                  fontWeight: FontWeight.bold,
                  fontSize: SizeUtils.fSize_15(),
                  color: AppColor.silverColor,
                ),
                SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                imageLoader(
                  h: SizeUtils.horizontalBlockSize * 8,
                  w: SizeUtils.horizontalBlockSize * 8,
                  url: i2 ?? "",
                ),
              ],
            ),
          ),
          Center(
            child: AppText(time ?? "",
                fontWeight: FontWeight.bold,
                fontSize: SizeUtils.fSize_13(),
                color: AppColor.darkGrayTextDarkT),
          ),
          SizedBox(height: SizeUtils.horizontalBlockSize * 1.5),
          const Divider(color: Colors.grey, height: 0),
          SizedBox(height: SizeUtils.horizontalBlockSize * 1.5),
          m == 0
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 3),
                  child: Row(
                    children: [
                      AppText(
                        "Mega League Teams",
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtils.fSize_13(),
                        color: AppColor.goldMainColor,
                      ),
                      const Spacer(),
                      AppText(
                        m.toString(),
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtils.fSize_14(),
                        color: AppColor.goldMainColor,
                      ),
                    ],
                  ),
                ),
          h == 0
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 3),
                  child: Row(
                    children: [
                      AppText(
                        "Head to Head Teams",
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtils.fSize_13(),
                        color: AppColor.bronzeColor,
                      ),
                      const Spacer(),
                      AppText(
                        h.toString(),
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtils.fSize_14(),
                        color: AppColor.bronzeColor,
                      ),
                    ],
                  ),
                ),
          s == 0
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 3),
                  child: Row(
                    children: [
                      AppText(
                        "Small League Teams",
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtils.fSize_13(),
                        color: AppColor.boarderColor,
                      ),
                      const Spacer(),
                      AppText(
                        s.toString(),
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtils.fSize_14(),
                        color: AppColor.boarderColor,
                      ),
                    ],
                  ),
                ),
          SizedBox(height: SizeUtils.horizontalBlockSize * 1.5),
        ],
      ),
    ),
  );
}
