% rebase('layout.tpl', title='Home Page', year=year)

<div class="jumbotron">
	<h1>Update Beer</h1>
</dv>

<form name="frmUpdate" action="/update" method="post" id="frmUpdate">
	<table class="table">
		<tr>
			<td></td>
			<td><input name="txtID" type="hidden" class="form-control" id="txtID" value="{{beer['id']}}"></td>
		</tr>
		<tr>
			<td>Beer Name: </td>
			<td><input name="txtName" type="text" class="form-control" id="txtName" value="{{beer['name']}}"></td>
		</tr>
		<tr>
			<td>Actively Brewed: </td>
			<td>
				<select name="selActive" class="form-control" id="selActive" value="{{beer['activelyBrewed']}}">
					<option disabled>Select One</option>
					<option value="true">Yes</option>
					<option value="false">No</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>Flavours: </td>
			<td><input name="txtFlavors" type="text" class="form-control" id="txtFlavors" value="{{','.join(beer['flavors'])}}"></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<a class="btn btn-primary" href="/" role="button">Cancel</a>
				<button type="submit" class="btn btn-primary" id="btnSave">Save</button>
			</td>
		</tr>
	</table>
</form>