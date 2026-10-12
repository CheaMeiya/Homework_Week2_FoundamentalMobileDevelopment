enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address(this.street, this.city, this.zipCode);
}

class Employee {
  String name;
  double baseSalary;

  final List<Skill> skills;
  final Address address;
  final int yearOfExperience;

  Employee(
    this.name,
    this.baseSalary, {
    required this.skills,
    required this.address,
    required this.yearOfExperience,
  });

  Employee.mobileDeveloper(
    this.name,
    this.baseSalary,
    this.address,
    this.yearOfExperience,
  ) : skills = [Skill.FLUTTER, Skill.DART];

  String get employeeName => name;
  double get employeeBaseSalary => baseSalary;
  List<Skill> get employeeSkills => skills;
  Address get employeeAddress => address;
  int get employeeYearOfExperience => yearOfExperience;

  double calculateSalary() {
    double salary = 40000 + yearOfExperience * 2000;
    for (final skill in skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }
    return salary;
  }

  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary}');
    print('Skills: $skills');
    print('Address: ${address.street}, ${address.city}, ${address.zipCode}');
    print('yearOfExperience: $yearOfExperience');
    print('calculate Salary: \$${calculateSalary()}');
  }
}

void main() {
  var emp1 = Employee('Sokea', 40000,
  skills: [Skill.FLUTTER, Skill.DART],
  address: Address('Street 123', 'Phnom Penh', '12000'),
  yearOfExperience: 3,);
  emp1.printDetails();

  var emp2 = Employee.mobileDeveloper('Ronan', 45000,  Address('Street 456', 'Siem Reap', '17000'),
    5,);
  emp2.printDetails();
}
