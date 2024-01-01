//view code protocoㅣ
  
import Foundation

public protocol ViewCodeProtocol {
    func buildViewHierachy()
    func setUpConstraint()
    func configureView()
}

public extension ViewCodeProtocol {
    func applyViewCode(){
        buildViewHierachy()
        setUpConstraint()
        configureView()
    }
    
    func configureView(){
        
    }
}


