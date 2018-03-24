<div class="jumbotron">
	<div class="jumbotron-bg" style="background-image: url('${api.query("banner").findFirst().getImage("achtergrond").url}')"></div>
	<h1 class="my-2 my-sm-5">Uw brug naar bridgen en samenzijn</h1>
	<p class="lead d-none d-sm-block">
		Bridge Club Lanaken is een groeiende club, dicht bij u in de buurt. Een club waarin iedereen op zijn niveau leert.
		Er is een divers publiek en een hartelijk ontvangst in het Cultureel Centrum Lanaken.
	</p>
	<p class="lead d-none d-sm-block">
		En natuurlijk mag de goed verzorgde après-bridge niet ontbreken!
	</p>
	<p class="d-none d-sm-block"><a class="btn btn-lg btn-success" href="/lidgeld" role="button">Word ook lid!</a></p>
</div>

<div class="row marketing">
	<div class="col-lg-6">
	<#assign voorbijeWedstrijd = api.query("weekuitslag").withDateInPast("datum", true).orderByDesc("datum").findFirst()!>
	<#if voorbijeWedstrijd?has_content>
		<h4>Clubavond ${voorbijeWedstrijd.getDate("datum").format("dd/MM/yyyy")}</h4>

		<#assign teams = voorbijeWedstrijd.getGroup("alijn")>

		<#if teams[0]?? && teams[0].getText("speler1")?has_content && teams[0].getText("speler2")?has_content>
			<#list teams[0..*3]>
				<table class="table table-striped">
					<tbody>
						<#items as team>
							<tr>
								<td scope="row">${team_index + 1}.</td>
								<td class="d-none d-sm-table-cell"><#if team.getText("speler1")?has_content><nobr>${team.getText("speler1")}</nobr></#if></td>
								<td class="d-none d-sm-table-cell"><#if team.getText("speler2")?has_content><nobr>${team.getText("speler2")}</nobr></#if></td>
								<td class="d-table-cell d-sm-none">
								<#if team.getText("speler1")??><div><nobr>${team.getText("speler1")}</nobr></div></#if>
								<#if team.getText("speler2")??><div><nobr>${team.getText("speler2")}</nobr></div></#if>
								<td>${team.getNumber("percentage").format("0.00", "nl_BE")}%</td>
							</tr>
						</#items>
					</tbody>
				</table>
				<#else>
				<p>Er zijn nog geen uitslagen bekend van deze clubavond.</p>
			</#list>
		<#else>
			<p>Er zijn nog geen uitslagen bekend van deze clubavond.</p>
		</#if>

		<p><a href="/uitslagen" class="btn btn-warning">Volledige wedstrijduitslag</a></p>
	<#else>
		<h4>Voorbije clubavond</h4>

		<p>Er zijn nog geen clubavonden doorgegaan.</p>
	</#if>
</div>

<div class="col-lg-5 offset-lg-1">
	<h4>Komende clubavonden</h4>
	<#assign wedstrijden = api.query("weekuitslag").withDateInFuture("datum", true).orderByAsc("datum").findAll()>
	<#list wedstrijden[0..*3]>
		<ul class="list-group">
			<#items as wedstrijd>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					${wedstrijd.getDate("datum").format("EEE d MMMM, yyyy", "nl_BE")?cap_first}
					<#if !wedstrijd.getWebLink("doodle_link").empty>
						<a href="${wedstrijd.getWebLink("doodle_link").url}" class="badge badge-primary">Doodle</a>
					</#if>
				</li>
			</#items>
		</ul>
		<#else>
			<p>Er zijn voorlopig geen geplande clubavonden.</p>
	</#list>

	<h4>Komende activiteiten</h4>
	<#assign activiteiten = api.query("activiteit").withDateInFuture("datum", true).orderByAsc("datum").findAll()>
		<#list activiteiten[0..*3]>
			<div class="list-group mb-3">
				<#items as activiteit>
					<a href="/activiteiten" class="list-group-item list-group-item-action flex-column align-items-start">
						<h5 class="mt-0 mb-2">${activiteit.getText("titel")}</h5>
						<small class="text-muted">${activiteit.getDate("datum").format("dd/MM/yyy 'om' HH'u'mm")}</small>
						<div class="mb-1">${activiteit.getRichText("beschrijving").abbreviate(100)}</div>
					</a>
				</#items>
			</div>
			<#else>
				<p>Er zijn voorlopig geen geplande activiteiten.</p>
		</#list>
	</div>
</div>