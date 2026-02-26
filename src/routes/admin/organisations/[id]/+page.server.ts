import { fail, redirect } from '@sveltejs/kit'
import type { Actions, PageServerLoad } from './$types'

export const load: PageServerLoad = async ( { params, locals: { supabase } } ) => {
	const { data: sports, errorSports } = await supabase.from( 'sports' )
		.select( 'id, name' )
		.order( 'name' );

	if ( errorSports ) {
		console.error( 'Error loading Organisations:', errorSports );

		return { sports: [] };
	}

	if ( params.id != 'add' ) {
		const { data: organisation, error } = await supabase.from( 'organisations' )
			.select( 'id, name, sport_id' )
			.eq( 'id', params.id )
			.single();

		if ( error ) {
			console.error( 'Error loading organisation:', error );

			return {
				organisation: organisation || []
			};
		}

		return {
			organisation: organisation, sports: sports || []
		};
	}

	return {
		organisation: null, sports: sports || []
	};
}

export const actions: Actions = {
	default: async ( { request, params, locals: { supabase } } ) => {
		const formData = await request.formData();

		const name = formData.get( 'name' ) as string
		const sportID = formData.get( 'sportID' ) as string

		const { id } = params;

		const organisationData = {
			name: name as string,
			sport_id: sportID as string,
		};

		if ( id === 'add' ) {
			const { data, error } = await supabase.from( 'organisations' )
				.insert( organisationData )
				.select( 'id' )
				.single();

			if ( error ) {
				return fail( 500, {
					error: error.message
				} );
			}

			throw redirect( 303, '/admin/organisations/add' );
		} else {
			const { error } = await supabase.from( 'organisations' )
				.update( organisationData )
				.eq( 'id', id );

			if ( error ) {
				return fail( 500, {
					error: error.message
				} );
			}

			throw redirect( 303, '/admin/organisations' );
		}
	}
}
