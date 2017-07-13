class TimelineJS {
    constructor() {
        // NOOP
    }

    replaceByElement(element) {
        // NOOP
    }

    replaceBySelector(selector) {
        var element = document.querySelector(selector);
        console.log(element);
    }
}


if (window) {
    window.TimelineJS = TimelineJS;
}

if (module) {
    module.exports = TimelineJS;
}
