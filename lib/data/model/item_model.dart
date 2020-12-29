class ItemModel{
  String id;
  String name;

  ItemModel(this.id, this.name);

  factory ItemModel.removeItem(){
    return ItemModel("-1","-1");
  }

  bool equal(ItemModel item){
    return id == item.id && name == item.name;
  }

}