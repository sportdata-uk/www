import { json } from '@sveltejs/kit';
import { supabase } from '$lib/supabaseClient';

export async function GET( { params, request, cookies } ) {
	const { data, error } = await supabase.from( 'organisations' )
		.select( `
			name, id, url:id,
			seasons( id, name )
		` )
		.order( 'name', { ascending: true } );

	const url = new URL( request.url );
	const baseUrl = `${ url.protocol }//${ url.host }`

	if ( data ) {
		data.forEach( item => {
			item.url = `${ baseUrl }/api/organisations/${ item.id }`;

			item.seasons.forEach( season => {
				season.url = `${ baseUrl }/api/seasons/${ season.id }`
			} )
		} )
	}

	return json( data ?? [] );
}
