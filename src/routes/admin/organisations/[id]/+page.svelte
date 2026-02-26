<script lang="ts">
	import type { PageData, ActionData } from './$types';

	export let data: PageData;
	export let form: ActionData;
</script>

<h1>{ data.organisation ? 'Update' : 'Add' } Organisation</h1>

{#if form?.error}
	<p class="error">{ form.error }</p>
{/if}

<div class="row">
	<div class="col-8 offset-2">
		<form method="POST">
			<label for="name" data-field>Name *
				<input id="name" name="name" type="text" value={ data.organisation?.name || '' } required/>
			</label>

			<div data-field>
				<label for="sport">Sport *
					<select name="sportID" aria-label="Select an option">
						<option value="">Select a Sport...</option>

						{#each data.sports as sport}
							<option value={ sport.id } selected={ data.organisation?.sport_id === sport.id }>
								{ sport.name }
							</option>
						{/each}
					</select>
				</label>
			</div>

			<button>{data.organisation ? 'Update' : 'Add'} Organisation</button>
			<a href="/admin/organisations/" class="button outline">cancel</a>
		</form>
	</div>
</div>
