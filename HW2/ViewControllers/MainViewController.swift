//
//  ViewController.swift
//  HW2
//
//  Created by Maxim on 17.09.2022.
//

import UIKit

final class MainViewController: UIViewController {

    //MARK: - IBAOutlets

    @IBOutlet weak var iconCharacterView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    //MARK: - IBAction

    @IBAction func getRandomCharacterButton(_ sender: Any) {
        fetchCharacter()
    }

    //MARK: - Private methods

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
                let results = try jsonDecoder.decode(Results.self, from: data)

                // guard let image = UIImage(data: data) else { return }          с картинкой не разбрался

                DispatchQueue.main.async {

                    let index = Int.random(in: 1..<results.results.count)
                    /*
                     кривой диапазон. не получилось сделать от количесива персонажей. character.name
                     */

                    self.nameLabel.text = results.results[index].name
                    self.descriptionLabel.text = results.results[index].description

                    // self.iconCharacterView.image = results.results[index].image
                }

            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

