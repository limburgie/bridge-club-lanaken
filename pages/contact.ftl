<div class="row marketing">
	<div class="col-lg-5">
		<#assign contact = api.query("contactinformatie").findOne()>

		<h4>${contact.getText("titel")}</h4>
		${contact.getRichText("informatie").html}
	</div>

	<div class="col-lg-6 offset-lg-1">
		<#assign bestuur = api.query("bestuur").findOne()>

		<h4>Het bestuur</h4>
		<#list bestuur.getGroup("bestuursleden")>
		<table class="table table-striped d-none d-sm-table">
			<tbody>
				<#items as bestuurslid>
				<tr>
					<th scope="row">${bestuurslid.getText("functie")}</th>
					<td>
						<div>${bestuurslid.getText("naam")}</div>
						<div><@mail bestuurslid/></div>
						<div><@tel bestuurslid/></div>
					</td>
				</tr>
				</#items>
			</tbody>
		</table>
		</#list>

		<#list bestuur.getGroup("bestuursleden")>
		<table class="table table-striped d-table d-sm-none">
			<tbody>
				<#items as bestuurslid>
				<tr>
					<td>
						<div><b>${bestuurslid.getText("functie")}</b></div>
						<div>${bestuurslid.getText("naam")}</div>
						<div><@mail bestuurslid/></div>
						<div><@tel bestuurslid/></div>
					</td>
				</tr>
				</#items>
			</tbody>
		</table>
		</#list>
	</div>
</div>

<#macro mail bestuurslid>
	<#if bestuurslid.getText("emailadres")??>
		<a href="mailto:${bestuurslid.getText("emailadres")}">
			${bestuurslid.getText("emailadres")}
		</a>
	</#if>
</#macro>

<#macro tel bestuurslid>
	<#if bestuurslid.getText("telefoonnummer")??>
		<a href="tel:${bestuurslid.getText("telefoonnummer")}">
			<nobr>${bestuurslid.getText("telefoonnummer")}</nobr>
		</a>
	</#if>
</#macro>