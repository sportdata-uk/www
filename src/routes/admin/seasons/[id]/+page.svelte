<script lang="ts">
	import type { PageData, ActionData } from './$types';

	export let data: PageData;
	export let form: ActionData;
</script>

<h1>{ data.season ? 'Update' : 'Add' } Season</h1>

{#if form?.error}
	<p class="error">{ form.error }</p>
{/if}

<div class="row">
	<div class="col-8 offset-2">
		<form method="POST">
			<label for="name" data-field>Name *
				<input id="name" name="name" type="text" value={ data.season?.name || '' } required/>
			</label>

			<div data-field>
				<label for="organisation">Organisation *
					<select name="organisationID" aria-label="Select an option">
						<option value="">Select an Organisation...</option>

						{#each data.organisations as organisation}
							<option value={ organisation.id } selected={ data.season?.organisation_id === organisation.id }>
								{ organisation.name }
							</option>
						{/each}
					</select>
				</label>
			</div>

			<div data-field>
				<label for="startDate">Start date *
					<input id="startDate" name="startDate" type="date" value={ data.season?.start_date || '' } required/>
				</label>
			</div>

			<div data-field>
				<label for="endDate">End date *
					<input id="endDate" name="endDate" type="date" value={ data.season?.end_date || '' } required/>
				</label>
			</div>

			<button>{data.season ? 'Update' : 'Add'} Season</button>
			<a href="/admin/seasons/" class="button outline">cancel</a>
		</form>
	</div>
</div>
