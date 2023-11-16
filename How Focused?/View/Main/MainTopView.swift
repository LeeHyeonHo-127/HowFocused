
import UIKit
import SnapKit

class MainTopView: UIView{
    
    lazy var dateLabel: UILabel = UILabel()
    lazy var dayOfWeekLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainTopView: ViewCodeProtocol{
    func buildViewHierachy() {
        addSubview(dateLabel)
        addSubview(dayOfWeekLabel)
    }
    
    func setUpConstraint() {
        dateLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalTo(15)
        }
        
        dayOfWeekLabel.snp.makeConstraints{ make in
            make.top.equalTo(dateLabel.snp.bottom)
            make.leading.equalTo(dateLabel.snp.leading)
        }
    }
    
    func configureView() {
        dateLabel.text = "1 1 월 1 6 일"
        dateLabel.font = UIFont(name: "Impact", size: 45)
        
        dayOfWeekLabel.text = "수요일"
        dayOfWeekLabel.font = UIFont(name: "Impact", size: 45)
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
