/*
 * jQuery Cycle Plugin (with Transition Definitions)
 * Examples and documentation at: http://malsup.com/jquery/cycle/
 * Copyright (c) 2007-2008 M. Alsup
 * Version: 2.32 (21-DEC-2008)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 * Requires: jQuery v1.2.3 or later
 *
 * Based on the work of:
 *	1) Matt Oakes (http://portfolio.gizone.co.uk/applications/slideshow/)
 *	2) Torsten Baldes (http://medienfreunde.com/lab/innerfade/)
 *	3) Benjamin Sterling (http://www.benjaminsterling.com/experiments/jqShuffle/)
 */
(function(a){function d(){window.console&&window.console.log&&window.console.log("[cycle] "+Array.prototype.join.call(arguments,""))}function e(b,c,d,g){if(c.busy)return;var h=c.container,i=b[c.currSlide],j=b[c.nextSlide];if(h.cycleTimeout===0&&!d)return;if(!d&&!h.cyclePause&&(c.autostop&&--c.countdown<=0||c.nowrap&&!c.random&&c.nextSlide<c.currSlide)){c.end&&c.end(c);return}if(d||!h.cyclePause){c.before.length&&a.each(c.before,function(a,b){b.apply(j,[i,j,c,g])});var k=function(){a.browser.msie&&c.cleartype&&this.style.removeAttribute("filter"),a.each(c.after,function(a,b){b.apply(j,[i,j,c,g])})};c.nextSlide!=c.currSlide&&(c.busy=1,c.fxFn?c.fxFn(i,j,c,k,g):a.isFunction(a.fn.cycle[c.fx])?a.fn.cycle[c.fx](i,j,c,k):a.fn.cycle.custom(i,j,c,k,d&&c.fastOnEvent));if(c.random)c.currSlide=c.nextSlide,++c.randomIndex==b.length&&(c.randomIndex=0),c.nextSlide=c.randomMap[c.randomIndex];else{var l=c.nextSlide+1==b.length;c.nextSlide=l?0:c.nextSlide+1,c.currSlide=l?b.length-1:c.nextSlide-1}c.pager&&a.fn.cycle.updateActivePagerLink(c.pager,c.currSlide)}c.timeout&&!c.continuous?h.cycleTimeout=setTimeout(function(){e(b,c,0,!c.rev)},f(i,j,c,g)):c.continuous&&h.cyclePause&&(h.cycleTimeout=setTimeout(function(){e(b,c,0,!c.rev)},10))}function f(a,b,c,d){if(c.timeoutFn){var e=c.timeoutFn(a,b,c,d);if(e!==!1)return e}return c.timeout}function g(a,b,c){var d=b.container,f=d.cycleTimeout;f&&(clearTimeout(f),d.cycleTimeout=0);if(b.random&&c<0)b.randomIndex--,--b.randomIndex==-2?b.randomIndex=a.length-2:b.randomIndex==-1&&(b.randomIndex=a.length-1),b.nextSlide=b.randomMap[b.randomIndex];else if(b.random)++b.randomIndex==a.length&&(b.randomIndex=0),b.nextSlide=b.randomMap[b.randomIndex];else{b.nextSlide=b.currSlide+c;if(b.nextSlide<0){if(b.nowrap)return!1;b.nextSlide=a.length-1}else if(b.nextSlide>=a.length){if(b.nowrap)return!1;b.nextSlide=0}}return b.prevNextClick&&typeof b.prevNextClick=="function"&&b.prevNextClick(c>0,b.nextSlide,a[b.nextSlide]),e(a,b,1,c>=0),!1}function h(b,c){var d=a(c.pager);a.each(b,function(e,f){a.fn.cycle.createPagerAnchor(e,f,d,b,c)}),a.fn.cycle.updateActivePagerLink(c.pager,c.startingSlide)}function i(b){function c(a){var a=parseInt(a).toString(16);return a.length<2?"0"+a:a}function d(b){for(;b&&b.nodeName.toLowerCase()!="html";b=b.parentNode){var d=a.css(b,"background-color");if(d.indexOf("rgb")>=0){var e=d.match(/\d+/g);return"#"+c(e[0])+c(e[1])+c(e[2])}if(d&&d!="transparent")return d}return"#ffffff"}b.each(function(){a(this).css("background-color",d(this))})}var b="2.32",c=a.browser.msie&&/MSIE 6.0/.test(navigator.userAgent);a.fn.cycle=function(b){if(this.length==0)return d("terminating; zero elements found by selector"+(a.isReady?"":" (DOM not ready)")),this;var f=arguments[1];return this.each(function(){if(b===undefined||b===null)b={};if(b.constructor==String)switch(b){case"stop":this.cycleTimeout&&clearTimeout(this.cycleTimeout),this.cycleTimeout=0,a(this).data("cycle.opts","");return;case"pause":this.cyclePause=1;return;case"resume":this.cyclePause=0;if(f===!0){b=a(this).data("cycle.opts");if(!b){d("options not found, can not resume");return}this.cycleTimeout&&(clearTimeout(this.cycleTimeout),this.cycleTimeout=0),e(b.elements,b,1,1)}return;default:b={fx:b}}else if(b.constructor==Number){var j=b;b=a(this).data("cycle.opts");if(!b){d("options not found, can not advance slide");return}if(j<0||j>=b.elements.length){d("invalid slide index: "+j);return}b.nextSlide=j,this.cycleTimeout&&(clearTimeout(this.cycleTimeout),this.cycleTimeout=0),e(b.elements,b,1,j>=b.currSlide);return}this.cycleTimeout&&clearTimeout(this.cycleTimeout),this.cycleTimeout=0,this.cyclePause=0;var k=a(this),l=b.slideExpr?a(b.slideExpr,this):k.children(),m=l.get();if(m.length<2){d("terminating; too few slides: "+m.length);return}var n=a.extend({},a.fn.cycle.defaults,b||{},a.metadata?k.metadata():a.meta?k.data():{});n.autostop&&(n.countdown=n.autostopCount||m.length),k.data("cycle.opts",n),n.container=this,n.elements=m,n.before=n.before?[n.before]:[],n.after=n.after?[n.after]:[],n.after.unshift(function(){n.busy=0}),n.continuous&&n.after.push(function(){e(m,n,0,!n.rev)}),c&&n.cleartype&&!n.cleartypeNoBg&&i(l);var o=this.className;n.width=parseInt((o.match(/w:(\d+)/)||[])[1])||n.width,n.height=parseInt((o.match(/h:(\d+)/)||[])[1])||n.height,n.timeout=parseInt((o.match(/t:(\d+)/)||[])[1])||n.timeout,k.css("position")=="static"&&k.css("position","relative"),n.width&&k.width(n.width),n.height&&n.height!="auto"&&k.height(n.height),n.startingSlide&&(n.startingSlide=parseInt(n.startingSlide));if(n.random){n.randomMap=[];for(var p=0;p<m.length;p++)n.randomMap.push(p);n.randomMap.sort(function(a,b){return Math.random()-.5}),n.randomIndex=0,n.startingSlide=n.randomMap[0]}else n.startingSlide>=m.length&&(n.startingSlide=0);var q=n.startingSlide||0;l.css({position:"absolute",top:0,left:0}).hide().each(function(b){var c=q?b>=q?m.length-(b-q):q-b:m.length-b;a(this).css("z-index",c)}),a(m[q]).css("opacity",1).show(),a.browser.msie&&m[q].style.removeAttribute("filter"),n.fit&&n.width&&l.width(n.width),n.fit&&n.height&&n.height!="auto"&&l.height(n.height);if(n.containerResize){var r=0,s=0;for(var p=0;p<m.length;p++){var t=a(m[p]),u=t.outerWidth(),v=t.outerHeight();r=u>r?u:r,s=v>s?v:s}k.css({width:r+"px",height:s+"px"})}n.pause&&k.hover(function(){this.cyclePause++},function(){this.cyclePause--});var w=a.fn.cycle.transitions[n.fx];a.isFunction(w)?w(k,l,n):n.fx!="custom"&&d("unknown transition: "+n.fx),l.each(function(){var b=a(this);this.cycleH=n.fit&&n.height?n.height:b.height(),this.cycleW=n.fit&&n.width?n.width:b.width()}),n.cssBefore=n.cssBefore||{},n.animIn=n.animIn||{},n.animOut=n.animOut||{},l.not(":eq("+q+")").css(n.cssBefore),n.cssFirst&&a(l[q]).css(n.cssFirst);if(n.timeout){n.timeout=parseInt(n.timeout),n.speed.constructor==String&&(n.speed=a.fx.speeds[n.speed]||parseInt(n.speed)),n.sync||(n.speed=n.speed/2);while(n.timeout-n.speed<250)n.timeout+=n.speed}n.easing&&(n.easeIn=n.easeOut=n.easing),n.speedIn||(n.speedIn=n.speed),n.speedOut||(n.speedOut=n.speed),n.slideCount=m.length,n.currSlide=q,n.random?(n.nextSlide=n.currSlide,++n.randomIndex==m.length&&(n.randomIndex=0),n.nextSlide=n.randomMap[n.randomIndex]):n.nextSlide=n.startingSlide>=m.length-1?0:n.startingSlide+1;var x=l[q];n.before.length&&n.before[0].apply(x,[x,x,n,!0]),n.after.length>1&&n.after[1].apply(x,[x,x,n,!0]),n.click&&!n.next&&(n.next=n.click),n.next&&a(n.next).bind("click",function(){return g(m,n,n.rev?-1:1)}),n.prev&&a(n.prev).bind("click",function(){return g(m,n,n.rev?1:-1)}),n.pager&&h(m,n),n.addSlide=function(b,d){var e=a(b),f=e[0];n.autostopCount||n.countdown++,m[d?"unshift":"push"](f),n.els&&n.els[d?"unshift":"push"](f),n.slideCount=m.length,e.css("position","absolute"),e[d?"prependTo":"appendTo"](k),d&&(n.currSlide++,n.nextSlide++),c&&n.cleartype&&!n.cleartypeNoBg&&i(e),n.fit&&n.width&&e.width(n.width),n.fit&&n.height&&n.height!="auto"&&l.height(n.height),f.cycleH=n.fit&&n.height?n.height:e.height(),f.cycleW=n.fit&&n.width?n.width:e.width(),e.css(n.cssBefore),n.pager&&a.fn.cycle.createPagerAnchor(m.length-1,f,a(n.pager),m,n),typeof n.onAddSlide=="function"&&n.onAddSlide(e)};if(n.timeout||n.continuous)this.cycleTimeout=setTimeout(function(){e(m,n,0,!n.rev)},n.continuous?10:n.timeout+(n.delay||0))})},a.fn.cycle.updateActivePagerLink=function(b,c){a(b).find("a").removeClass("activeSlide").filter("a:eq("+c+")").addClass("activeSlide")},a.fn.cycle.createPagerAnchor=function(b,c,d,f,g){var h=typeof g.pagerAnchorBuilder=="function"?g.pagerAnchorBuilder(b,c):'<a href="#">'+(b+1)+"</a>";if(!h)return;var i=a(h);i.parents("body").length==0&&i.appendTo(d),i.bind(g.pagerEvent,function(){g.nextSlide=b;var a=g.container,c=a.cycleTimeout;return c&&(clearTimeout(c),a.cycleTimeout=0),typeof g.pagerClick=="function"&&g.pagerClick(g.nextSlide,f[g.nextSlide]),e(f,g,1,g.currSlide<b),!1}),g.pauseOnPagerHover&&i.hover(function(){g.container.cyclePause++},function(){g.container.cyclePause--})},a.fn.cycle.custom=function(b,c,d,e,f){var g=a(b),h=a(c);h.css(d.cssBefore);var i=f?1:d.speedIn,j=f?1:d.speedOut,k=f?null:d.easeIn,l=f?null:d.easeOut,m=function(){h.animate(d.animIn,i,k,e)};g.animate(d.animOut,j,l,function(){d.cssAfter&&g.css(d.cssAfter),d.sync||m()}),d.sync&&m()},a.fn.cycle.transitions={fade:function(b,c,d){c.not(":eq("+d.startingSlide+")").css("opacity",0),d.before.push(function(){a(this).show()}),d.animIn={opacity:1},d.animOut={opacity:0},d.cssBefore={opacity:0},d.cssAfter={display:"none"},d.onAddSlide=function(a){a.hide()}}},a.fn.cycle.ver=function(){return b},a.fn.cycle.defaults={fx:"fade",timeout:4e3,timeoutFn:null,continuous:0,speed:1e3,speedIn:null,speedOut:null,next:null,prev:null,prevNextClick:null,pager:null,pagerClick:null,pagerEvent:"click",pagerAnchorBuilder:null,before:null,after:null,end:null,easing:null,easeIn:null,easeOut:null,shuffle:null,animIn:null,animOut:null,cssBefore:null,cssAfter:null,fxFn:null,height:"auto",startingSlide:0,sync:1,random:0,fit:0,containerResize:1,pause:0,pauseOnPagerHover:0,autostop:0,autostopCount:0,delay:0,slideExpr:null,cleartype:0,nowrap:0,fastOnEvent:0}})(jQuery),function(a){a.fn.cycle.transitions.scrollUp=function(b,c,d){b.css("overflow","hidden"),d.before.push(function(b,c,d){a(this).show(),d.cssBefore.top=c.offsetHeight,d.animOut.top=0-b.offsetHeight}),d.cssFirst={top:0},d.animIn={top:0},d.cssAfter={display:"none"}},a.fn.cycle.transitions.scrollDown=function(b,c,d){b.css("overflow","hidden"),d.before.push(function(b,c,d){a(this).show(),d.cssBefore.top=0-c.offsetHeight,d.animOut.top=b.offsetHeight}),d.cssFirst={top:0},d.animIn={top:0},d.cssAfter={display:"none"}},a.fn.cycle.transitions.scrollLeft=function(b,c,d){b.css("overflow","hidden"),d.before.push(function(b,c,d){a(this).show(),d.cssBefore.left=c.offsetWidth,d.animOut.left=0-b.offsetWidth}),d.cssFirst={left:0},d.animIn={left:0}},a.fn.cycle.transitions.scrollRight=function(b,c,d){b.css("overflow","hidden"),d.before.push(function(b,c,d){a(this).show(),d.cssBefore.left=0-c.offsetWidth,d.animOut.left=b.offsetWidth}),d.cssFirst={left:0},d.animIn={left:0}},a.fn.cycle.transitions.scrollHorz=function(b,c,d){b.css("overflow","hidden").width(),d.before.push(function(b,d,e,f){a(this).show();var g=b.offsetWidth,h=d.offsetWidth;e.cssBefore=f?{left:h}:{left:-h},e.animIn.left=0,e.animOut.left=f?-g:g,c.not(b).css(e.cssBefore)}),d.cssFirst={left:0},d.cssAfter={display:"none"}},a.fn.cycle.transitions.scrollVert=function(b,c,d){b.css("overflow","hidden"),d.before.push(function(b,d,e,f){a(this).show();var g=b.offsetHeight,h=d.offsetHeight;e.cssBefore=f?{top:-h}:{top:h},e.animIn.top=0,e.animOut.top=f?g:-g,c.not(b).css(e.cssBefore)}),d.cssFirst={top:0},d.cssAfter={display:"none"}},a.fn.cycle.transitions.slideX=function(b,c,d){d.before.push(function(b,c,d){a(b).css("zIndex",1)}),d.onAddSlide=function(a){a.hide()},d.cssBefore={zIndex:2},d.animIn={width:"show"},d.animOut={width:"hide"}},a.fn.cycle.transitions.slideY=function(b,c,d){d.before.push(function(b,c,d){a(b).css("zIndex",1)}),d.onAddSlide=function(a){a.hide()},d.cssBefore={zIndex:2},d.animIn={height:"show"},d.animOut={height:"hide"}},a.fn.cycle.transitions.shuffle=function(b,c,d){var e=b.css("overflow","visible").width();c.css({left:0,top:0}),d.before.push(function(){a(this).show()}),d.speed=d.speed/2,d.random=0,d.shuffle=d.shuffle||{left:-e,top:15},d.els=[];for(var f=0;f<c.length;f++)d.els.push(c[f]);for(var f=0;f<d.startingSlide;f++)d.els.push(d.els.shift());d.fxFn=function(b,c,d,e,f){var g=f?a(b):a(c);g.animate(d.shuffle,d.speedIn,d.easeIn,function(){f?d.els.push(d.els.shift()):d.els.unshift(d.els.pop());if(f)for(var c=0,h=d.els.length;c<h;c++)a(d.els[c]).css("z-index",h-c);else{var i=a(b).css("z-index");g.css("z-index",parseInt(i)+1)}g.animate({left:0,top:0},d.speedOut,d.easeOut,function(){a(f?this:b).hide(),e&&e()})})},d.onAddSlide=function(a){a.hide()}},a.fn.cycle.transitions.turnUp=function(b,c,d){d.before.push(function(b,c,d){a(this).show(),d.cssBefore.top=c.cycleH,d.animIn.height=c.cycleH}),d.onAddSlide=function(a){a.hide()},d.cssFirst={top:0},d.cssBefore={height:0},d.animIn={top:0},d.animOut={height:0},d.cssAfter={display:"none"}},a.fn.cycle.transitions.turnDown=function(b,c,d){d.before.push(function(b,c,d){a(this).show(),d.animIn.height=c.cycleH,d.animOut.top=b.cycleH}),d.onAddSlide=function(a){a.hide()},d.cssFirst={top:0},d.cssBefore={top:0,height:0},d.animOut={height:0},d.cssAfter={display:"none"}},a.fn.cycle.transitions.turnLeft=function(b,c,d){d.before.push(function(b,c,d){a(this).show(),d.cssBefore.left=c.cycleW,d.animIn.width=c.cycleW}),d.onAddSlide=function(a){a.hide()},d.cssBefore={width:0},d.animIn={left:0},d.animOut={width:0},d.cssAfter={display:"none"}},a.fn.cycle.transitions.turnRight=function(b,c,d){d.before.push(function(b,c,d){a(this).show(),d.animIn.width=c.cycleW,d.animOut.left=b.cycleW}),d.onAddSlide=function(a){a.hide()},d.cssBefore={left:0,width:0},d.animIn={left:0},d.animOut={width:0},d.cssAfter={display:"none"}},a.fn.cycle.transitions.zoom=function(b,c,d){d.cssFirst={top:0,left:0},d.cssAfter={display:"none"},d.before.push(function(b,c,d){a(this).show(),d.cssBefore={width:0,height:0,top:c.cycleH/2,left:c.cycleW/2},d.cssAfter={display:"none"},d.animIn={top:0,left:0,width:c.cycleW,height:c.cycleH},d.animOut={width:0,height:0,top:b.cycleH/2,left:b.cycleW/2},a(b).css("zIndex",2),a(c).css("zIndex",1)}),d.onAddSlide=function(a){a.hide()}},a.fn.cycle.transitions.fadeZoom=function(a,b,c){c.before.push(function(a,b,c){c.cssBefore={width:0,height:0,opacity:1,left:b.cycleW/2,top:b.cycleH/2,zIndex:1},c.animIn={top:0,left:0,width:b.cycleW,height:b.cycleH}}),c.animOut={opacity:0},c.cssAfter={zIndex:0}},a.fn.cycle.transitions.blindX=function(b,c,d){var e=b.css("overflow","hidden").width();c.show(),d.before.push(function(b,c,d){a(b).css("zIndex",1)}),d.cssBefore={left:e,zIndex:2},d.cssAfter={zIndex:1},d.animIn={left:0},d.animOut={left:e}},a.fn.cycle.transitions.blindY=function(b,c,d){var e=b.css("overflow","hidden").height();c.show(),d.before.push(function(b,c,d){a(b).css("zIndex",1)}),d.cssBefore={top:e,zIndex:2},d.cssAfter={zIndex:1},d.animIn={top:0},d.animOut={top:e}},a.fn.cycle.transitions.blindZ=function(b,c,d){var e=b.css("overflow","hidden").height(),f=b.width();c.show(),d.before.push(function(b,c,d){a(b).css("zIndex",1)}),d.cssBefore={top:e,left:f,zIndex:2},d.cssAfter={zIndex:1},d.animIn={top:0,left:0},d.animOut={top:e,left:f}},a.fn.cycle.transitions.growX=function(b,c,d){d.before.push(function(b,c,d){d.cssBefore={left:this.cycleW/2,width:0,zIndex:2},d.animIn={left:0,width:this.cycleW},d.animOut={left:0},a(b).css("zIndex",1)}),d.onAddSlide=function(a){a.hide().css("zIndex",1)}},a.fn.cycle.transitions.growY=function(b,c,d){d.before.push(function(b,c,d){d.cssBefore={top:this.cycleH/2,height:0,zIndex:2},d.animIn={top:0,height:this.cycleH},d.animOut={top:0},a(b).css("zIndex",1)}),d.onAddSlide=function(a){a.hide().css("zIndex",1)}},a.fn.cycle.transitions.curtainX=function(b,c,d){d.before.push(function(b,c,d){d.cssBefore={left:c.cycleW/2,width:0,zIndex:1,display:"block"},d.animIn={left:0,width:this.cycleW},d.animOut={left:b.cycleW/2,width:0},a(b).css("zIndex",2)}),d.onAddSlide=function(a){a.hide()},d.cssAfter={zIndex:1,display:"none"}},a.fn.cycle.transitions.curtainY=function(b,c,d){d.before.push(function(b,c,d){d.cssBefore={top:c.cycleH/2,height:0,zIndex:1,display:"block"},d.animIn={top:0,height:this.cycleH},d.animOut={top:b.cycleH/2,height:0},a(b).css("zIndex",2)}),d.onAddSlide=function(a){a.hide()},d.cssAfter={zIndex:1,display:"none"}},a.fn.cycle.transitions.cover=function(b,c,d){var e=d.direction||"left",f=b.css("overflow","hidden").width(),g=b.height();d.before.push(function(b,c,d){d.cssBefore=d.cssBefore||{},d.cssBefore.zIndex=2,d.cssBefore.display="block",e=="right"?d.cssBefore.left=-f:e=="up"?d.cssBefore.top=g:e=="down"?d.cssBefore.top=-g:d.cssBefore.left=f,a(b).css("zIndex",1)}),d.animIn||(d.animIn={left:0,top:0}),d.animOut||(d.animOut={left:0,top:0}),d.cssAfter=d.cssAfter||{},d.cssAfter.zIndex=2,d.cssAfter.display="none"},a.fn.cycle.transitions.uncover=function(b,c,d){var e=d.direction||"left",f=b.css("overflow","hidden").width(),g=b.height();d.before.push(function(b,c,d){d.cssBefore.display="block",e=="right"?d.animOut.left=f:e=="up"?d.animOut.top=-g:e=="down"?d.animOut.top=g:d.animOut.left=-f,a(b).css("zIndex",2),a(c).css("zIndex",1)}),d.onAddSlide=function(a){a.hide()},d.animIn||(d.animIn={left:0,top:0}),d.cssBefore=d.cssBefore||{},d.cssBefore.top=0,d.cssBefore.left=0,d.cssAfter=d.cssAfter||{},d.cssAfter.zIndex=1,d.cssAfter.display="none"},a.fn.cycle.transitions.toss=function(b,c,d){var e=b.css("overflow","visible").width(),f=b.height();d.before.push(function(b,c,d){a(b).css("zIndex",2),d.cssBefore.display="block",!d.animOut.left&&!d.animOut.top?d.animOut={left:e*2,top:-f/2,opacity:0}:d.animOut.opacity=0}),d.onAddSlide=function(a){a.hide()},d.cssBefore={left:0,top:0,zIndex:1,opacity:1},d.animIn={left:0},d.cssAfter={zIndex:2,display:"none"}},a.fn.cycle.transitions.wipe=function(b,c,d){var e=b.css("overflow","hidden").width(),f=b.height();d.cssBefore=d.cssBefore||{};var g;if(d.clip)if(/l2r/.test(d.clip))g="rect(0px 0px "+f+"px 0px)";else if(/r2l/.test(d.clip))g="rect(0px "+e+"px "+f+"px "+e+"px)";else if(/t2b/.test(d.clip))g="rect(0px "+e+"px 0px 0px)";else if(/b2t/.test(d.clip))g="rect("+f+"px "+e+"px "+f+"px 0px)";else if(/zoom/.test(d.clip)){var h=parseInt(f/2),i=parseInt(e/2);g="rect("+h+"px "+i+"px "+h+"px "+i+"px)"}d.cssBefore.clip=d.cssBefore.clip||g||"rect(0px 0px 0px 0px)";var j=d.cssBefore.clip.match(/(\d+)/g),h=parseInt(j[0]),k=parseInt(j[1]),l=parseInt(j[2]),i=parseInt(j[3]);d.before.push(function(b,c,d){function o(){var a=h?h-parseInt(m*(h/n)):0,b=i?i-parseInt(m*(i/n)):0,c=l<f?l+parseInt(m*((f-l)/n||1)):f,d=k<e?k+parseInt(m*((e-k)/n||1)):e;j.css({clip:"rect("+a+"px "+d+"px "+c+"px "+b+"px)"}),m++<=n?setTimeout(o,13):g.css("display","none")}if(b==c)return;var g=a(b).css("zIndex",2),j=a(c).css({zIndex:3,display:"block"}),m=1,n=parseInt(d.speedIn/13)-1;o()}),d.cssAfter={},d.animIn={left:0},d.animOut={left:0}}}(jQuery)