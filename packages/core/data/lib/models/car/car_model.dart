class CarModel {
  String brand;
  String model;
  String year;
  String description;

  CarModel({
    this.brand = '',
    this.model = '',
    this.year = '',
    this.description = '',
  });

  set setBrand(String brand) => this.brand = brand;
  set setModel(String model) => this.model = model;
  set setDescription(String description) => this.description = description;
  set setYear(String year) => this.year = year;
}
