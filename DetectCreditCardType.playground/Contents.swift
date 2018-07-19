import Foundation

enum CreditCardType: String {
  
  case Amex = "Amex"
  case DinnersClub = "DinnersClub"
  case Discover = "Discover"
  case MC = "MC"
  case JCB = "JCB"
  case Visa = "Visa"
  
  static let allValues = [Amex, DinnersClub, Discover, MC, JCB,Visa]
  
  var pattern: String {
    switch self {
      case .Amex: return "^3[47][0-9]{13}$"
      case .DinnersClub: return "^3[068][0-9]{12}$"
      case .Discover: return "^6[05][0-9]{14}$"
      case .MC: return "^[52][0-9]{15}$"
      case .JCB: return "^35[0-9]{14}(?:[0-9]{1,3})?$"
      case .Visa: return "^4[0-9]{15}(?:[0-9]{1,3})?$"
    }
  }
}

func detectCreditCardType(numbers: String) -> String {
  for type in CreditCardType.allValues {
    do {
      let regex = try NSRegularExpression(pattern: type.pattern, options: .caseInsensitive)
      if regex.matches(in: numbers, options: [], range: NSMakeRange(0, numbers.count)).count > 0 {
        return type.rawValue
      }
    } catch {
      return "Unknown"
    }
  }
  
  return "Unknown"
}

// MARK: Amex
print(detectCreditCardType(numbers: "34111111111111"))
print(detectCreditCardType(numbers: "37111111111111"))
print(detectCreditCardType(numbers: "341111111111111"))
print(detectCreditCardType(numbers: "371111111111111"))
print(detectCreditCardType(numbers: "3411111111111112"))
print(detectCreditCardType(numbers: "3711111111111112"))
print(detectCreditCardType(numbers: "34111111111111x"))
print(detectCreditCardType(numbers: "37111111111111a"))

// MARK: DinnersClub
print(detectCreditCardType(numbers: "30111111111111"))
print(detectCreditCardType(numbers: "36111111111111"))
print(detectCreditCardType(numbers: "38111111111111"))

// MARK: Discover
print(detectCreditCardType(numbers: "6011111111111111"))
print(detectCreditCardType(numbers: "6511111111111112"))

// MARK: MC
print(detectCreditCardType(numbers: "5011111111111111"))
print(detectCreditCardType(numbers: "2511111111111112"))

// MARK: JCB
print(detectCreditCardType(numbers: "351111111111111"))
print(detectCreditCardType(numbers: "3511111111111111"))
print(detectCreditCardType(numbers: "35111111111111124"))
print(detectCreditCardType(numbers: "351111111111111245"))
print(detectCreditCardType(numbers: "3511111111111112467"))
print(detectCreditCardType(numbers: "35111111111111124671"))

// MARK: Visa
print(detectCreditCardType(numbers: "411111111111111"))
print(detectCreditCardType(numbers: "4111111111111111"))
print(detectCreditCardType(numbers: "41111111111111111"))
print(detectCreditCardType(numbers: "411111111111111111"))
print(detectCreditCardType(numbers: "4111111111111111111"))
print(detectCreditCardType(numbers: "41111111111111111111"))



