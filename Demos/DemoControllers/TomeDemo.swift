import UIKit
import FittedSheets

class TomeDemo: UIViewController, Demoable {
    static var name: String { "Tome" }

    static func openDemo(from parent: UIViewController, in view: UIView?) {
        let useInlineMode = view != nil

        let viewController = FakeViewController()

        var dismissButtonImage: UIImage?
        if #available(iOS 13.0, *) {
            dismissButtonImage = UIImage(systemName: "xmark.circle")
        }
        let options = SheetOptions(
            shouldExtendBackground: false,
            useFullScreenMode: false,
            shrinkPresentingViewController: true,
            useInlineMode: useInlineMode,
            dismissButtonImage: dismissButtonImage
        )
        let sheetViewController = SheetViewController(controller: viewController,
                                                      sizes: [.percent(0.5), .fullscreen],
                                                      options: options)
        sheetViewController.gripSize = CGSize(width: 36.0, height: 5.0)
        sheetViewController.gripColor = UIColor.white.withAlphaComponent(0.16)
        sheetViewController.cornerRadius = 24.0
        if #available(iOS 13.0, *) { // not needed in Tome app
            sheetViewController.minimumSpaceAbovePullBar = (view?.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 40.0) + 8.0
        }
        sheetViewController.pullBarBackgroundColor = .darkGray
        sheetViewController.titleBarBackgroundColor = .darkGray
        sheetViewController.attributedTitle = NSAttributedString(string: "A B C D E F G A B C D E F G A B C D E F G A B C D E F G A B C D E F G A B C D E F G ",
                                                                 attributes: [
                                                                    .foregroundColor: UIColor.white,
                                                                    .font: UIFont.systemFont(ofSize: 18)
                                                                 ])
        sheetViewController.contentBackgroundColor = .darkGray
        sheetViewController.overlayColor = .clear

        if let view = view {
            sheetViewController.animateIn(to: view, in: parent)
        } else {
            parent.present(sheetViewController, animated: true, completion: nil)
        }
    }
}

class FakeViewController: UITableViewController {

    let cellReuseIdentifier = "cellReuseIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }
}
