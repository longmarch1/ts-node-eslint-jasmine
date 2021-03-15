import "jasmine";
import {
    once, onceAndAfter, thisManyTimes, alternator,
} from "../example";

describe("Example", () => {
    let foo : any;
    const f1 = () => {};
    const f2 = () => {};

    beforeEach(() => {
        foo = {
            f1,
            f2,
        };
        spyOn(foo, "f1");
        spyOn(foo, "f2");
    });

    it("once", () => {
        const oneCall = once(foo.f1);
        oneCall();
        oneCall();

        expect(foo.f1.calls.count()).toEqual(1);
    });

    it("onceAndAfter", () => {
        const call = onceAndAfter(foo.f1, foo.f2);
        call();
        call();
        call();
        call();

        expect(foo.f1.calls.count()).toEqual(1);
        expect(foo.f2.calls.count()).toEqual(3);
    });

    it("alternator", () => {
        const call = alternator(foo.f1, foo.f2);
        call();
        call();
        call();
        call();

        expect(foo.f1.calls.count()).toEqual(2);
        expect(foo.f2.calls.count()).toEqual(2);
    });

    it("thisManyTimes", () => {
        const call = thisManyTimes(foo.f1, 3);
        call();
        call();
        call();
        call();

        expect(foo.f1.calls.count()).toEqual(3);
    });
});
