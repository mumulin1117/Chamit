//
//  MITTBuilsdProgressPortal.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/13.
//

import UIKit

class MITTBuilsdProgressPortal {
    
    static let MITTBuilsdShared = MITTBuilsdProgressPortal()
    
    private var MITTBuilsdOvercoatView: UIView?
    private var MITTBuilsdIndicator: UIActivityIndicatorView?
    private var MITTBuilsdMessageLabel: UILabel?
    private var MITTBuilsdIconLayer: UIImageView?
    
    private let MITTBuilsdBrandViolet = UIColor(red: 0.63, green: 0.47, blue: 0.94, alpha: 1.0)
    
    private init() {}

    // MARK: - Core Interface
    
    /// 显示纯加载旋转器
    func MITTBuilsdEngage(on MITTBuilsdHost: UIView? = nil) {
        MITTBuilsdDeployPortal(on: MITTBuilsdHost, MITTBuilsdMode: .MITTBuilsdLoading, MITTBuilsdText: nil)
    }
    
    /// 显示成功提示 (带文字)
    func MITTBuilsdAnnounceSuccess(_ MITTBuilsdMsg: String, on MITTBuilsdHost: UIView? = nil) {
        MITTBuilsdDeployPortal(on: MITTBuilsdHost, MITTBuilsdMode: .MITTBuilsdSuccess, MITTBuilsdText: MITTBuilsdMsg)
        MITTBuilsdScheduleAutoDismiss(after: 2.0)
    }
    
    /// 显示失败提示 (带文字)
    func MITTBuilsdAnnounceFailure(_ MITTBuilsdMsg: String, on MITTBuilsdHost: UIView? = nil) {
        MITTBuilsdDeployPortal(on: MITTBuilsdHost, MITTBuilsdMode: .MITTBuilsdError, MITTBuilsdText: MITTBuilsdMsg)
        MITTBuilsdScheduleAutoDismiss(after: 2.5)
    }

    // MARK: - Internal Engine
    
    private enum MITTBuilsdPortalMode {
        case MITTBuilsdLoading, MITTBuilsdSuccess, MITTBuilsdError
    }

    private func MITTBuilsdDeployPortal(on MITTBuilsdHost: UIView?, MITTBuilsdMode: MITTBuilsdPortalMode, MITTBuilsdText: String?) {
        MITTBuilsdDismiss() // 清除旧的实例
        
        let MITTBuilsdWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        guard let MITTBuilsdTarget = MITTBuilsdHost ?? MITTBuilsdWindow else { return }
        
        // 1. 全屏遮罩
        let MITTBuilsdShield = UIView(frame: MITTBuilsdTarget.bounds)
        MITTBuilsdShield.backgroundColor = .clear // 提示文字时通常不需要全屏半透明
        
        // 2. 毛玻璃容器
        let MITTBuilsdBox = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
        MITTBuilsdBox.layer.cornerRadius = 18
        MITTBuilsdBox.clipsToBounds = true
        MITTBuilsdBox.translatesAutoresizingMaskIntoConstraints = false
        
        // 3. 内容堆栈
        let MITTBuilsdStack = UIStackView()
        MITTBuilsdStack.axis = .vertical
        MITTBuilsdStack.spacing = 12
        MITTBuilsdStack.alignment = .center
        MITTBuilsdStack.translatesAutoresizingMaskIntoConstraints = false
        
        // 4. 根据模式添加图标或旋转器
        switch MITTBuilsdMode {
        case .MITTBuilsdLoading:
            let MITTBuilsdSpinner = UIActivityIndicatorView(style: .large)
            MITTBuilsdSpinner.color = MITTBuilsdBrandViolet
            MITTBuilsdSpinner.startAnimating()
            MITTBuilsdStack.addArrangedSubview(MITTBuilsdSpinner)
            self.MITTBuilsdIndicator = MITTBuilsdSpinner
        case .MITTBuilsdSuccess, .MITTBuilsdError:
            let MITTBuilsdIcon = UIImageView()
            MITTBuilsdIcon.contentMode = .scaleAspectFit
            MITTBuilsdIcon.tintColor = .white
            let MITTBuilsdSymbol = (MITTBuilsdMode == .MITTBuilsdSuccess) ? "checkmark.circle.fill" : "exclamationmark.triangle.fill"
            MITTBuilsdIcon.image = UIImage(systemName: MITTBuilsdSymbol)
            MITTBuilsdIcon.widthAnchor.constraint(equalToConstant: 36).isActive = true
            MITTBuilsdIcon.heightAnchor.constraint(equalToConstant: 36).isActive = true
            MITTBuilsdStack.addArrangedSubview(MITTBuilsdIcon)
        }
        
        // 5. 文字标签
        if let MITTBuilsdString = MITTBuilsdText {
            let MITTBuilsdLabel = UILabel()
            MITTBuilsdLabel.text = MITTBuilsdString
            MITTBuilsdLabel.textColor = .white
            MITTBuilsdLabel.font = .systemFont(ofSize: 14, weight: .medium)
            MITTBuilsdLabel.numberOfLines = 0
            MITTBuilsdLabel.textAlignment = .center
            MITTBuilsdStack.addArrangedSubview(MITTBuilsdLabel)
        }
        
        // 布局挂载
        MITTBuilsdBox.contentView.addSubview(MITTBuilsdStack)
        MITTBuilsdShield.addSubview(MITTBuilsdBox)
        MITTBuilsdTarget.addSubview(MITTBuilsdShield)
        
        NSLayoutConstraint.activate([
            MITTBuilsdBox.centerXAnchor.constraint(equalTo: MITTBuilsdShield.centerXAnchor),
            MITTBuilsdBox.centerYAnchor.constraint(equalTo: MITTBuilsdShield.centerYAnchor),
            MITTBuilsdBox.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            MITTBuilsdBox.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            MITTBuilsdBox.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            
            MITTBuilsdStack.centerXAnchor.constraint(equalTo: MITTBuilsdBox.contentView.centerXAnchor),
            MITTBuilsdStack.centerYAnchor.constraint(equalTo: MITTBuilsdBox.contentView.centerYAnchor),
            MITTBuilsdStack.leadingAnchor.constraint(equalTo: MITTBuilsdBox.contentView.leadingAnchor, constant: 15),
            MITTBuilsdStack.trailingAnchor.constraint(equalTo: MITTBuilsdBox.contentView.trailingAnchor, constant: -15)
        ])
        
        MITTBuilsdShield.alpha = 0
        MITTBuilsdBox.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            MITTBuilsdShield.alpha = 1
            MITTBuilsdBox.transform = .identity
        }
        
        self.MITTBuilsdOvercoatView = MITTBuilsdShield
    }
    
    func MITTBuilsdDismiss() {
        guard let MITTBuilsdView = MITTBuilsdOvercoatView else { return }
        MITTBuilsdOvercoatView = nil
        
        UIView.animate(withDuration: 0.2, animations: {
            MITTBuilsdView.alpha = 0
            MITTBuilsdView.subviews.first?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }) { _ in
            MITTBuilsdView.removeFromSuperview()
        }
    }
    
    private func MITTBuilsdScheduleAutoDismiss(after MITTBuilsdSeconds: TimeInterval) {
        let MITTBuilsdToken = UUID()
        // 此处可以加入简单的令牌检查，防止多个弹窗冲突
        DispatchQueue.main.asyncAfter(deadline: .now() + MITTBuilsdSeconds) {
            self.MITTBuilsdDismiss()
        }
    }
}

// MARK: - UIViewController Convenience Extension

extension UIViewController {
    
    func MITTBuilsdFlowStart() {
        MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdEngage(on: self.view)
    }
    
    func MITTBuilsdFlowSuccess(_ MITTBuilsdInfo: String) {
        MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdAnnounceSuccess(MITTBuilsdInfo, on: self.view)
    }
    
    func MITTBuilsdFlowFailure(_ MITTBuilsdErr: String) {
        MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdAnnounceFailure(MITTBuilsdErr, on: self.view)
    }
    
    func MITTBuilsdFlowStop() {
        MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdDismiss()
    }
}
// MARK: - 快捷调用混淆扩展
extension UIViewController {
    func MITTBuilsdShowLoading() {
        MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdEngage(on: self.view)
    }
    
    func MITTBuilsdHideLoading() {
        MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdDismiss()
    }
}
