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

			location.href = '/admin/teams';
		}
	}
</script>

<h1>Teams</h1>

<a href="/admin/teams/add/" class="button">Add Team</a>

<div class="row">
	<div class="col-8 offset-2">
		<div class="table">
			<table>
				<thead>
					<tr>
						<th>Team</th>
						<th>Club</th>
						<th>Competition</th>
						<th>&nbsp;</th>
					</tr>
				</thead>

				<tbody>
					{#each data.teams as team}
						<tr>
							<td>
								<a href="/admin/teams/{ team.id }">{ team.name }</a>
							</td>
							<td>{ team.club.name }</td>
							<td>{ team.competition.name }</td>
							<td class="align-right">
								<button onclick={ () => deleteRecord( team ) }>Delete</button>
							</td>
						</tr>
					{/each}
				</tbody>
			</table>
		</div>
	</div>
</div>
