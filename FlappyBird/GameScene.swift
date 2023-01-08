//
//  GameScene.swift
//  FlappyBird
//
//  Created by 佐藤佳子 on 2023/01/08.
//

import SpriteKit

class GameScene: SKScene {
    // SKView上にシーンが表示された時に呼ばれるメソッド
    override func didMove(to view: SKView) {
        // 背景色を設定
        backgroundColor = UIColor(red: 0.15, green: 0.75, blue: 0.90, alpha: 1)
    }

}
