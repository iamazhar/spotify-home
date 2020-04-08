import UIKit;

enum SPTColor: String {

    case
    homeBgGradientTop,
    bgGridCell,
    homeBgGradientBottom

    var value: UIColor {
        switch self {
        case .homeBgGradientTop:
            return UIColor( red: (126.0)/255, green: (63.0)/255, blue: (71.0)/255, alpha: (1.0) );
        case .bgGridCell:
            return UIColor( red: (42.0)/255, green: (40.0)/255, blue: (40.0)/255, alpha: (1.0) );
        case .homeBgGradientBottom:
            return UIColor( red: (18.0)/255, green: (18.0)/255, blue: (18.0)/255, alpha: (1.0) );
        }
    }
}

extension UIColor{
    
    class func homeBgGradientTop() -> UIColor{
        
        return UIColor( red: (126.0)/255, green: (63.0)/255, blue: (71.0)/255, alpha: (1.0) );
    }
    
    class func bgGridCell() -> UIColor{
        
        return UIColor( red: (42.0)/255, green: (40.0)/255, blue: (40.0)/255, alpha: (1.0) );
    }
    
    class func homeBgGradientBottom() -> UIColor{
        
        return UIColor( red: (18.0)/255, green: (18.0)/255, blue: (18.0)/255, alpha: (1.0) );
    }
    
}
