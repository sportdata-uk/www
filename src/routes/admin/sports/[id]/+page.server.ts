import { fail, redirect } from '@sveltejs/kit'
import type { Actions, PageServerLoad } from './$types'
import type { Team, sport } from '$lib/types';

export const load: PageServerLoad = async ( { params, locals: { supabase } } ) => {
	const { data, error } = await supabase.from( 'sports' )
		.select( 'id, name' )
		.order( 'name' );

	if ( error ) {
		console.error( 'Error loading teams:', teamsError );

		return { sports: [] as Sport[] };
	}

	if ( params.id != 'add' ) {
		const { data, error } = await supabase.from( 'sports' )
			.select( 'id, name' )
			.eq( 'id', params.id )
			.single();

		if ( error ) {
			console.error( 'Error loading sport:', error );

			return {
				sports: data || []
			};
		}

		return {
			sports: data || []
		};
	}

	return {
		sports: data || []
	};
}

export const actions: Actions = {
	update: async ( { request, params, locals: { supabase } } ) => {
		const formData = await request.formData();

		const name = formData.get( 'name' ) as string

		const { id } = params;

		const sportData = {
			name: name as string,
		};

		if ( id === 'add' ) {
			const { data, error } = await supabase.from( 'sports' )
				.insert( sportData )
				.select( 'id' )
				.single();

			if ( error ) {
				return fail( 500, {
					error: error.message
				} );
			}

			throw redirect( 303, '/admin/sports/add' );
		} else {
			const { error } = await supabase.from( 'sports' )
				.update( sportData )
				.eq( 'id', id );

			if ( error ) {
				return fail( 500, {
					error: error.message
				} );
			}

			throw redirect( 303, '/admin/sports' );
		}
	}
}
