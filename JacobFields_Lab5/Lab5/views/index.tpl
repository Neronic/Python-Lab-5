% rebase('layout.tpl', title='Home Page', year=year)
% from operator import itemgetter
<div class="jumbotron">
    <h1>My Beer List</h1>
</div>

<div>
	<table class="table">
	<tr>
		<th><a href="/breweryName">Brewer</a></th>
		<th><a href="/name">Beer</a></th>
		<th><a href="/activelyBrewed">Is Active?</a></th>
		<th>Flavour Notes</th>
		<th></th>
	</tr>

	% for b in beer_list:

		<tr>
			<td>{{b["breweryName"]}}</td>
			<td>{{b["name"]}}</td>
			<td>{{b["activelyBrewed"]}}</td>
			<td>
				<ul>
					% for flavor in sorted(b["flavors"]):
						<li>{{flavor}}</li>
					%end
				<ul>
			</td>
			<td>
				<a class="btn btn-primary btn-sm" href="/update/{{b['id']}}" role="button">Edit</a>
			</td>
		</tr>
	%end
	</table>
</div>