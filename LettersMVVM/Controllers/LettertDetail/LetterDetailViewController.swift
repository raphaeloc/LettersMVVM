//
//  LetterDetailViewController.swift
//  LettersMVVM
//
//  Created by Raphael Oliveira Chagas on 12/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import UIKit

class LetterDetailViewController: UIViewController {

    @IBOutlet weak var letterLabel: UILabel!
    @IBOutlet weak var aboutLetterLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    var viewModel: LetterDetailViewModel
    
    init(viewModel: LetterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setup(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
