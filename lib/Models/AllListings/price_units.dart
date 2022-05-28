

class PriceUnits{
  late var id,name;
  PriceUnits.fromJson(data){
    id =  data['id'];
    name =  data['name'];
  }
}