<script lang="ts">
	import type { LayoutProps } from './$types';

	let { data, children }: LayoutProps = $props();

	let sections = [
		{ slug: 'sports', title: 'Sports' },
		{ slug: 'organisations', title: 'Organisations' },
		{ slug: 'seasons', title: 'Seasons' },
		{ slug: 'competitions', title: 'Competitions' },
		{ slug: 'clubs', title: 'Clubs' },
		{ slug: 'teams', title: 'Teams' },
	]
</script>

<nav data-topnav>
	<button data-sidebar-toggle aria-label="Toggle menu" class="outline">☰</button>
	<span>Sport Data</span>
</nav>

<aside data-sidebar>
	<header>
		<h1>Sport Data</h1>
	</header>

	<nav>
		{#each sections as section}
			<a href="/admin/{section.slug}">{section.title}</a>
		{/each}
	</nav>

	<!-- <footer>Sign out</footer> -->
</aside>

<main>
	{@render children()}
</main>
