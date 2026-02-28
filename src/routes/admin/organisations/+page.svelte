<script>
	import { enhance } from '$app/forms';

	let { data } = $props();

	async function deleteRecord( record ) {
		const isConfirmed = window.confirm( `Are you sure you want to delete "${record.name}?"` );

		if ( isConfirmed ) {
			const formData = new FormData();

			formData.append( 'id', record.id );

			const response = await fetch( '?/delete', {
				method: 'POST',
				body: formData,
			} );

			location.href = '/admin/organisations';
		}
	}
</script>

<div class="hstack gap-4">
	<div>
		<h1>Organisations</h1>
	</div>

	<div class="mb-4">
		<form action="?/selectedSport" method="POST" use:enhance>
			<select name="selectedSport" value={data.selectedSport} onchange={(e) => e.currentTarget.form.submit()}>
				<option value="all">Select a Sport</option>
				<option value="all">All Sports</option>
				{#each data.sports as sport}
					<option value="{ sport.id }">{ sport.name }</option>
				{/each}
			</select>
		</form>
	</div>
</div>

<a href="/admin/organisations/add/" class="button">Add Organisation</a>

<div class="row">
	<div class="col-8 offset-2">
		<div class="table">
			<table>
				<thead>
					<tr>
						<th>Organisation</th>
						<th>Sport</th>
						<th>&nbsp;</th>
					</tr>
				</thead>

				<tbody>
					{#each data.organisations as organisation}
						<tr>
							<td>
								<a href="/admin/organisations/{ organisation.id }">{ organisation.name }</a>
							</td>
							<td>{ organisation.sport.name }</td>
							<td class="align-right">
								<button onclick={ () => deleteRecord( organisation ) }>Delete</button>
							</td>
						</tr>
					{/each}
				</tbody>
			</table>
		</div>
	</div>
</div>
