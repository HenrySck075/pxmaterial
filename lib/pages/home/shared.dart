
String parseDate(String h) {
  String y = h.substring(0,4);
  String m = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"][int.parse(h.substring(4,6))-1];
  String d = h.substring(6);
  d = d+["th","st","nd","rd","th","th","th","th","th","th"][int.parse(d)%10];
  return "$m $d $y";
}
