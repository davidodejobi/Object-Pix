import '../../data/model/model.dart';

ModelCategoryList modelCategoryList = ModelCategoryList(
  modelCategories: [
    ModelCategory(
      name: 'People and Animals',
      image:
          'https://www.boredpanda.com/blog/wp-content/uploads/2021/03/Photographer-takes-stunning-photos-of-peoples-interactions-with-animals-that-seem-to-have-come-out-of-a-fairy-tale-605864aa1ac68__880.jpg',
      subCategories: _peopleAndAnimalsSubCategories,
      description:
          'This category includes images of people and various animals.',
      abbreviatedName: 'P & A',
    ),
    ModelCategory(
      name: 'Vehicles and Transportation',
      image:
          'https://www.w3.org/cms-uploads/_1520xAUTO_crop_center-center_none/smart-cars-wireless-connections.jpg',
      subCategories: _vehiclesAndTransportationSubCategories,
      description:
          'This category includes images related to vehicles and transportation, ranging from cars and bicycles to airplanes and boats. It encompasses various modes of transportation used in daily life.',
      abbreviatedName: 'V & T',
    ),
    ModelCategory(
      name: 'Clothing and Accessories',
      image:
          'https://img.freepik.com/premium-photo/clothing-accessories-men-women-ready-travel-life-style_11304-1404.jpg?w=2000',
      subCategories: _clothingAndAccessoriesSubCategories,
      description:
          'This category includes different types of clothing and accessories worn by people. From stylish outfits to essential accessories',
      abbreviatedName: 'C & A',
    ),
    ModelCategory(
      name: 'Sports and Outdoor Equipment',
      image:
          'https://www.extraspaceasia.co.kr/wp-content/uploads/2020/10/111111111.jpg',
      subCategories: _sportsAndOutdoorEquipmentSubCategories,
      description:
          'This category includes sports equipment and outdoor gear used for various recreational activities.',
      abbreviatedName: 'S & OE',
    ),
    ModelCategory(
      name: 'Food and Kitchenware',
      image:
          'https://hips.hearstapps.com/hmg-prod/images/caraway-1658166589.jpeg?crop=1xw:1xh;center,top&resize=980:*',
      subCategories: _foodAndKitchenwareSubCategories,
      description:
          'This category includes different types of food and kitchenware items. From fruits and sandwiches to kitchen utensils and appliances.',
      abbreviatedName: 'F & K',
    ),
    ModelCategory(
      name: 'Furniture and Household Items',
      image:
          'https://hips.hearstapps.com/hmg-prod/images/posters-in-cozy-apartment-interior-royalty-free-image-943910360-1534189931.jpg?resize=1200:*',
      subCategories: _furnitureAndHouseholdItemsSubCategories,
      description:
          'This category includes furniture pieces and household items commonly found in homes. From chairs and beds to kitchen appliances and home decor.',
      abbreviatedName: 'F & HI',
    ),
    ModelCategory(
      name: 'Miscellaneous',
      image:
          'https://t3.ftcdn.net/jpg/05/01/42/62/240_F_501426291_V38RI5PTpJWx10kBx2M27zFQ4L1M5rdn.jpg',
      subCategories: _miscellaneousSubCategories,
      description:
          'This category includes various miscellaneous items that do not fall into specific thematic groups.',
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
