rendering
renderDisqusOn: html
	html html: '<div id="disqus_thread"></div>
<script>

var disqus_config = function () {
this.page.url = "', self fullPagePermaLink, '"; 
this.page.identifier = "', self permaLink, '";
};

(function() {
var d = document, s = d.createElement(''script'');

s.src = ''//', WLServerConfiguration uniqueInstance disqusAccount, '.disqus.com/embed.js'';

s.setAttribute(''data-timestamp'', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">comments powered by Disqus.</a></noscript>'