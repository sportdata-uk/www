<script lang="ts">
	import type { PageData, ActionData } from './$types';

	export let data: PageData;
	export let form: ActionData;
</script>

<h1>{ data.sports ? 'Update' : 'Add' } Sport</h1>

{#if form?.error}
	<p class="error">{ form.error }</p>
{/if}

<form action="?/update" method="POST">
	<label for="name">Name</label>
	<input id="name" name="name" type="text" value={ data.sports?.name || '' } >

	<br>
	<button>{data.sports ? 'Update' : 'Add'} sport</button>
	<a href="/admin/sports/">cancel</a>
</form>
