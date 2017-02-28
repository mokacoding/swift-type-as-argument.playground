protocol GlobalHelper {
    static func someSideEffect()
}

class LegacyGlobalHelper: GlobalHelper {
    static func someSideEffect() { }
}

class MyService {
    func doStuffWithSideEffect(globalHelper: GlobalHelper.Type = LegacyGlobalHelper.self) {
        // ...
        globalHelper.someSideEffect()
        // ...
    }
}

import XCTest

class GlobalHelperMock: GlobalHelper {
    static var someSideEffectCalled = false

    static func someSideEffect() {
        someSideEffectCalled = true
    }
}

class MyServiceTest: XCTest {

    func testDoStuffWithSideEffect() {
        let service = MyService()
        let mockHelper = GlobalHelperMock.self

        service.doStuffWithSideEffect(globalHelper: mockHelper)

        XCTAssertTrue(mockHelper.someSideEffectCalled)

        // Playgrounds don't run assertions, so let's use this to see if
        // the test passed
        if mockHelper.someSideEffectCalled {
            print("✅")
        } else {
            print("❌ expected some side effect to be performed")
        }
    }
}

MyServiceTest().testDoStuffWithSideEffect()