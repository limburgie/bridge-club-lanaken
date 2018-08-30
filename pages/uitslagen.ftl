<#if request.params[0]??>
	<#assign thisUitslag = api.query("weekuitslag").with("datum", request.params[0]).findOne()!>
<#else>
	<#assign thisUitslag = api.query("weekuitslag").withDateInPast("datum").orderByDesc("datum").findOne()!>
</#if>

<#if thisUitslag?has_content>
	<h4>Clubavond ${thisUitslag.getDate("datum").format("dd/MM/yyyy")}</h4>

	<div class="row">
		<div class="col-lg-6">
			<@uitslag "Lijn A" "alijn"/>
		</div>
		<div class="col-lg-6">
			<@uitslag "Lijn B" "blijn"/>
		</div>
	</div>
</#if>

<h4>Archief</h4>

<#list api.query("weekuitslag").withDateInPast("datum").orderByDesc("datum").findAll(10)>
	<div class="list-group">
		<#items as uitslag>
			<a href="/uitslagen/${uitslag.getDate("datum").format("yyyy-MM-dd")}" class="list-group-item list-group-item-action">
				${uitslag.getDate("datum").format("EEEE d MMMM, yyyy").withLocale("nl_BE")?cap_first}
			</a>
		</#items>
	</div>
<#else>
	<p>Er zijn geen wedstrijden in het wedstrijdarchief</p>
</#list>


<#macro uitslag reeksNaam reeksId>
	<#assign teams = thisUitslag.getGroup(reeksId)>
	<#if teams[0]?? && teams[0].getText("speler1")?has_content && teams[0].getText("speler2")?has_content>
		<h5>${reeksNaam}</h5>

		<#list teams>
			<table class="table table-striped">
				<tbody>
						<#items as team>
						<tr>
							<td class="text-right pr-4" scope="row">
								<#if team_index == 0 || score(team) != score(teams[team_index-1])>
									${team_index + 1}.
								</#if>
							</td>
							<td class="d-none d-sm-table-cell"><#if team.getText("speler1")?has_content><nobr>${team.getText("speler1")}</nobr></#if></td>
							<td class="d-none d-sm-table-cell"><#if team.getText("speler2")?has_content><nobr>${team.getText("speler2")}</nobr></#if></td>
							<td class="d-table-cell d-sm-none">
								<#if team.getText("speler1")?has_content><div><nobr>${team.getText("speler1")}</nobr></div></#if>
								<#if team.getText("speler2")?has_content><div><nobr>${team.getText("speler2")}</nobr></div></#if>
							</td>
							<td class="text-right">${score(team)}%</td>
						</tr>
						</#items>
				</tbody>
			</table>
		<#else>
			<p>Er zijn nog geen resultaten bekend.</p>
		</#list>
	</#if>
</#macro>

<#function score team>
	<#return team.getNumber("percentage").format("0.00").withLocale("nl_BE")>
</#function>