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

			location.href = '/admin/seasons';
		}
	}
</script>

<h1>Seasons</h1>

<a href="/admin/seasons/add/" class="button">Add Season</a>

<div class="row">
	<div class="col-8 offset-2">
		<div class="table">
			<table>
				<thead>
					<tr>
						<th>Season</th>
						<th>Organisation</th>
						<th>&nbsp;</th>
					</tr>
				</thead>

				<tbody>
					{#each data.seasons as season}
						<tr>
							<td>
								<a href="/admin/seasons/{ season.id }">{ season.name }</a>
							</td>
							<td>{ season.organisation.name }</td>
							<td class="align-right">
								<button onclick={ () => deleteRecord( season ) }>Delete</button>
							</td>
						</tr>
					{/each}
				</tbody>
			</table>
		</div>
	</div>
</div>
