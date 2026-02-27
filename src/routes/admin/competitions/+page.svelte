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

			location.href = '/admin/competitions';
		}
	}
</script>

<h1>Competitions</h1>

<a href="/admin/competitions/add/" class="button">Add Competition</a>

<div class="row">
	<div class="col-8 offset-2">
		<div class="table">
			<table>
				<thead>
					<tr>
						<th>Competition</th>
						<th>Season</th>
						<th>&nbsp;</th>
					</tr>
				</thead>

				<tbody>
					{#each data.competitions as competition}
						<tr>
							<td>
								<a href="/admin/competitions/{ competition.id }">{ competition.name }</a>
							</td>
							<td>{ competition.season.name }</td>
							<td class="align-right">
								<button onclick={ () => deleteRecord( competition ) }>Delete</button>
							</td>
						</tr>
					{/each}
				</tbody>
			</table>
		</div>
	</div>
</div>
