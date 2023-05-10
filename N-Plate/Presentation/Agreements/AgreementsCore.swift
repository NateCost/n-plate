//
//  AgreementsCore.swift
//  Created by Ilya Sakalou on 31/10/2021.
//

import Foundation

protocol AgreementsCoreType {
  var agreements: [Agreement] { get }
}

final class AgreementsCore: AgreementsCoreType {
  var agreements: [Agreement] = []
}

struct Agreement {
  let name: String
  let description: String
}

