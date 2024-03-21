import '../../data/model/model.dart';

ModelCategoryList modelCategoryList = ModelCategoryList(
  modelCategories: [
    ModelCategory(
      name: 'People and Animals',
      image: 'people_and_animals_image_url',
      subCategories: _peopleAndAnimalsSubCategories,
      description: 'Description for People and Animals category',
      abbreviatedName: 'P & A',
    ),
    ModelCategory(
      name: 'Vehicles and Transportation',
      image: 'vehicles_and_transportation_image_url',
      subCategories: _vehiclesAndTransportationSubCategories,
      description: 'Description for Vehicles and Transportation category',
      abbreviatedName: 'V & T',
    ),
    ModelCategory(
      name: 'Clothing and Accessories',
      image: 'clothing_and_accessories_image_url',
      subCategories: _clothingAndAccessoriesSubCategories,
      description: 'Description for Clothing and Accessories category',
      abbreviatedName: 'C & A',
    ),
    ModelCategory(
      name: 'Sports and Outdoor Equipment',
      image: 'sports_and_outdoor_equipment_image_url',
      subCategories: _sportsAndOutdoorEquipmentSubCategories,
      description: 'Description for Sports and Outdoor Equipment category',
      abbreviatedName: 'S & OE',
    ),
    ModelCategory(
      name: 'Food and Kitchenware',
      image: 'food_and_kitchenware_image_url',
      subCategories: _foodAndKitchenwareSubCategories,
      description: 'Description for Food and Kitchenware category',
      abbreviatedName: 'F & K',
    ),
    ModelCategory(
      name: 'Furniture and Household Items',
      image: 'furniture_and_household_items_image_url',
      subCategories: _furnitureAndHouseholdItemsSubCategories,
      description: 'Description for Furniture and Household Items category',
      abbreviatedName: 'F & HI',
    ),
    ModelCategory(
      name: 'Miscellaneous',
      image: 'miscellaneous_image_url',
      subCategories: _miscellaneousSubCategories,
      description: 'Description for Miscellaneous category',
      abbreviatedName: 'MISC',
    ),
  ],
);

List<ModelSubCategory> _peopleAndAnimalsSubCategories = [
  ModelSubCategory(name: 'person'),
  ModelSubCategory(name: 'bird'),
  ModelSubCategory(name: 'cat'),
  ModelSubCategory(name: 'dog'),
  ModelSubCategory(name: 'horse'),
  ModelSubCategory(name: 'sheep'),
  ModelSubCategory(name: 'cow'),
  ModelSubCategory(name: 'elephant'),
  ModelSubCategory(name: 'bear'),
  ModelSubCategory(name: 'zebra'),
  ModelSubCategory(name: 'giraffe'),
];

List<ModelSubCategory> _vehiclesAndTransportationSubCategories = [
  ModelSubCategory(name: 'bicycle'),
  ModelSubCategory(name: 'car'),
  ModelSubCategory(name: 'motorcycle'),
  ModelSubCategory(name: 'airplane'),
  ModelSubCategory(name: 'bus'),
  ModelSubCategory(name: 'train'),
  ModelSubCategory(name: 'truck'),
  ModelSubCategory(name: 'boat'),
  ModelSubCategory(name: 'traffic light'),
  ModelSubCategory(name: 'fire hydrant'),
  ModelSubCategory(name: 'stop sign'),
  ModelSubCategory(name: 'parking meter'),
];

List<ModelSubCategory> _clothingAndAccessoriesSubCategories = [
  ModelSubCategory(name: 'backpack'),
  ModelSubCategory(name: 'umbrella'),
  ModelSubCategory(name: 'handbag'),
  ModelSubCategory(name: 'tie'),
  ModelSubCategory(name: 'suitcase'),
];

List<ModelSubCategory> _sportsAndOutdoorEquipmentSubCategories = [
  ModelSubCategory(name: 'frisbee'),
  ModelSubCategory(name: 'skis'),
  ModelSubCategory(name: 'snowboard'),
  ModelSubCategory(name: 'sports ball'),
  ModelSubCategory(name: 'kite'),
  ModelSubCategory(name: 'baseball bat'),
  ModelSubCategory(name: 'baseball glove'),
  ModelSubCategory(name: 'skateboard'),
  ModelSubCategory(name: 'surfboard'),
  ModelSubCategory(name: 'tennis racket'),
];

List<ModelSubCategory> _foodAndKitchenwareSubCategories = [
  ModelSubCategory(name: 'bottle'),
  ModelSubCategory(name: 'wine glass'),
  ModelSubCategory(name: 'cup'),
  ModelSubCategory(name: 'fork'),
  ModelSubCategory(name: 'knife'),
  ModelSubCategory(name: 'spoon'),
  ModelSubCategory(name: 'bowl'),
  ModelSubCategory(name: 'banana'),
  ModelSubCategory(name: 'apple'),
  ModelSubCategory(name: 'sandwich'),
  ModelSubCategory(name: 'orange'),
  ModelSubCategory(name: 'broccoli'),
  ModelSubCategory(name: 'carrot'),
  ModelSubCategory(name: 'hot dog'),
  ModelSubCategory(name: 'pizza'),
  ModelSubCategory(name: 'donut'),
  ModelSubCategory(name: 'cake'),
];

List<ModelSubCategory> _furnitureAndHouseholdItemsSubCategories = [
  ModelSubCategory(name: 'chair'),
  ModelSubCategory(name: 'couch'),
  ModelSubCategory(name: 'potted plant'),
  ModelSubCategory(name: 'bed'),
  ModelSubCategory(name: 'dining table'),
  ModelSubCategory(name: 'toilet'),
  ModelSubCategory(name: 'tv'),
  ModelSubCategory(name: 'laptop'),
  ModelSubCategory(name: 'mouse'),
  ModelSubCategory(name: 'remote'),
  ModelSubCategory(name: 'keyboard'),
  ModelSubCategory(name: 'cell phone'),
  ModelSubCategory(name: 'microwave'),
  ModelSubCategory(name: 'oven'),
  ModelSubCategory(name: 'toaster'),
  ModelSubCategory(name: 'sink'),
  ModelSubCategory(name: 'refrigerator'),
];

List<ModelSubCategory> _miscellaneousSubCategories = [
  ModelSubCategory(name: 'bench'),
  ModelSubCategory(name: 'book'),
  ModelSubCategory(name: 'clock'),
  ModelSubCategory(name: 'vase'),
  ModelSubCategory(name: 'scissors'),
  ModelSubCategory(name: 'teddy bear'),
  ModelSubCategory(name: 'hair drier'),
  ModelSubCategory(name: 'toothbrush'),
];
