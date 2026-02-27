<script lang="ts">
	import type { PageData, ActionData } from './$types';

	export let data: PageData;
	export let form: ActionData;
</script>

<h1>{ data.club ? 'Update' : 'Add' } Club</h1>

{#if form?.error}
	<p class="error">{ form.error }</p>
{/if}

<div class="row">
	<div class="col-8 offset-2">
		<form method="POST">
			<label for="name" data-field>Name *
				<input id="name" name="name" type="text" value={ data.club?.name || '' } required/>
			</label>

			<div data-field>
				<label for="season">Season *
					<select name="seasonID" aria-label="Select an option">
						<option value="">Select a Season...</option>

						{#each data.seasons as season}
							<option value={ season.id } selected={ data.club?.season_id === season.id }>
								{ season.name }
							</option>
						{/each}
					</select>
				</label>
			</div>

			<button>{data.club ? 'Update' : 'Add'} Club</button>
			<a href="/admin/clubs/" class="button outline">cancel</a>
		</form>
	</div>
</div>
