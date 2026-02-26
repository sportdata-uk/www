<script>
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

<h1>Organisations</h1>

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
