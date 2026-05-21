//
//  CallsTableManager.swift
//  UIKitStudy
//
//  Created by Cauê Carneiro on 21/05/26.
//

import UIKit

class CallsTableManager: NSObject, UITableViewDataSource, UITableViewDelegate {

    private let calls: [CallModel] = [
        CallModel(name: "Neyfera", date: "14:00", status: .missed, imageName: "ney"),
        CallModel(name: "Elon Musk", date: "15/10/26", status: .outgoing, imageName: "elon"),
        CallModel(name: "Steve Jobs", date: "Segunda-feira", status: .incoming, imageName: "steve"),
        CallModel(name: "Ancelloti", date: "Domingo", status: .missed, imageName: "carlito"),
        CallModel(name: "Messi", date: "Ontem", status: .incoming, imageName: "messi")
    ]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calls.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CallViewCell.identifier, for: indexPath) as? CallViewCell else {
            return UITableViewCell()
        }

        let call = calls[indexPath.row]
        cell.configure(model: call)
        cell.didTapInfoButton = {
            print("Botao de info de \(call.name) clicado")
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let call = calls[indexPath.row]
        print("Ligação iniciada para \(call.name)")
    }
}
