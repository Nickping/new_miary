//
//  MusicModel.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/03/08.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import Foundation
import RxSwift

enum SearchType {
    case artist, album, title
}

protocol MusicModelDelegate: class {
    func didCompleteSearch(for type: SearchType)
}

class MusicModel {
    
    weak var delegate: MusicModelDelegate?
    
    func search(for type: SearchType, keyword: String) {
        switch type {
        case .album:
            searchAlbum(keyword: keyword)
        case .artist:
            searchArtist(keyword: keyword)
        case .title:
            searchTitle(keyword: keyword)
        }
    }
    
    private func searchAlbum(keyword: String) {
        delegate?.didCompleteSearch(for: .album)
    }
    
    private func searchTitle(keyword: String) {
        
    }
    
    private func searchArtist(keyword: String) {
        
    }
}
