import { json } from '@sveltejs/kit';
import { supabase } from '$lib/supabaseClient';

export async function GET( { params, request, cookies } ) {
	const { data, error } = await supabase.from( 'teams' )
		.select( `
			name, id, url:id,
			competitions( id, name ),
			clubs( id, name )
		` )
		.order( 'name', { ascending: true } );

	const url = new URL( request.url );
	const baseUrl = `${ url.protocol }//${ url.host }`

	if ( data ) {
		data.forEach( item => {
			item.url = `${ baseUrl }/api/teams/${ item.id }`;
			item.competitions.url = `${ baseUrl }/api/competitions/${ item.competitions.id }`;
			item.clubs.url = `${ baseUrl }/api/clubs/${ item.clubs.id }`;
		} )
	}

	return json( data ?? [] );
}
