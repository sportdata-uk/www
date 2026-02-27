import { fail, redirect } from '@sveltejs/kit'
import type { Actions, PageServerLoad } from './$types'

export const load: PageServerLoad = async ( { params, locals: { supabase } } ) => {
	const { data: organisations, errorOrganisations } = await supabase.from( 'organisations' )
		.select( 'id, name' )
		.order( 'name' );

	if ( errorOrganisations ) {
		console.error( 'Error loading seasons:', errorOrganisations );

		return { organisations: [] };
	}

	if ( params.id != 'add' ) {
		const { data: season, error } = await supabase.from( 'seasons' )
			.select( 'id, name, organisation_id' )
			.eq( 'id', params.id )
			.single();

		if ( error ) {
			console.error( 'Error loading season:', error );

			return {
				season: season || []
			};
		}

		return {
			season: season, organisations: organisations || []
		};
	}

	return {
		season: null, organisations: organisations || []
	};
}

export const actions: Actions = {
	default: async ( { request, params, locals: { supabase } } ) => {
		const formData = await request.formData();

		const name = formData.get( 'name' ) as string
		const organisationID = formData.get( 'organisationID' ) as string

		const { id } = params;

		const seasonData = {
			name: name as string,
			organisation_id: organisationID as string,
		};

		if ( id === 'add' ) {
			const { data, error } = await supabase.from( 'seasons' )
				.insert( seasonData )
				.select( 'id' )
				.single();

			if ( error ) {
				return fail( 500, {
					error: error.message
				} );
			}

			throw redirect( 303, '/admin/seasons/add' );
		} else {
			const { error } = await supabase.from( 'seasons' )
				.update( seasonData )
				.eq( 'id', id );

			if ( error ) {
				return fail( 500, {
					error: error.message
				} );
			}

			throw redirect( 303, '/admin/seasons' );
		}
	}
}
