//
//  GameScene.swift
//  FlappyBird
//
//  Created by 佐藤佳子 on 2023/01/08.
//

import SpriteKit

class GameScene: SKScene {
    var scrollNode:SKNode!
    // SKView上にシーンが表示された時に呼ばれるメソッド
    override func didMove(to view: SKView) {
        // 背景色を設定
        backgroundColor = UIColor(red: 0.15, green: 0.75, blue: 0.90, alpha: 1)
        // スクロールするスプライトの親ノード
        scrollNode = SKNode()
        addChild(scrollNode)
        // 地面の画像を読み込む
        let groundTexture = SKTexture(imageNamed: "ground")
        groundTexture.filteringMode = .nearest

        // 必要な枚数を計算
        let needNumber = Int(self.frame.size.width / groundTexture.size().width) + 2

        // スクロールするアクションを作成
        // 左方向に画像一枚分スクロールさせるアクション
        let moveGround = SKAction.moveBy(x: -groundTexture.size().width, y: 0, duration: 5)
        // 元の位置に戻すアクション
        let resetGround = SKAction.moveBy(x: groundTexture.size().width, y: 0, duration: 0)
        // 左にスクロール->元の位置->左にスクロールと無限に繰り返すアクション
        let repeatScrollGround = SKAction.repeatForever(SKAction.sequence([moveGround, resetGround]))

        
        // テクスチャを指定してスプライを作成する
        for i in 0..<needNumber{
            let sprite = SKSpriteNode(texture:groundTexture)
            // スプライトの表示する位置を指定する
            sprite.position = CGPoint(
                x: groundTexture.size().width / 2 + groundTexture.size().width * CGFloat(i),
                y: groundTexture.size().height / 2
            )
            // スプライトにアクションを追加する
            sprite.run(repeatScrollGround)
            // シーンにスプライをと追加する
            scrollNode.addChild(sprite)

        }
    }

}
