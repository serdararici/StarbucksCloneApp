
class MenuCategory {
  String categoryId;
  String categoryName;
  String type; // drinks veya foods gibi
  String categoryIconPath;

  MenuCategory({
    required this.categoryId,
    required this.categoryName,
    required this.type,
    this.categoryIconPath = "https://www.digitalassets.starbucks.eu/sites/starbucks-medialibrary/files/Fresh-Brewed-Coffee---Feb-2023.jpeg",
  });
}

List<MenuCategory> categories = [
  // Drinks kategorileri
  MenuCategory(categoryId: "1", categoryName: "Seasonal Drinks", type: "drinks", categoryIconPath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVP1HMTY3QYlHsVxgSSMgFwYPbBaAu6RgBSg&s"),
  MenuCategory(categoryId: "2", categoryName: "Espresso Drinks", type: "drinks", categoryIconPath: "https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190617_CaffeLatte.jpg?impolicy=1by1_wide_topcrop_630"),
  MenuCategory(categoryId: "3", categoryName: "Filter Coffee", type: "drinks", categoryIconPath: "https://www.digitalassets.starbucks.eu/sites/starbucks-medialibrary/files/Fresh-Brewed-Coffee---Feb-2023.jpeg"),
  MenuCategory(categoryId: "4", categoryName: "Starbucks Refresha® Drinks", type: "drinks", categoryIconPath: "https://www.digitalassets.starbucks.eu/sites/starbucks-medialibrary/files/Cool-Lime-REVISED.jpeg"),
  MenuCategory(categoryId: "5", categoryName: "Frappuccino® Blend Beverages", type: "drinks", categoryIconPath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfQ1F02VL8mGpdbMJGOTJQpCBi5Y2-LCn0Lw&s"),
  MenuCategory(categoryId: "6", categoryName: "Ice Cream Drinks", type: "drinks", categoryIconPath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS60hY_2YKbPAb7lQsz9RClpu9ii6kbwlzhw&s"),
  MenuCategory(categoryId: "7", categoryName: "Turkish Coffee", type: "drinks", categoryIconPath: "https://www.starbucksathome.com/tr/sites/default/files/styles/nutrition_instruction_image/public/2023-06/SBX_WEB2.0_Turkish-coffee_Cup_LongShadow_1935by1620px_230606_1%20%281%29.png?itok=VFCUmc7S"),
  MenuCategory(categoryId: "8", categoryName: "Turkish Tea", type: "drinks", categoryIconPath: "https://www.digitalassets.starbucks.eu/sites/starbucks-medialibrary/files/assets/2c37fb5960249296946d146045c5827f_3.jpg"),
  MenuCategory(categoryId: "9", categoryName: "Teavana™ Tea Latte", type: "drinks", categoryIconPath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp16MeuLpxqJA_sdLGhhXjdHPpsBywc4XQgg&s"),
  MenuCategory(categoryId: "10", categoryName: "Hot Chocolate", type: "drinks" ,categoryIconPath: "https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190617_SignatureHotChocolate.jpg?impolicy=1by1_wide_topcrop_630"),
  MenuCategory(categoryId: "11", categoryName: "Orange Juice", type: "drinks" ,categoryIconPath: "https://www.starbucks.co.th/stb-media/2020/08/43.Valencia-Juice1080-1.png"),
  MenuCategory(categoryId: "12", categoryName: "Bottled Drinks", type: "drinks" ,categoryIconPath: "https://www.starbucks.co.uk/_next/image?url=https%3A%2F%2Fwww.digitalassets.starbucks.eu%2Fsites%2Fstarbucks-medialibrary%2Ffiles%2FWater-Sparkling-500ML.jpeg&w=3840&q=75"),

  // Foods kategorileri
  MenuCategory(categoryId: "13", categoryName: "Seasonal Foods", type: "foods" ,categoryIconPath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrbuRJNTc5ro97cuwZLOT8xCzxQeUbDhfNGg&s"),
  MenuCategory(categoryId: "14", categoryName: "Cheesecakes", type: "foods" ,categoryIconPath: "https://www.digitalassets.starbucks.eu/sites/starbucks-medialibrary/files/AT-MOP-New-York-Cheesecake.jpeg"),
  MenuCategory(categoryId: "15", categoryName: "Cakes", type: "foods", categoryIconPath: "https://www.digitalassets.starbucks.eu/sites/starbucks-medialibrary/files/Carrot-Cake_0.jpeg"),
  MenuCategory(categoryId: "16", categoryName: "Muffin & Cookie", type: "foods", categoryIconPath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-HmCLYbgD8DceTcRjD9adqa0myWaS7Sxb-Q&s"),
  MenuCategory(categoryId: "17", categoryName: "Sandwiches", type: "foods" ,categoryIconPath: "https://globalassets.starbucks.com/digitalassets/products/food/EggPestoMozzarellaSandwich.jpg?impolicy=1by1_tight_288"),
  MenuCategory(categoryId: "18", categoryName: "Salads & Parfaits", type: "foods" ,categoryIconPath: "https://www.starbucks.com.om/sites/starbucks-om/files/styles/c04_image_text_grid_600x600/public/2021-06/Grand_Chicken_Caesar_Salad.jpg.webp?itok=jsv4koSj"),
  MenuCategory(categoryId: "19", categoryName: "Snacks", type: "foods", categoryIconPath: "https://globalassets.starbucks.com/digitalassets/products/food/SBX20210825_SaltedKettlePotatoChips.jpg?impolicy=1by1_tight_288"),

  // Coffee At Home kategorileri
  MenuCategory(categoryId: "20", categoryName: "Wholebean", type: "coffeeAtHome" ,categoryIconPath: "https://athome.starbucks.com/sites/default/files/2022-05/CAH_PDP_House_1842x1542_Whole_shadow.png"),
  MenuCategory(categoryId: "21", categoryName: "VIA", type: "coffeeAtHome" ,categoryIconPath: "https://globalassets.starbucks.com/digitalassets/products/at-home/SBX20190715_ViaInstantBlondeVerandaBlend.jpg?impolicy=1by1_tight_288"),
  MenuCategory(categoryId: "22", categoryName: "Capsules", type: "coffeeAtHome" ,categoryIconPath: "https://www.starbucksathome.com/tr/sites/default/files/2024-04/SBX_WEB2.0_NESP_House-Blend_7613036984393_C1C1_1842by1542_230911_1_1695107516964.png"),

  // Merchandise kategorileri
  MenuCategory(categoryId: "23", categoryName: "Favorite Essentials", type: "merchandise", categoryIconPath: "https://starbuckssg-prd-cdn.ascentismedia.com/ProductImages/6cb8a152-241c-42a4-9b1a-625e5b65e0f9/1/240x240/starbucks-earth-day-coffee-ground-tumbler-12oz-241012083318.png"),
  MenuCategory(categoryId: "24", categoryName: "Brewing Equipments", type: "merchandise" ,categoryIconPath: "https://www.starbucksathome.com/my/sites/default/files/2021-12/MY_en_SBUX_Brewing-Guides_Images_Coffee%20Machine_2880x2880_211217_1.jpg"),
  MenuCategory(categoryId: "25", categoryName: "City Themed Mugs", type: "merchandise" ,categoryIconPath: "https://cdn.dsmcdn.com/mnresize/600/-/ty440/product/media/images/20220527/17/116878234/488536207/1/1_org_zoom.jpg"),
  MenuCategory(categoryId: "26", categoryName: "Brewing Methods", type: "merchandise", categoryIconPath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuUhxUKoOrv16c8md1c20V-wIwiKoLpWINIQ&s"),
];