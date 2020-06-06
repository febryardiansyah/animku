class EndPointPath {
  static const List pathList = [
    EndPointPath.winter2020,
    EndPointPath.spring2020,
    EndPointPath.summer2020,
    EndPointPath.fall2020
  ];

  static const String currentSeason = '/season';
  static const String winter2020 = '/season/2020/winter';
  static const String spring2020 = '/season/2020/spring';
  static const String summer2020 = '/season/2020/summer';
  static const String fall2020 = '/season/2020/fall';

  static const String monday = '/schedule/monday';
  static const String tuesday = '/schedule/tuesday';
  static const String wednesday = '/schedule/wednesday';
  static const String thursday = '/schedule/thursday';
  static const String friday = '/schedule/friday';
  static const String saturday = '/schedule/saturday';
  static const String sunday = '/schedule/sunday';

  static const String seasonLater = '/season/later';
  static const String schedule = '/schedule';
}
