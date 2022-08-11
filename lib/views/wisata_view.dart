import 'package:flutter/material.dart';
import 'package:kenalbandung/const/constants.dart';
import 'package:kenalbandung/const/theme.dart';
import 'package:kenalbandung/viewmodels/wisata_belanja_view_model.dart';
import 'package:kenalbandung/views/detail_view_wisata_belanja.dart';
import 'package:stacked/stacked.dart';

class WisataView extends StatefulWidget {
  const WisataView({Key? key}) : super(key: key);

  @override
  State<WisataView> createState() => _WisataViewState();
}

class _WisataViewState extends State<WisataView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WisataBelanjaViewModel>.reactive(
      viewModelBuilder: () => WisataBelanjaViewModel(),
      onModelReady: (model) => model.initdata(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Wisata Belanja"),
          centerTitle: true,
          backgroundColor: bluePrimary,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: model.data_wisata.length,
                  itemBuilder: (ctx, idx) => Container(
                    margin:
                        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
                    child: InkWell(
                      onTap: () {
                        final data = model.data_wisata[idx]['koordinat'];

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailViewWisataBelanja(
                              latitude:
                                  double.parse(data.toString().split(",")[0]),
                              longitude:
                                  double.parse(data.toString().split(",")[1]),
                            ),
                          ),
                        );
                      },
                      radius: 8,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${model.data_wisata[idx]['nama']}",
                              style: blackTextStyle.copyWith(
                                  color: bluePrimary,
                                  fontSize: 18,
                                  fontWeight: medium),
                            ),
                            Text(
                              "${model.data_wisata[idx]['jenis_usaha']}",
                              style: blackTextStyle.copyWith(
                                  color: Colors.grey.shade600),
                            ),
                            Text(
                              "${model.data_wisata[idx]['alamat']}",
                              style: blackTextStyle.copyWith(
                                  fontSize: 16, color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
