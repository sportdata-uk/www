<script lang="ts">
	import type { PageData, ActionData } from './$types';

	export let data: PageData;
	export let form: ActionData;
</script>

<h1>{ data.sports ? 'Update' : 'Add' } Sport</h1>

{#if form?.error}
	<p class="error">{ form.error }</p>
{/if}

<div class="row">
	<div class="col-8 offset-2">
		<form action="?/update" method="POST">
			<label for="name" data-field>Name *
				<input id="name" name="name" type="text" value={ data.sports?.name || '' } required/>
			</label>

			<button>{ data.sports ? 'Update' : 'Add' } sport</button>
			<a href="/admin/sports/" class="button outline">cancel</a>
		</form>
	</div>
</div>
