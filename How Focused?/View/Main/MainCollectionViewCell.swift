
import UIKit
import SnapKit

class MainCollectionViewCell_1: UICollectionViewCell{
    
    lazy var timerView1: UIView = UIView()
    lazy var timerText1: UILabel = UILabel()
    lazy var timerView2: UIView = UIView()
    lazy var timerText2: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainCollectionViewCell_1: ViewCodeProtocol{
    func buildViewHierachy() {
        addSubview(timerView1)
//        addSubview(timerView2)
        timerView1.addSubview(timerText1)
//        timerView2.addSubview(timerText2)
    }
    
    func setUpConstraint() {
        timerView1.snp.makeConstraints{
            $0.height.equalTo(UIScreen.main.bounds.height/9)
            $0.width.equalTo(UIScreen.main.bounds.width - 30)
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
//        timerView2.snp.makeConstraints{
//            $0.height.equalTo(UIScreen.main.bounds.height/9)
//            $0.width.equalTo(UIScreen.main.bounds.width - 30)
//            $0.top.equalTo(timerView1.snp.bottom).offset(10)
//            $0.centerX.equalToSuperview()
//        }
        
        timerText1.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
//        timerText2.snp.makeConstraints{
//            $0.centerX.equalToSuperview()
//            $0.centerY.equalToSuperview()
//        }
    }
    
    func configureView() {
        timerView1.backgroundColor = UIColor.howFocusYellow
        timerView1.layer.cornerRadius = 20

//        timerView2.backgroundColor = UIColor.howFocusGreen
//        timerView2.layer.cornerRadius = 20
        
        timerText1.text = "0 1 H 2 5 M"
        timerText1.font = UIFont(name: "Impact", size: 50)
        
//        timerText2.text = "1 8 H 1 8 M"
//        timerText2.font = UIFont(name: "Impact", size: 50)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MainCollectionViewCell_1_Preview: PreviewProvider{
    static var previews: some View{
        UIViewPreview{
            let view = MainCollectionViewCell_1()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
