//
//  RapresentableInRectProtocol.swift
//  cooKids (iOS)
//
//  Created by Anna Izzo on 18/11/21.
//


import Foundation
protocol RapresentableInRectProtocol {
	var title: String {get}
	var imageName: String {get}
	var trophies: [Trophy] {get}
}
