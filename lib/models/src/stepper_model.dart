import 'dart:io';

class SteppeModel {
  String? fullName;
  String? email;
  String? nationality;
  int? nationalNo;
  int? passportNo;
  int? phoneNo;
  String? returnOfTheIdea;
  String? ideaExplaination;
  File? personalImage;
  File? nationaIdFrontImage;
  File? nationaIdBackImage;
  File? passportImage;

  SteppeModel({
    this.fullName = '',
    this.email = '',
    this.nationality = 'Egyptian',
    this.nationalNo,
    this.passportNo,
    this.phoneNo,
    this.returnOfTheIdea = '',
    this.ideaExplaination = '',
    this.personalImage,
    this.nationaIdFrontImage,
    this.nationaIdBackImage,
    this.passportImage,
  });

  @override
  String toString() {
    return '''
      SteppeModel:
      fullName: ${this.fullName},
      email: ${this.email},
      nationality: ${this.nationality},
      nationalNo: ${this.nationalNo},
      passportNo: ${this.passportNo},
      phoneNo: ${this.phoneNo},
      returnOfTheIdea: ${this.returnOfTheIdea},
      ideaExplaination: ${this.ideaExplaination},
      personalImage: ${this.personalImage?.path},
      nationaIdFrontImage: ${this.nationaIdFrontImage?.path},
      nationaIdBackImage: ${this.nationaIdBackImage?.path},
      passportImage: ${this.passportImage?.path},
     
    ''';
  }
}
