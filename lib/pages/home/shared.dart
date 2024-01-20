
String parseDateDashless(String h) {
  String y = h.substring(0,4);
  String m = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"][int.parse(h.substring(4,6))-1];
  String d = h.substring(6);
  d = d+["th","st","nd","rd","th","th","th","th","th","th"][int.parse(d)%10];
  return "$m $d $y";
}

String parseDateDashful(String h) {
  String y = h.split("-")[0];
  String m = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"][int.parse(h.split("-")[1])-1];
  String d = h.split("-")[2];
  d = d+["th","st","nd","rd","th","th","th","th","th","th"][int.parse(d)%10];
  return "$m $d $y";
}

String parseDate(String h) => h.contains("-")?parseDateDashful(h):parseDateDashless(h);
