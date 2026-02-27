import { fail, redirect } from '@sveltejs/kit'
import type { Actions, PageServerLoad } from './$types'

export const load: PageServerLoad = async ( { params, locals: { supabase } } ) => {
	const { data: seasons, errorSeasons } = await supabase.from( 'seasons' )
		.select( 'id, name, organisation:organisations( name )' )
		.order( 'name' );

	if ( errorSeasons ) {
		console.error( 'Error loading competitions:', errorSeasons );

		return { seasons: [] };
	}

	if ( params.id != 'add' ) {
		const { data: competition, error } = await supabase.from( 'competitions' )
			.select( 'id, name, season_id' )
			.eq( 'id', params.id )
			.single();

		if ( error ) {
			console.error( 'Error loading competition:', error );

			return {
				competition: competition || []
			};
		}

		return {
			competition: competition, seasons: seasons || []
		};
	}

	return {
		competition: null, seasons: seasons || []
	};
}

export const actions: Actions = {
	default: async ( { request, params, locals: { supabase } } ) => {
		const formData = await request.formData();

		const name = formData.get( 'name' ) as string
		const seasonID = formData.get( 'seasonID' ) as string

		const { id } = params;

		const competitionData = {
			name: name as string,
			season_id: seasonID as string,
		};

		if ( id === 'add' ) {
			const { data, error } = await supabase.from( 'competitions' )
				.insert( competitionData )
				.select( 'id' )
				.single();

			if ( error ) {
				return fail( 500, {
					error: error.message
				} );
			}

			throw redirect( 303, '/admin/competitions/add' );
		} else {
			const { error } = await supabase.from( 'competitions' )
				.update( competitionData )
				.eq( 'id', id );

			if ( error ) {
				return fail( 500, {
					error: error.message
				} );
			}

			throw redirect( 303, '/admin/competitions' );
		}
	}
}
