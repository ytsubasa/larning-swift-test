//
//  larning_swift_testTests.swift
//  larning-swift-testTests
//
//  Created by 吉田翔 on 2025/09/02.
//

import XCTest
@testable import larning_swift_test

final class larning_swift_testTests: XCTestCase {

    // 非同期処理のサンプル関数
    func fetchData(completion: @escaping (String) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            completion("OK")
        }
    }

    func testAsyncExample() throws {
        // 1. 期待値（Expectation）を作成
        let expectation = self.expectation(description: "Fetch data completes")

        // 2. 非同期処理を呼び出し
        fetchData { result in
            // 3. 結果を検証
            XCTAssertEqual(result, "OK")
            // 4. 完了したことを知らせる
            expectation.fulfill()
        }

        // 5. 最大2秒間待つ（fulfillが呼ばれなければ失敗）
        wait(for: [expectation], timeout: 2.0)
    }
}
