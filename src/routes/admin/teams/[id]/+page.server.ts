import { fail, redirect } from '@sveltejs/kit'
import type { Actions, PageServerLoad } from './$types'

export const load: PageServerLoad = async ( { params, locals: { supabase } } ) => {
	const { data: clubs, errorClubs } = await supabase.from( 'clubs' )
		.select( 'id, name' )
		.order( 'name' );

	if ( errorClubs ) {
		console.error( 'Error loading teams:', errorClubs );

		return { clubs: [] };
	}

	const { data: competitions, errorCompetitions } = await supabase.from( 'competitions' )
		.select( 'id, name' )
		.order( 'name' );

	if ( errorCompetitions ) {
		console.error( 'Error loading teams:', errorCompetitions );

		return { competitions: [] };
	}

	if ( params.id != 'add' ) {
		const { data: team, error } = await supabase.from( 'teams' )
			.select( 'id, name, club_id, competition_id' )
			.eq( 'id', params.id )
			.single();

		if ( error ) {
			console.error( 'Error loading team:', error );

			return {
				team: team || []
			};
		}

		return {
			team: team, clubs: clubs || [], competitions: competitions || []
		};
	}

	return {
		team: null, clubs: clubs || [], competitions: competitions || []
	};
}

export const actions: Actions = {
	default: async ( { request, params, locals: { supabase } } ) => {
		const formData = await request.formData();

		const name = formData.get( 'name' ) as string
		const clubID = formData.get( 'clubID' ) as string
		const competitionID = formData.get( 'competitionID' ) as string

		const { id } = params;

		const teamData = {
			name: name as string,
			club_id: clubID as string,
			competition_id: competitionID as string,
		};

		if ( id === 'add' ) {
			const { data, error } = await supabase.from( 'teams' )
				.insert( teamData )
				.select( 'id' )
				.single();

			if ( error ) {
				return fail( 500, {
					error: error.message
				} );
			}

			throw redirect( 303, '/admin/teams/add' );
		} else {
			const { error } = await supabase.from( 'teams' )
				.update( teamData )
				.eq( 'id', id );

			if ( error ) {
				return fail( 500, {
					error: error.message
				} );
			}

			throw redirect( 303, '/admin/teams' );
		}
	}
}
