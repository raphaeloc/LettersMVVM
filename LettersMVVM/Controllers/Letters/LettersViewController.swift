//
//  LettersViewController.swift
//  LettersMVVM
//
//  Created by Raphael Oliveira Chagas on 11/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import UIKit

class LettersViewController: UIViewController {
    
    let letterNib = UINib(nibName: String(describing: LetterCollectionViewCell.self), bundle: Bundle.main)
    let numberOfItemsPerLine: CGFloat = 3
    let marginOfItems: CGFloat = 10
    
    var viewModel: LettersViewModel
    var lettersList: LettersModel
    var coordinator: LettersCoordinator?
    var lastMountedCell: LetterCollectionViewCell?

    @IBOutlet weak var collectionView: UICollectionView!
    
    init(viewModel: LettersViewModel) {
        self.viewModel = viewModel
        self.lettersList = viewModel.getLetters()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "letras"
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension LettersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let letter = lettersList.letters[indexPath.row]
        coordinator?.openDetails(letter: letter)
    }
}

extension LettersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lettersList.letters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(letterNib, forCellWithReuseIdentifier: LetterCollectionViewCell.identifier)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LetterCollectionViewCell.identifier, for: indexPath) as? LetterCollectionViewCell else { fatalError() }
        
        cell.letterLabel.text = lettersList.letters[indexPath.row].character
        
        if let lastMountedCell = lastMountedCell {
            var color = viewModel.getRandomColor()
            while lastMountedCell.holderView.backgroundColor == color {
                color = viewModel.getRandomColor()
            }
            cell.holderView.backgroundColor = color
        } else {
            cell.holderView.backgroundColor = viewModel.getRandomColor()
        }
        cell.layoutCell()
        
        lastMountedCell = cell
        return cell
    }
}

extension LettersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / numberOfItemsPerLine - marginOfItems
        let height = width
        return CGSize(width: width, height: height)
    }
}
