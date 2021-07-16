class Category{
final int categoryId;
final String nameEn;
final String nameJp;
  Category({required this.categoryId,required this.nameEn,required this.nameJp});

}

List<Category> categories=[
  Category(categoryId:0,nameEn: "general",nameJp: "総合"),
  Category(categoryId:1,nameEn: "business",nameJp: "ビジネス"),
  Category(categoryId:2,nameEn: "entertainment",nameJp: "エンタメ"),
  Category(categoryId:3,nameEn: "health",nameJp: "健康"),
  Category(categoryId:4,nameEn: "science",nameJp: "科学"),
  Category(categoryId:5,nameEn: "sports",nameJp: "IT"),
  Category(categoryId:6,nameEn: "technology",nameJp: "テクノロジー"),
];

