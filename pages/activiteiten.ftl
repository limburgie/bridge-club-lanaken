<h4>Aankomende activiteiten</h4>

<#assign activiteiten = api.query("activiteit").withDateInFuture("datum", true).orderByAsc("datum").findAll()>
<@listActiviteiten activiteiten=activiteiten class="col-md-6"/>

<h4>Afgelopen activiteiten</h4>

<#assign activiteiten = api.query("activiteit").withDateInPast("datum", true).orderByDesc("datum").findAll()>
<@listActiviteiten activiteiten=activiteiten class="col-md-6 col-lg-4"/>


<#macro listActiviteiten activiteiten class>
	<#list activiteiten>
	<div class="row">
		<#items as activiteit>
			<div class="${class} mb-5">
				<div class="card">
					<#if activiteit.getImage("banner").url??>
						<img class="card-img-top" src="${activiteit.getImage("banner").url}" alt="${activiteit.getText("titel")}">
					</#if>
					<div class="card-footer">
						<small class="text-muted">${activiteit.getDate("datum").format("EEEE d MMMM 'om' HH'u'mm")?cap_first}</small>
					</div>
					<div class="card-body">
						<h4 class="card-title mt-0">${activiteit.getText("titel")}</h4>
						<div class="card-text">${activiteit.getRichText("beschrijving").html}</div>
					</div>
				</div>
			</div>
		</#items>
	</div>
	<#else>
	<p>Er zijn geen activiteiten gevonden.</p>
	</#list>
</#macro>