class Fruit {
final int id;
final String title;
final int UserId;

Fruit(
  this.UserId,
  this.id,
	this.title,
	
);

factory Fruit.fromJson(Map<String, dynamic> json) {
	return Fruit(json['userId'],json['id'], json['title']);
}
}
