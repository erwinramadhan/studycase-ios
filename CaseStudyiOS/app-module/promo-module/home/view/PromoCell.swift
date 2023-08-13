//
//  PromoCell.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 10/08/23.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

class PromoCell: UICollectionViewCell {
    
    static let identifier = "PromoCell"
    
    var data: PromoResponse? {
        didSet {
            guard let data = data else { return }
            guard let urlImg = URL(string: data.image?.url ?? "") else { return }
            image.load(url: urlImg)
        }
    }
    
    let stackview: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let cardContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        return view
    }()
    
    let image: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 12.0
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        cardContainerView.addSubview(image)
        stackview.addArrangedSubview(cardContainerView)
        contentView.addSubview(stackview)
        
        image.topAnchor.constraint(equalTo: cardContainerView.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: cardContainerView.bottomAnchor).isActive = true
        
        stackview.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
}
