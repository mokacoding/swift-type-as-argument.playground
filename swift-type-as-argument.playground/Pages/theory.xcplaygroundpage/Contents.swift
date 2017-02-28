//
// Passing a reference to a class type
//
class Foo {
    static func foo() { }
}

func foos(fooClass: Foo.Type = Foo.self) {
    fooClass.foo()
}

//
// Passing a reference to a struct type
//
struct Bar {
    static func bar() { }
}

func bars(barType: Bar.Type = Bar.self) {
    barType.bar()
}

// There's obiviously no difference between the two. In Swift at type is a type, doesn't matter
// if a class or struct.
// Because of this we can do the same with protocols.

protocol Helper {
    static func helps()
}

func helpMe(_ helper: Helper.Type) {
    helper.helps()
}