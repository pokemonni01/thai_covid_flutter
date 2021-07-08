class TodayCasesModel {
  final int confirmed;
  final int recovered;
  final int hospitalized;
  final int deaths;
  final int newConfirmed;
  final int newRecovered;
  final int newHospitalized;
  final int newDeaths;
  final String updateDate;

  TodayCasesModel({
    this.confirmed,
    this.recovered,
    this.hospitalized,
    this.deaths,
    this.newConfirmed,
    this.newRecovered,
    this.newHospitalized,
    this.newDeaths,
    this.updateDate,
  });

  factory TodayCasesModel.fromJson(Map<String, dynamic> json) {
    return TodayCasesModel(
      confirmed: json['Confirmed'],
      recovered: json['Recovered'],
      hospitalized: json['Hospitalized'],
      deaths: json['Deaths'],
      newConfirmed: json['NewConfirmed'],
      newRecovered: json['NewRecovered'],
      newHospitalized: json['NewHospitalized'],
      newDeaths: json['NewDeaths'],
      updateDate: json['UpdateDate'],
    );
  }
}