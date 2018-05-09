// ==UserScript==
// @name         Kibana Errors In Red
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        http://*/*
// @grant        none
// @require http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js
// ==/UserScript==

(function() {
    'use strict';

    var errors = $(".metric-container").has("div:contains('Error')");
    if (errors && errors.length) {
        for (i = 0; i < errors.length; i++) {
           errors.css("color", "red");
        }
    }
})();