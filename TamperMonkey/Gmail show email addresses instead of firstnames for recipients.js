// ==UserScript==
// @name         Show email addresses instead of firstnames for recipients
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://mail.google.com
// @icon         https://www.google.com/s2/favicons?domain=google.com
// @grant        none
// @run-at        document-start
// ==/UserScript==

(function () {
    'use strict';

    window.addEventListener('load', function () {
        console.log("TamperMonkey gmail full email addresses instead of firstnames script launched");

        window.setInterval(function () {
            // span that contains the recipient's email address.
            let t = document.getElementsByClassName("g2");//

            console.log("Recipient fields found to change firstname by email for: " + t.length);
            for (let i = 0; i < t.length; i++) {
                let email = t[i].getAttribute("email");
                let html = t[i].textContent = email;
            }
        }, 1000);

    }, false);

})();