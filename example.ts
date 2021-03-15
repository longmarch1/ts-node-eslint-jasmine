const once = (fn: Function | null) => {
    return (...args: any[]) => {
        fn && fn(...args);
        fn = null;
    }
}

const onceAndAfter = (f1: Function | null, f2: Function) => {
    return (...args: any[]) => {
        f1 && f1(...args);
        !f1 && f2(...args);
        f1 = null;
    }
}

const thisManyTimes = (fn: Function, count: number) => {
    return (...args: any[]) => {
        if (count > 0) {
            fn(...args);
            count--;
        }
    }
}

const alternator = (f1: Function, f2: Function) => {
    return (...args: any[]) => {
        f1(...args);
        [f1, f2] = [f2, f1];
    }
}

export {
    once,
    onceAndAfter,
    thisManyTimes,
    alternator
};