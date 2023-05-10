//
//  AgreementsService.swift
//  Created by Ilya Sakalou on 10/05/2023.
//

import Foundation

final class BasicAgreementsService: AgreementsService {
  func fetchAgreements(completion: ([Agreement]) -> Void) {
    completion([])
  }
}

protocol AgreementsService {
  func fetchAgreements(completion: ([Agreement]) -> Void)
}
