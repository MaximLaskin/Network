//
//  ViewController.swift
//  HW2
//
//  Created by Maxim on 17.09.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func ButtonPressed(_ sender: UIButton) {
        guard let url = URL(string: "https://random-d.uk/api") else { return }

        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: url) { data, response, error  in
            guard let data = data else { return }
            print(data)
            print(error)
            return
        }

        task.resume()
    }

    // MARK: - Private Methods
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the results in the Debug aria",
                preferredStyle: .alert
            )

            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }

    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see error in the Debug aria",
                preferredStyle: .alert
            )

            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }

}

