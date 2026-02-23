import { json } from '@sveltejs/kit';
import { supabase } from '$lib/supabaseClient';

export async function GET( { params, request, cookies } ) {
	const { data, error } = await supabase.from( 'competitions' )
		.select( `
			name, id, url:id,
			seasons( id, name )
		` )
		.eq( 'id', params.id );

	const url = new URL( request.url );
	const baseUrl = `${ url.protocol }//${ url.host }`

	if ( data ) {
		data.forEach( item => {
			item.url = `${ baseUrl }/api/competitions/${ item.id }`;
			item.seasons.url = `${ baseUrl }/api/seasons/${ item.seasons.id }`;
		} )
	}

	return json( data ?? [] );
}
