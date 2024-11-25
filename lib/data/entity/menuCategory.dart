
class MenuCategory {
  String categoryId;
  String categoryName;
  String type; // drinks veya foods gibi
  String categoryIconPath;

  MenuCategory({
    required this.categoryId,
    required this.categoryName,
    required this.type,
    this.categoryIconPath = '',
  });
}

List<MenuCategory> categories = [
  // Drinks kategorileri
  MenuCategory(categoryId: "1", categoryName: "Seasonal Drinks", type: "drinks"),
  MenuCategory(categoryId: "2", categoryName: "Espresso Drinks", type: "drinks"),
  MenuCategory(categoryId: "3", categoryName: "Filter Coffee", type: "drinks"),
  MenuCategory(categoryId: "4", categoryName: "Starbucks Refresha® Drinks", type: "drinks"),
  MenuCategory(categoryId: "5", categoryName: "Frappuccino® Blend Beverages", type: "drinks"),
  MenuCategory(categoryId: "6", categoryName: "Ice Cream Drinks", type: "drinks"),
  MenuCategory(categoryId: "7", categoryName: "Turkish Coffee", type: "drinks"),
  MenuCategory(categoryId: "8", categoryName: "Turkish Tea", type: "drinks"),
  MenuCategory(categoryId: "9", categoryName: "Teavana™ Tea Latte", type: "drinks"),
  MenuCategory(categoryId: "10", categoryName: "Hot Chocolate", type: "drinks"),
  MenuCategory(categoryId: "11", categoryName: "Orange Juice", type: "drinks"),
  MenuCategory(categoryId: "12", categoryName: "Bottled Drinks", type: "drinks"),

  // Foods kategorileri
  MenuCategory(categoryId: "13", categoryName: "Seasonal Foods", type: "foods"),
  MenuCategory(categoryId: "14", categoryName: "Cheesecakes", type: "foods"),
  MenuCategory(categoryId: "15", categoryName: "Cakes", type: "foods"),
  MenuCategory(categoryId: "16", categoryName: "Muffin & Cookie", type: "foods"),
  MenuCategory(categoryId: "17", categoryName: "Sandwiches", type: "foods"),
  MenuCategory(categoryId: "18", categoryName: "Salads & Parfaits", type: "foods"),
  MenuCategory(categoryId: "19", categoryName: "Snacks", type: "foods"),

  // Coffee At Home kategorileri
  MenuCategory(categoryId: "20", categoryName: "Wholebean", type: "coffeeAtHome"),
  MenuCategory(categoryId: "21", categoryName: "VIA", type: "coffeeAtHome"),
  MenuCategory(categoryId: "22", categoryName: "Capsules", type: "coffeeAtHome"),

  // Merchandise kategorileri
  MenuCategory(categoryId: "23", categoryName: "Favorite Essentials", type: "merchandise"),
  MenuCategory(categoryId: "24", categoryName: "Brewing Equipments", type: "merchandise"),
  MenuCategory(categoryId: "25", categoryName: "City Themed Mugs", type: "merchandise"),
  MenuCategory(categoryId: "26", categoryName: "Brewing Methods", type: "merchandise"),
];