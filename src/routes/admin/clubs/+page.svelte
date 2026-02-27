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

			location.href = '/admin/clubs';
		}
	}
</script>

<h1>Clubs</h1>

<a href="/admin/clubs/add/" class="button">Add Club</a>

<div class="row">
	<div class="col-8 offset-2">
		<div class="table">
			<table>
				<thead>
					<tr>
						<th>Club</th>
						<th>Season</th>
						<th>&nbsp;</th>
					</tr>
				</thead>

				<tbody>
					{#each data.clubs as club}
						<tr>
							<td>
								<a href="/admin/clubs/{ club.id }">{ club.name }</a>
							</td>
							<td>{ club.season.name }</td>
							<td class="align-right">
								<button onclick={ () => deleteRecord( club ) }>Delete</button>
							</td>
						</tr>
					{/each}
				</tbody>
			</table>
		</div>
	</div>
</div>
