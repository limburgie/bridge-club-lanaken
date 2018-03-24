<div class="jumbotron">
	<div class="jumbotron-bg" style="background-image: url('${api.query("banner").findFirst().getImage("achtergrond").url}')"></div>
	<h1 class="my-2 my-sm-5">${request.page.name}</h1>
</div>

${inserts.content}