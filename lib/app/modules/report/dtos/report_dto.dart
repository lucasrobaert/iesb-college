class ReportDto {
  int id;
  String name;
  double media;
  List<double> notas;
  String status;

  ReportDto(this.id, this.name, this.media, this.notas, {this.status = ''});
}
