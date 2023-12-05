
import UIKit
import SnapKit

class MainTopView: UIView{
    
    lazy var dateLabel: UILabel = UILabel() //날짜 라벨 입니다
    lazy var dayOfWeekLabel: UILabel = UILabel() //요일 라벨 입니다
    
    //응원 라벨 입니다
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = "괜찮아 할 수 있어. 파이팅."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sizeToFit()

        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainTopView: ViewCodeProtocol{
    func buildViewHierachy() {
        addSubview(topLabel)
    }
    
    func setUpConstraint() {
        
        //응원 라벨 Autolayout 지정 부분 입니다.
        topLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func configureView() {
        
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MainTopViewPreview: PreviewProvider{
    static var previews: some View{
        UIViewPreview{
            let view = MainTopView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
