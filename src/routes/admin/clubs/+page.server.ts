import { fail, redirect } from '@sveltejs/kit'
import type { Actions, PageServerLoad } from './$types'

export const load: PageServerLoad = async ( { locals: { supabase } } ) => {
	let now = new Date();

	const { data } = await supabase.from( 'clubs' )
		.select( 'id, name, season:seasons( name )' )
		.order( 'name', { ascending: true } );

	return { clubs: data ?? [] }
}

export const actions: Actions = {
	delete: async ( { request, locals: { supabase } } ) => {
		const formData = await request.formData();

		const id = formData.get( 'id' );

		const { error } = await supabase.from( 'clubs' )
			.delete()
			.eq( 'id', id );

		redirect( 303, '/admin/clubs' );
	}
}
