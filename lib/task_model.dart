class TaskModel {
  int id = 0;
  String title = "";
  int priority = 0;
  String createDate = "";
  String? updateDate;
  String? desc;

  TaskModel(this.id, this.title, this.priority, this.createDate, [this.desc, this.updateDate]);

  get getId => id;

  get getTitle => title;
  set setTitle(title) {this.title = title;}

  get getPriority => priority;
  set setPriority(priority) {this.priority = priority;}

  get getCreateDate => createDate;
  set setCreateDate(date) {createDate = date;}

  get getUpdateDate => updateDate;
  set setUpdateDate(date) {updateDate = date;}

  get getDesc => desc;
  set setDesc(desc) {this.desc = desc;}
}