import { fail, redirect } from '@sveltejs/kit'
import type { Actions, PageServerLoad } from './$types'

export const load: PageServerLoad = async ( { params, locals: { supabase } } ) => {
	const { data: seasons, errorSeasons } = await supabase.from( 'seasons' )
		.select( 'id, name' )
		.order( 'name' );

	if ( errorSeasons ) {
		console.error( 'Error loading clubs:', errorSeasons );

		return { seasons: [] };
	}

	if ( params.id != 'add' ) {
		const { data: club, error } = await supabase.from( 'clubs' )
			.select( 'id, name, season_id' )
			.eq( 'id', params.id )
			.single();

		if ( error ) {
			console.error( 'Error loading club:', error );

			return {
				club: club || []
			};
		}

		return {
			club: club, seasons: seasons || []
		};
	}

	return {
		club: null, seasons: seasons || []
	};
}

export const actions: Actions = {
	default: async ( { request, params, locals: { supabase } } ) => {
		const formData = await request.formData();

		const name = formData.get( 'name' ) as string
		const seasonID = formData.get( 'seasonID' ) as string

		const { id } = params;

		const clubData = {
			name: name as string,
			season_id: seasonID as string,
		};

		if ( id === 'add' ) {
			const { data, error } = await supabase.from( 'clubs' )
				.insert( clubData )
				.select( 'id' )
				.single();

			if ( error ) {
				return fail( 500, {
					error: error.message
				} );
			}

			throw redirect( 303, '/admin/clubs/add' );
		} else {
			const { error } = await supabase.from( 'clubs' )
				.update( clubData )
				.eq( 'id', id );

			if ( error ) {
				return fail( 500, {
					error: error.message
				} );
			}

			throw redirect( 303, '/admin/clubs' );
		}
	}
}
