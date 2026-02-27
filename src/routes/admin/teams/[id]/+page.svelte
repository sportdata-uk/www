<script lang="ts">
	import type { PageData, ActionData } from './$types';

	export let data: PageData;
	export let form: ActionData;
</script>

<h1>{ data.team ? 'Update' : 'Add' } Team</h1>

{#if form?.error}
	<p class="error">{ form.error }</p>
{/if}

<div class="row">
	<div class="col-8 offset-2">
		<form method="POST">
			<label for="name" data-field>Name *
				<input id="name" name="name" type="text" value={ data.team?.name || '' } required/>
			</label>

			<div data-field>
				<label for="club">Club *
					<select name="clubID" aria-label="Select an option">
						<option value="">Select a Club...</option>

						{#each data.clubs as club}
							<option value={ club.id } selected={ data.team?.club_id === club.id }>
								{ club.name }
							</option>
						{/each}
					</select>
				</label>
			</div>

			<div data-field>
				<label for="competition">Competition *
					<select name="competitionID" aria-label="Select an option">
						<option value="">Select a Competition...</option>

						{#each data.competitions as competition}
							<option value={ competition.id } selected={ data.team?.competition_id === competition.id }>
								{ competition.name }
							</option>
						{/each}
					</select>
				</label>
			</div>

			<button>{data.team ? 'Update' : 'Add'} Team</button>
			<a href="/admin/teams/" class="button outline">cancel</a>
		</form>
	</div>
</div>
