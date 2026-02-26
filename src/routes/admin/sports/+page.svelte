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

			location.href = '/admin/sports';
		}
	}
</script>

<h1>Sports</h1>

<a href="/admin/sports/add/" class="button">Add Sport</a>

<div class="row">
	<div class="col-8 offset-2">
		<div class="table">
			<table>
				<thead>
					<tr>
						<th>Name</th>
						<th>&nbsp;</th>
					</tr>
				</thead>

				<tbody>
					{#each data.sports as sport}
						<tr>
							<td>
								<a href="/admin/sports/{ sport.id }">{ sport.name }</a>
							</td>
							<td class="align-right">
								<button onclick={ () => deleteRecord( sport ) }>Delete</button>
							</td>
						</tr>
					{/each}
				</tbody>
			</table>
		</div>
	</div>
</div>
