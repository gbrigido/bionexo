require 'rubygems'
require 'httparty'

# Token de autorizacao
headers = {
    "Authorization": "Bearer BQB0lBE4MDMDI4Nvw44aMYUh029JbzI7nsuMsPW3F8-NMPF3CaylGCFaV386V6eq8Wu-v-6wN351VPpD5D-7sQGF17U3-YvAGw4Frut9ADRiaD8kR9C1iGBRW4kTpVTuCj2AAlzEQ-8Kt2i7Ilzg6KO5-BldS_O1ib1By9DnArQ9aUPxYTdog5GLBG7zapWsqHMdvN33zTPe9ezFdq14TBW4CB92Cck1v46qIBuEWqAggBSAJhyWJT3xyBRADr7ZPA"
}

# Lista todas as Playlists
response = HTTParty.get('https://api.spotify.com/v1/me/playlists', :headers => headers)
puts response['items']


# PlaylistId obtido do get anterior
playlistId = '28qhTdg67ZYD08BQW2THWO'


# Adiciona musica na Playlist
response = HTTParty.post('https://api.spotify.com/v1/playlists/'+playlistId+'/tracks?uris=spotify:track:4iV5W9uYEdYUVa79Axb7Rh', :headers => headers)
puts 'Adicionando musica na Playlist'
puts response

# Detalhes da Playlist
response = HTTParty.get('https://api.spotify.com/v1/playlists/'+playlistId, :headers => headers)
puts 'Detalhes da Playlist'
puts response

# Remove musica da playlist
body = {
    tracks: [
        uri: 'spotify:track:4iV5W9uYEdYUVa79Axb7Rh'
    ]
}.to_json

response = HTTParty.delete('https://api.spotify.com/v1/playlists/'+playlistId+'/tracks', :headers => headers, :body => body)
puts "Removendo Musica"
puts response