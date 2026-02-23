import { json } from '@sveltejs/kit';
import { supabase } from '$lib/supabaseClient';

export async function GET( { params, request, cookies } ) {
	const { data, error } = await supabase.from( 'sports' )
		.select( `
			name, id, url:id,
			organisations( id, name )
		` )
		.order( 'name', { ascending: true } );

	const url = new URL( request.url );
	const baseUrl = `${ url.protocol }//${ url.host }`

	if ( data ) {
		data.forEach( item => {
			item.url = `${ baseUrl }/api/sports/${ item.id }`;

			item.organisations.forEach( organisation => {
				organisation.url = `${ baseUrl }/api/organisations/${ organisation.id }`
			} )
		} )
	}

	return json( data ?? [] );
}
