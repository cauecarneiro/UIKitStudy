//
//  ViewController.swift
//  StoryboardEstudoDeCaso
//
//  Created by Joao pedro Leonel on 18/05/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let badges = [2, 1, 1, 1, 2, 1, 2, 1]

    let fotos = ["ney", "carlito", "hugo","tigas", "cr7", "messi","Yuri", "neypai"]
    let nomes = ["Neymar.Jr", "Ancelotti", "Neneca", "Tigas Silva","SIIUU", "Etezinho", "Protagonista", "NeyPai"]
    let mensagens = ["Te falei que ia me chamar!", "Tudo nosso, nada deles!", "Obrigado pelo apoio irmão!", "Pendurar a chuteiras né!", "Preparado para a last dance?", "Ta no papo kkkkk...", "Faltou eu la kkkkk", "Agora eu vou lucrar💰🤑"]
    let horarios = ["19:00", "19:10", "19:11", "19:14","16:14", "19:45", "19:42", "18:23"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nomes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CelulaContato01", for: indexPath) as! ContatoCell
        cell.nomeLabel.text = nomes[indexPath.row]
        cell.mensagemLabel.text = mensagens[indexPath.row]
        cell.horarioLabel.text = horarios[indexPath.row]
//        cell.fotoImageView.image = UIImage(named: "jenny")
//        cell.fotoImageView.image = UIImage(systemName: "person.circle.fill")
        cell.fotoImageView.image = UIImage(named: fotos[indexPath.row])
        
        let badge = badges[indexPath.row]
            cell.badgeLabel.isHidden = badge == 0
            cell.badgeLabel.text = "\(badge)"
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Conversation", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? ConversationViewController else { return }
        vc.contactName = nomes[indexPath.row]
        vc.contactImageName = fotos[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

