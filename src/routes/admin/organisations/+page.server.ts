import { fail, redirect } from '@sveltejs/kit'
import type { Actions, PageServerLoad } from './$types'

export const load: PageServerLoad = async ( { cookies, locals: { supabase } } ) => {
	const sportID = cookies.get( 'selectedSport' );

	let organisationQuery = supabase.from( 'organisations' )
		.select( 'id, name, sport:sports( name )' )
		.order( 'name', { ascending: true } );

	if ( sportID != 'all' ) {
		organisationQuery = organisationQuery.eq( 'sport_id', sportID )
	}

	const { data: organisations } = await organisationQuery;

	const { data: sports } = await supabase.from( 'sports' )
		.select( 'id, name' )
		.order( 'name', { ascending: true } );

	return { organisations: organisations ?? [], sports: sports ?? [], selectedSport: sportID ?? '' }
}

export const actions: Actions = {
	selectedSport: async ( { request, cookies } ) => {
		const formData = await request.formData();

		const selectedSport = formData.get( 'selectedSport' );

		cookies.set( 'selectedSport', selectedSport,
			{
				path: '/',
				httpOnly: true,
				secure: true,
				sameSite: 'strict',
				maxAge: 60 * 60 * 24 * 365
			}
		);

		return { success: true };
	},
	delete: async ( { request, locals: { supabase } } ) => {
		const formData = await request.formData();

		const id = formData.get( 'id' );

		const { error } = await supabase.from( 'organisations' )
			.delete()
			.eq( 'id', id );

		redirect( 303, '/admin/organisations' );
	}
}
