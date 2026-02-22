import { json } from '@sveltejs/kit';
import { supabase } from '$lib/supabaseClient';

export async function GET( { params, request, cookies } ) {
	const { data, error } = await supabase.from( 'seasons' )
		.select( `
			name, id, url:id,
			competitions( id, name )
		` )
		.eq( 'id', params.id );

	const url = new URL( request.url );
	const baseUrl = `${ url.protocol }//${ url.host }`

	if ( data ) {
		data.forEach( item => {
			item.url = `${ baseUrl }/api/seasons/${ item.id }`;

			item.competitions.forEach( competition => {
				competition.url = `${ baseUrl }/api/competitions/${ competition.id }`
			} )
		} )
	}

	return json( data ?? [] );
}
