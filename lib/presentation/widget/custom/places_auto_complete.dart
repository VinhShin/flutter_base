library flutter_google_places.src;

import 'dart:async';
import 'package:e_mobiz/data/model/marker_point.dart';
import 'package:e_mobiz/presentation/widget/base/m_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:e_mobiz/common/styles/colors.dart';
import 'package:e_mobiz/presentation/widget/base/m_button_icon_circle.dart';
import 'package:e_mobiz/presentation/widget/base/m_inkwell.dart';
import 'package:e_mobiz/presentation/widget/custom/loader.dart';
import 'package:e_mobiz/common/utils/common_func.dart';
import 'package:e_mobiz/common/utils/constants.dart';
import 'package:rxdart/rxdart.dart';

class PlacesAutocompleteWidget extends StatefulWidget {
  Function callBack;
  Function onClose;
  final String sessionToken = CommonFunc().generateV4();

  PlacesAutocompleteWidget({
    this.callBack,
    this.onClose,
    Key key,
  }) : super(key: key);

  @override
  State<PlacesAutocompleteWidget> createState() {
    return PlacesAutocompleteState();
  }

  static PlacesAutocompleteState of(BuildContext context) =>
      context.ancestorStateOfType(const TypeMatcher<PlacesAutocompleteState>());
}

class PlacesAutocompleteResult extends StatefulWidget {
  final ValueChanged<Prediction> onTap;
  final Widget logo;

  PlacesAutocompleteResult({this.onTap, this.logo});

  @override
  _PlacesAutocompleteResult createState() => _PlacesAutocompleteResult();
}

class _PlacesAutocompleteResult extends State<PlacesAutocompleteResult> {
  @override
  Widget build(BuildContext context) {
    final state = PlacesAutocompleteWidget.of(context);
    assert(state != null);

    if (state._queryTextController.text.isEmpty || state._response == null || state._response.predictions.isEmpty) {
      if (state._searching) {
        return Loader();
      }
      return Container();
    }
    return PredictionsListView(
      predictions: state._response.predictions,
      onTap: widget.onTap,
    );
  }
}

class AppBarPlacesAutoCompleteTextField extends StatefulWidget {
  @override
  _AppBarPlacesAutoCompleteTextFieldState createState() => _AppBarPlacesAutoCompleteTextFieldState();
}

class _AppBarPlacesAutoCompleteTextFieldState extends State<AppBarPlacesAutoCompleteTextField> {
  @override
  Widget build(BuildContext context) {
    final state = PlacesAutocompleteWidget.of(context);
    assert(state != null);
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 2, // has the effect of softening the shadow
                        spreadRadius: 0, // has the effect of extending the shadow
                        offset: Offset(
                          0, // horizontal, move right 10
                          1, // vertical, move down 10
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: MTextField(
                        autoFocus: true,
                        hint: "Nhập địa chị",
                        prefixIcon: Icon(Icons.search),
                        inputBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.transparent, width: 1)),
                        controller: state._queryTextController,
                        suffixIcon: state._queryTextController.text.isEmpty
                            ? null
                            : IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  state._queryTextController.clear();
                                },
                              ),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            width: 10,
          ),
          MButtonIconCircle(
            Icon(Icons.close),
            () {
              state.widget.onClose();
            },
            colorShadhow: Colors.black54,
          )
        ],
      ),
    );
  }
}

class PredictionsListView extends StatelessWidget {
  final List<Prediction> predictions;
  final ValueChanged<Prediction> onTap;

  PredictionsListView({@required this.predictions, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: predictions.map((Prediction p) => PredictionTile(prediction: p, onTap: onTap)).toList(),
    );
  }
}

class PredictionTile extends StatelessWidget {
  final Prediction prediction;
  final ValueChanged<Prediction> onTap;

  PredictionTile({@required this.prediction, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2, // has the effect of softening the shadow
              spreadRadius: 0, // has the effect of extending the shadow
              offset: Offset(
                0, // horizontal, move right 10
                1, // vertical, move down 10
              ),
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: MInkWell(
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: AppColors.primaryColor,
              ),
              Expanded(
                child: Text(
                  prediction.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          if (onTap != null) {
            onTap(prediction);
          }
        },
      ),
    );
  }
}

class PlacesAutocompleteState extends State<PlacesAutocompleteWidget> {
  final searchScaffoldKey = GlobalKey<ScaffoldState>();
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: Constants().kGoogleApiKey);
  TextEditingController _queryTextController;

  PlacesAutocompleteResponse _response;
  bool _searching;

  final _queryBehavior = BehaviorSubject<String>.seeded('');

  @override
  void initState() {
    super.initState();
    _queryTextController = TextEditingController();

    _places = GoogleMapsPlaces(apiKey: Constants().kGoogleApiKey);
    _searching = false;

    _queryTextController.addListener(_onQueryChange);

    _queryBehavior.stream.debounceTime(const Duration(milliseconds: 300)).listen(doSearch);
  }

  @override
  Widget build(BuildContext context) {
    final body = PlacesAutocompleteResult(
      onTap: (p) async {
        PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);
        final lat = detail.result.geometry.location.lat;
        final lng = detail.result.geometry.location.lng;
        MarkerPoint marketPoint = MarkerPoint(p.description, LatLng(lat, lng), address: detail.result.vicinity);
        _queryTextController.text = "";
        widget.callBack(marketPoint);
      },
    );
    return Column(
      children: <Widget>[
        AppBarPlacesAutoCompleteTextField(),
        Expanded(
          child: Stack(children: <Widget>[body]),
        )
      ],
    );
  }

  Future<Null> doSearch(String value) async {
    if (mounted && value.isNotEmpty) {
      setState(() {
        _searching = true;
      });

      String language = "vi";
      if (Constants().countryCode != "VN") {
        language = "en";
      }
      final List<Component> components = [Component(Component.country, Constants().countryCode)];

      final res = await _places.autocomplete(
        value,
        language: language,
        sessionToken: widget.sessionToken,
        components: components,
      );

      if (res.errorMessage?.isNotEmpty == true || res.status == "REQUEST_DENIED") {
        onResponseError(res);
      } else {
        onResponse(res);
      }
    } else {
      onResponse(null);
    }
  }

  void _onQueryChange() {
    _queryBehavior.add(_queryTextController.text);
  }

  @override
  void dispose() {
    super.dispose();

    _places.dispose();
    _queryBehavior.close();
    _queryTextController.removeListener(_onQueryChange);
  }

  @mustCallSuper
  void onResponseError(PlacesAutocompleteResponse res) {
    if (!mounted) return;
    setState(() {
      _response = null;
      _searching = false;
    });
//    searchScaffoldKey.currentState.showSnackBar(
//      SnackBar(content: Text(res.errorMessage)),
//    );
  }

  @mustCallSuper
  void onResponse(PlacesAutocompleteResponse res) {
    if (!mounted) return;

    setState(() {
      _response = res;
      _searching = false;
    });
//    if (res != null && res.predictions.isNotEmpty) {
//      searchScaffoldKey.currentState.showSnackBar(
//        SnackBar(content: Text("Got answer")),
//      );
//    }
  }
}
