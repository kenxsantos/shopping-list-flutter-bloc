// import 'package:flutter/material.dart';

void main() {
  // runApp(const MyApp());

  printHelloWorld();
  variablesAndDataTypes();
  conditionalStatements();
  inventoryStocks();
  computeNetSalary(salary: 5000, bonus: 1000, deduction: 500);
  printEmoji();
}

//1. Write a simple program that prints "Hello, World!" to the console.
void printHelloWorld() {
  print("Hello World");
  print("==============================");
}

void variablesAndDataTypes() {
  //2. Write a program that desclares variables of different data types and prints their values.
  int age = 25;
  double height = 5.9;
  String name = "John Doe";
  bool isStudent = true;
  const double pi = 3.14;
  print(
    "Age: $age, Height: $height, Name: $name, Is Student: $isStudent, pi: $pi",
  );
  print("==============================");
}

void conditionalStatements() {
  //3. Create a program that checks wheather a substance is acidic, neutral, or basic based on its pH value.
  const double phValue = 7.5;
  if (phValue < 7) {
    print("The substance is acidic.");
  } else if (phValue == 7) {
    print("The substance is neutral.");
  } else {
    print("The substance is basic.");
  }
  print("==============================");
}

void inventoryStocks() {
  //4. Write a program that simulates tracking inventory in a storr or warehouse.
  List<Map<String, dynamic>> products = [
    {"fruit": "Apple", "stock": 50},
    {"fruit": "Banana", "stock": 8},
    {"fruit": "Orange", "stock": 15},
    {"fruit": "Mango", "stock": 3},
    {"fruit": "Grapes", "stock": 20},
  ];

  for (var item in products) {
    if (item['stock'] < 10) {
      print(
        "Restock Alert: ${item['fruit']} - Low Stock (Only ${item['stock']} left)",
      );
    } else {
      print("${item['fruit']} - Stock is sufficient (${item['stock']} items)");
    }
  }
  print("==============================");
}

void computeNetSalary({
  required double salary,
  required double bonus,
  required double deduction,
}) {
  //5. Write a dart program that calculates an employees net salary
  print("Employee Salary Details: ");
  print("Base Salary: \$$salary");
  print("Bonus: \$$bonus");

  double grossSalary = salary + bonus;
  print("Gross Salary: \$$grossSalary");
  print("Deductions: \$$deduction");

  double netSalary = grossSalary - deduction;
  print("Net Salary: \$$netSalary");
  print("==============================");
}

enum days { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }

void printEmoji() {
  const today = days.Sunday;
  switch (today) {
    case days.Monday:
      print("😊");
      break;
    case days.Tuesday:
      print("😂");
      break;
    case days.Wednesday:
      print("😍");
      break;
    case days.Thursday:
      print("😁");
      break;
    case days.Friday:
      print("😘");
      break;
    case days.Saturday:
      print("😜");
      break;
    case days.Sunday:
      print("😢");
      break;
  }
}
