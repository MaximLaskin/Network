//
//  ViewController.swift
//  HW2
//
//  Created by Maxim on 17.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacter()
        }

    @IBAction func ButtonPressed(_ sender: UIButton) {
        fetchCharacter()

    }

    private func fetchCharacter() {

        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            print(String(decoding: data, as: UTF8.self))
            print(data)

            let jsonDecoder = JSONDecoder()
            do {
                let character = try jsonDecoder.decode(Character.self, from: data)
                DispatchQueue.main.async {
                self.nameLabel.text = character.name
                }

            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

