//list,Map,Set
void main(List<String> args) {
  //List
  var isList = [12, 14, 1209, "Jakarta"];
  print(isList);

  //Map 
  var isMap = Map<String, dynamic>();
  isMap['Nama'] = 'Muhamad Khoirul Fahmi';
  isMap['NPM'] = '2010631170092';
  isMap['IPK'] = 3.9;
  print(isMap);

  //Set 
  var isSet = {
    'Data ke-1',
    'Data ke-2',
    'Data ke-3', //Data ke-2 diduplikat sebanyak 2x, namun di output hanya ada 1x
    'Data ke-3'
  };
  print(isSet);
}