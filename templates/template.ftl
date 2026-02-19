<!DOCTYPE html>
<html lang="nl">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Bridge Club Lanaken">
	<meta name="author" content="Web Factor">

	<link rel="icon" type="image/png" href="/assets/img/favicon/favicon-96x96.png" sizes="96x96" />
	<link rel="icon" type="image/svg+xml" href="/favicon.svg" />
	<link rel="shortcut icon" href="/favicon.ico" />
	<link rel="apple-touch-icon" sizes="180x180" href="/assets/img/favicon/apple-touch-icon.png" />
	<meta name="apple-mobile-web-app-title" content="Bridge Club Lanaken" />
	<link rel="manifest" href="/assets/img/favicon/site.webmanifest" />

	<title>${site.name}</title>

	<link href="//fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	<link href="/assets/css/style.css" rel="stylesheet">
</head>

<body>

<div class="container">
	<header>
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="navbar-brand mb-0 h1" href="/">
				<img src="/assets/img/favicon.png" width="32" height="32" class="align-top d-none d-sm-inline-block" alt=""> ${site.name}
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav ml-auto">
					<#list site.pages as page>
						<div class="nav-item <#if page == request.page || page.children?seq_contains(request.page)>active</#if> <#if page.children?has_content>dropdown</#if>">
							<a class="nav-link <#if page.children?has_content>dropdown-toggle</#if>" <#if page.children?has_content>id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"</#if> href="/${page.friendlyUrl}">${page.name}</a>

							<#if page.children?has_content>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<#list page.children as child>
									<a class="dropdown-item" href="/${child.friendlyUrl}">${child.name}</a>
								</#list>
							</div>
							</#if>
						</div>
					</#list>
				</div>
			</div>
		</nav>
	</header>

	<main role="main">
		${inserts.body}
	</main>

	<footer class="footer">
		<p>&copy; ${.now?string('yyyy')} Web Factor</p>
	</footer>
</div>
<script src="//code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
</body>
</html>