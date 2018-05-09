// ==UserScript==
// @name         Kibana Errors In Red
// @namespace    http://tampermonkey.net/
// @version      1
// @description  Kibana Errors In Red
// @author       Steven Robijns
// @include      *kibana*
// @grant        none
// @require http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js
// ==/UserScript==

$("document").ready(function() {
    function setErrorCountRedIfGreatherThanZero() {
        'use strict';

        var errors = $(".metric-container").has("div:contains('Error')");
        if (errors && errors.length) {
            for (var i = 0; i < errors.length; i++) {
                var errorCountContainerEl = $(errors[i]).find(".metric-value");

                if (!errorCountContainerEl || !errorCountContainerEl.length)
                    continue;

                var errorCount = +errorCountContainerEl[0].innerText;
                if (errorCount > 0) {
                    errors.css("color", "red");
                }
                else {
                    errors.css("color", "black");
                }
            }
        }
    }

    (function(){
        setInterval(setErrorCountRedIfGreatherThanZero, 1000);
    })();
});
