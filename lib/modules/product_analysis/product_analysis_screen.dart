import 'package:econfiy/controller/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class ChartData {
  final String x;
  final double y;
  final Color color;
  final String label;
  ChartData(this.x, this.y, this.color,this.label);
}
class ProductAnalysisScreen extends StatelessWidget {
  const ProductAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<HomeCubit>();
    final double positivityAverage = cubit.analysisModel!.data!.positivityAverage!;
    final double negativityAverage = cubit.analysisModel!.data!.negativityAverage!;
    final double total = positivityAverage + negativityAverage;

    // Create the chart data with calculated percentages and custom labels
    final List<ChartData> chartData = [
      ChartData(
        'Positive',
        positivityAverage,
        Colors.blueAccent,
        '${((positivityAverage / total) * 100).toStringAsFixed(0)}% Positive',
      ),
      ChartData(
        'Negative',
        negativityAverage,
        Colors.pink,
        '${((negativityAverage / total) * 100).toStringAsFixed(0)}% Negative',
      ),
    ];

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit=context.read<HomeCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Product Analysis',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 15.sp)),),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price analysis',
                    style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 25.h,),
                  Image.network(cubit.analysisModel!.
                  data!.priceTrackingChart!, fit: BoxFit.contain,
                  width: double.infinity,),
                  SizedBox(height: 25.h,),
                  Text(
                    'Product analysis',
                    style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 25.h,),
                  SfCircularChart(
                    series:<PieSeries<ChartData, String>>[
                      // Render pie chart
                        PieSeries<ChartData, String>(
                            dataSource: chartData,
                            pointColorMapper:(ChartData data, _) => data.color,
                            xValueMapper: (ChartData data, _) => data.x,

                            yValueMapper: (ChartData data, _) => data.y,
                          dataLabelMapper: (ChartData data, _) => data.label,
                          dataLabelSettings:  DataLabelSettings(
                            isVisible: true,
                            labelIntersectAction: LabelIntersectAction.shift,
                            textStyle: TextStyle(fontSize: 11.5.sp,fontWeight: FontWeight.bold),
                            labelPosition: ChartDataLabelPosition.inside,
                          ),                        )
                    ],
                  ),

                  SizedBox(height: 25.h,),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Postitve Review',style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15.sp),),
                          SizedBox(height: 5.h,),
                          Divider(),
                          SizedBox(height: 5.h,),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Text(cubit.analysisModel!.data!
                              .collectionOfPositiveSummrize![index]),
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: cubit.analysisModel!.data!
                                  .collectionOfPositiveSummrize!.length),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h,),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Negative Review',style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15.sp),),
                          SizedBox(height: 5.h,),
                          Divider(),
                          SizedBox(height: 5.h,),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Text(cubit.analysisModel!.data!
                                  .collectionOfNegativeSummrize![index]),
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: cubit.analysisModel!.data!
                                  .collectionOfNegativeSummrize!.length),

                        ],
                      ),
                    ),
                  ),
                ],),
            ),
          ),
        );
      },
    );
  }
}

