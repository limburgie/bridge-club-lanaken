<h4>Er is een foutje gebeurd!</h4>
<p>Deze pagina is niet beschikbaar. Probeer later opnieuw of ga naar een andere pagina:</p>

<ul>
<#list site.pages as page>
	<li><a href="/${page.friendlyUrl}">${page.name}</a></li>
</#list>
</ul>

<h4>Voor de webmaster</h4>
<p>Geef onderstaande fout door aan de webmaster. Hij kan dit probleem verder bekijken.</p>
<div class="card">
	<div class="card-body">
		<pre><code>${request.params[0]}</code></pre>
	</div>
</div>