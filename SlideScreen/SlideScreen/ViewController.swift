//
//  ViewController.swift
//  SlideScreen
//
//  Created by Camila Ribeiro Rodrigues on 16/01/22.
//

import UIKit

class ViewController: UIViewController {

	private var currentScreen = 0
	
	private enum Strings {
		static let meditateTexts = [
			"Truly know yourself,\nNotice your essence and\nRise and shine for who you really are.",
			"Practice 5 minutes a day\nand feel the benefits of it.",
			""]
		static let titleStrings = ["Meditate", "", "Namaste!"]
		static let slideName = ["meditate1", "meditate2", "meditate3"]
		static let dotName = ["full-circle", "circle", "circle"]
		static let dotName1 = ["circle", "full-circle", "circle"]
		static let dotName2 = ["circle", "circle", "full-circle"]
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		loadSubViews()
		swipeScreen()
	}
	
	private var meditateImageView: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()

	private var titleLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.boldSystemFont(ofSize: 26)
		label.textColor = .black
		label.textAlignment = .center
		label.numberOfLines = 0
		return label
	}()

	private var meditateLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
		label.textColor = .black
		label.textAlignment = .center
		label.numberOfLines = 0
		return label
	}()

	private var dotImageView: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()

	private var dotImageView1: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()

	private var dotImageView2: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private func loadSubViews() {
		meditateImageView.image = UIImage(named: Strings.slideName[currentScreen])
		view.addSubview(meditateImageView)
		meditateImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		meditateImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		meditateImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
		meditateImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height).isActive = true
		
		meditateLabel.text = Strings.meditateTexts[currentScreen]
		view.addSubview(meditateLabel)
		meditateLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
		meditateLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
		meditateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		meditateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true

		titleLabel.text = Strings.titleStrings[currentScreen]
		view.addSubview(titleLabel)
		titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		titleLabel.bottomAnchor.constraint(equalTo: meditateLabel.topAnchor, constant: -10).isActive = true

		dotImageView.image = UIImage(named: Strings.dotName[0])
		view.addSubview(dotImageView)
		dotImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 158).isActive = true
		dotImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -68).isActive = true

		dotImageView1.image = UIImage(named: Strings.dotName[1])
		view.addSubview(dotImageView1)
		dotImageView1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		dotImageView1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -68).isActive = true

		dotImageView2.image = UIImage(named: Strings.dotName[2])
		view.addSubview(dotImageView2)
		dotImageView2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -158).isActive = true
		dotImageView2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -68).isActive = true
	}
	
	private func swipeScreenDirection (direction: UISwipeGestureRecognizer.Direction) {
		switch direction {
		case .left:
			if currentScreen == Strings.slideName.count - 1 {
				return
			} else {
				currentScreen += 1
			}
		case .right:
			if currentScreen == 0 {
				return
			} else {
				currentScreen -= 1
			}
		default:
			break
		}
		
		meditateImageView.alpha = 0
		UIView.animate(withDuration: 0.7, animations: {
			self.meditateImageView.image = UIImage(named: Strings.slideName[self.currentScreen])
			self.meditateImageView.alpha = 1
		})

		meditateLabel.text = Strings.meditateTexts[currentScreen]
		titleLabel.text = Strings.titleStrings[currentScreen]

		UIView.animate(withDuration: 0.2, animations: {
			switch self.currentScreen {
			case 0:
				self.dotImageView.image = UIImage(named: Strings.dotName[0])
				self.dotImageView1.image = UIImage(named: Strings.dotName[1])
				self.dotImageView2.image = UIImage(named: Strings.dotName[2])
			case 1:
				self.dotImageView.image = UIImage(named: Strings.dotName1[0])
				self.dotImageView1.image = UIImage(named: Strings.dotName1[1])
				self.dotImageView2.image = UIImage(named: Strings.dotName1[2])
			default:
				self.dotImageView.image = UIImage(named: Strings.dotName2[0])
				self.dotImageView1.image = UIImage(named: Strings.dotName2[1])
				self.dotImageView2.image = UIImage(named: Strings.dotName2[2])
			}
			self.view.layoutIfNeeded()
		}, completion: nil)
	}
	
	private func swipeScreen () {
		let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
		swipeRight.direction = UISwipeGestureRecognizer.Direction.right
			self.view.addGestureRecognizer(swipeRight)

		let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
		swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
			self.view.addGestureRecognizer(swipeLeft)
	}
	
	@objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
		if let swipeGesture = gesture as? UISwipeGestureRecognizer {
			switch swipeGesture.direction {
			case UISwipeGestureRecognizer.Direction.left:
				swipeScreenDirection(direction: .left)
			case UISwipeGestureRecognizer.Direction.right:
				swipeScreenDirection(direction: .right)
			default:
				break
			}
		}
	}
}

