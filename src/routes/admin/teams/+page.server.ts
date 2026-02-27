import { fail, redirect } from '@sveltejs/kit'
import type { Actions, PageServerLoad } from './$types'

export const load: PageServerLoad = async ( { locals: { supabase } } ) => {
	let now = new Date();

	const { data } = await supabase.from( 'teams' )
		.select( 'id, name, club:clubs( name ), competition:competitions( name )' )
		.order( 'name', { ascending: true } )
		// .order( 'club.name', { ascending: true } )
		// .order( 'competitions.name', { ascending: true } );

	return { teams: data ?? [] }
}

export const actions: Actions = {
	delete: async ( { request, locals: { supabase } } ) => {
		const formData = await request.formData();

		const id = formData.get( 'id' );

		const { error } = await supabase.from( 'teams' )
			.delete()
			.eq( 'id', id );

		redirect( 303, '/admin/teams' );
	}
}
