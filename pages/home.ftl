<#assign banner = api.query("banner").findOne()>

<div class="jumbotron">
	<div class="jumbotron-bg" style="background-image: url('${banner.getImage("achtergrond").url}')"></div>
	<h1 class="my-2 my-sm-5">${banner.getText("titel")}</h1>
    <#list banner.getGroup("beschrijving") as item>
		<p class="lead d-none d-sm-block">
            ${item.getText("alinea")}
		</p>
    </#list>
    <#if banner.getText("button_label")?has_content>
		<p class="d-none d-sm-block">
			<a class="btn btn-lg btn-success" href="${banner.getText("button_url")}" role="button">
                ${banner.getText("button_label")}
			</a>
		</p>
    </#if>
</div>

<div class="row marketing">
	<div class="col-lg-6">
        <#assign voorbijeWedstrijd = api.query("weekuitslag").withDateInPast("datum").orderByDesc("datum").findOne()!>
        <#if voorbijeWedstrijd?has_content>
			<h4>Clubavond ${voorbijeWedstrijd.getDate("datum").format("dd/MM/yyyy")}</h4>

            <#assign pdf = voorbijeWedstrijd.getAsset("pdf")!>

			<#if pdf?has_content>
				<iframe class="pdf" src="https://docs.google.com/viewer?url=${pdf.url}&embedded=true"></iframe>

				<p class="btn-bar">
					<a href="${pdf.url}" class="btn btn-primary" target="_blank">Uitslag downloaden</a>
					<a href="/uitslagen" class="btn btn-warning">Overige uitslagen bekijken</a>
				</p>
			<#else>
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
									<td>${team.getNumber("percentage").format("0.00").withLocale("nl_BE")}%</td>
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
			</#if>
        <#else>
			<h4>Voorbije clubavond</h4>

			<p>Er zijn nog geen clubavonden doorgegaan.</p>
        </#if>
	</div>

	<div class="col-lg-5 offset-lg-1">
		<h4>Komende clubavonden</h4>
        ${api.query("planning").findOne().getRichText("inhoud").html}

		<h4>Komende activiteiten</h4>
        <#assign activiteiten = api.query("activiteit").withDateInFuture("datum").orderByAsc("datum").findAll()>
        <#list activiteiten[0..*3]>
			<div class="list-group mb-3">
                <#items as activiteit>
					<a href="/activiteiten" class="list-group-item list-group-item-action flex-column align-items-start">
						<h5 class="mt-0 mb-2">${activiteit.getText("titel")}</h5>
						<small class="text-muted">${activiteit.getDate("datum").format("dd/MM/yyy 'om' HH'u'mm").withTimeZone("Europe/Brussels")}</small>
						<div class="mb-1">${activiteit.getRichText("beschrijving").abbreviate(100)}</div>
					</a>
                </#items>
			</div>
        <#else>
			<p>Er zijn voorlopig geen geplande activiteiten.</p>
        </#list>
	</div>
</div>