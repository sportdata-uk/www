import { fail, redirect } from '@sveltejs/kit'
import type { Actions, PageServerLoad } from './$types'

export const load: PageServerLoad = async ( { locals: { supabase } } ) => {
	let now = new Date();

	const { data } = await supabase.from( 'seasons' )
		.select( 'id, name, start_date, end_date, organisation:organisations( id, name )' )
		.order( 'name', { ascending: true } );

	return { seasons: data ?? [] }
}

export const actions: Actions = {
	delete: async ( { request, locals: { supabase } } ) => {
		const formData = await request.formData();

		const id = formData.get( 'id' );

		const { error } = await supabase.from( 'seasons' )
			.delete()
			.eq( 'id', id );

		redirect( 303, '/admin/seasons' );
	}
}
