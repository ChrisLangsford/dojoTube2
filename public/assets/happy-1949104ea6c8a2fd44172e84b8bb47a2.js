!function(e){function t(t){return"".trim?t.val().trim():e.trim(t.val())}e.fn.isHappy=function(n){function s(e){return!!(e&&e.constructor&&e.call&&e.apply)}function a(t){var s=n.classes&&n.classes.message||"unhappyMessage";return e('<span id="'+t.id+'" class="'+s+'" role="alert">'+t.message+"</span>")}function r(e){return s(n.errorTemplate)?n.errorTemplate(e):a(e)}function i(){var e,t,a=!1;for(e=0,t=p.length;t>e;e+=1)p[e].testValid(!0)||(a=!0);return a?(s(n.unHappy)&&n.unHappy(),!1):n.testMode?(s(n.happy)&&n.happy(),window.console&&console.warn("would have submitted"),!1):void(s(n.happy)&&n.happy())}function o(){c=!1}function u(){c=!0,e(window).bind("mouseup",o)}function l(a,i){var o=e(i),u={message:a.message||"",id:i.slice(1)+"_unhappy"},l=e(u.id).length>0?e(u.id):r(u),d=function(){c?e(window).bind("mouseup",o.testValid.bind(this)):o.testValid()};p.push(o),o.testValid=function(r){var i,u,d,p=e(this),c=a.errorTarget&&e(a.errorTarget)||p,h=!1,m=!!p.get(0).attributes.getNamedItem("required")||a.required,f="password"===o.attr("type"),g=s(a.arg)?a.arg():a.arg,v=n.classes&&n.classes.field||"unhappy";return p.length>1?(i=[],p.each(function(t,n){i.push(e(n).val())}),i=i.join(",")):(i=s(a.clean)?a.clean(p.val()):!f&&"undefined"==typeof a.trim||a.trim?t(p):p.val(),p.val(i)),u=(i.length>0||"sometimes"===m)&&s(a.test),r===!0&&m===!0&&0===i.length?h=!0:u&&(h=!a.test(i,g)),h?(c.parent("div").addClass("has-error"),c.addClass(v).after(l),!1):(d=l.get(0),d.parentNode&&d.parentNode.removeChild(d),c.removeClass(v),!0)},o.bind(a.when||n.when||"blur",d)}var d,p=[],c=!1;for(d in n.fields)l(n.fields[d],d);return e(n.submitButton||this).bind("mousedown",u),n.submitButton?e(n.submitButton).click(i):this.bind("submit",i),this}}(this.jQuery||this.Zepto);