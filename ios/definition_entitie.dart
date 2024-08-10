
import 'package:equatable/equatable.dart';

class DefinitionEntitie extends Equatable {
   final String definitionWord;
   final List<dynamic> synonymsWord;
   final List<dynamic> antonymsWord;
   final String? exampleWord;

   const DefinitionEntitie({
        required this.definitionWord,
        required this.synonymsWord,
        required this.antonymsWord,
        this.exampleWord,
    });
    
      @override
      List<Object?> get props => [
        definitionWord,
        synonymsWord,
        antonymsWord,
        exampleWord
      ];

}