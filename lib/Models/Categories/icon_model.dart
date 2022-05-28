

class IconModel{
  late var iconClass,url;
  IconModel.fromJson(data){
    iconClass =  data['class'];
    url =  data['url'];
  }
}