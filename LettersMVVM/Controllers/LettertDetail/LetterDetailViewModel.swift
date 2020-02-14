//
//  LetterDetailViewModel.swift
//  LettersMVVM
//
//  Created by Raphael Oliveira Chagas on 12/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import UIKit

class LetterDetailViewModel {
    
    var letter: Letter
    var link: String?
    let linkDefault = "https://pt.wikipedia.org/wiki/"
    
    init(letter: Letter) {
        self.letter = letter
    }
    
    func setup(view: LetterDetailViewController) {
        view.letterLabel.text = letter.character
        view.descriptionLabel.text = letter.description
        view.title = "detalhes"
        guard let attributedString = createLink() else { return }
        view.linkLabel.attributedText = attributedString
        view.linkLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openUrl(_:))))
    }
    @objc
    private func openUrl(_ sender: UILabel) {
        guard let link = link, let url = URL(string: link) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    private func createLink() -> NSMutableAttributedString? {
        let link = "\(linkDefault)\(letter.character)"
        let attributedString = NSMutableAttributedString(string: link)
        guard let url = URL(string: link) else { return nil }
        attributedString.setAttributes([.link: url], range: NSMakeRange(0,link.count))
        self.link = link
        return attributedString
    }
}
