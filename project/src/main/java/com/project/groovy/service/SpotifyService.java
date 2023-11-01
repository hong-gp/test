package com.project.groovy.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.hc.core5.http.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.neovisionaries.i18n.CountryCode;

import se.michaelthelin.spotify.SpotifyApi;
import se.michaelthelin.spotify.exceptions.SpotifyWebApiException;
import se.michaelthelin.spotify.model_objects.credentials.ClientCredentials;
import se.michaelthelin.spotify.model_objects.specification.Album;
import se.michaelthelin.spotify.model_objects.specification.AlbumSimplified;
import se.michaelthelin.spotify.model_objects.specification.Paging;
import se.michaelthelin.spotify.requests.authorization.client_credentials.ClientCredentialsRequest;
import se.michaelthelin.spotify.requests.data.search.simplified.SearchAlbumsRequest;

@Service
public class SpotifyService {

	@Value("59ef494607ed4cb9a0d9f95b0ed09e5d")
    private String clientId;

    @Value("52ef66e7127744cb9c83f3a6bf5124c7")
    private String clientSecret;

    public List<Album> searchAlbums(String query) {
        SpotifyApi spotifyApi = new SpotifyApi.Builder()
                .setClientId(clientId)
                .setClientSecret(clientSecret)
                .build();
        ClientCredentialsRequest credentialsRequest = spotifyApi.clientCredentials().build();

        try {
            ClientCredentials credentials = credentialsRequest.execute();
            spotifyApi.setAccessToken(credentials.getAccessToken());

            SearchAlbumsRequest searchRequest = spotifyApi.searchAlbums(query).market(CountryCode.KR).build();
            final Paging<AlbumSimplified> albumSimplifiedPaging = searchRequest.execute();
            
            List<Album> albums = new ArrayList<>();
            
            for (AlbumSimplified albumSimplified : albumSimplifiedPaging.getItems()) {
                String albumId = albumSimplified.getId();
                try {
                    Album album = spotifyApi.getAlbum(albumId).build().execute();
                    albums.add(album);
                } catch (IOException | SpotifyWebApiException | ParseException e) {
                    // 앨범 상세 정보를 가져오는 중에 오류 발생
                    // 예외 처리 방법에 따라 로깅 또는 다른 조치를 취할 수 있습니다.
                    // 예: 로깅
                    System.err.println("Error while retrieving album details for album ID: " + albumId);
                }
            }
            
            return albums;
        } catch (IOException | SpotifyWebApiException | ParseException e) {
            throw new RuntimeException("Error: " + e.getMessage());
        }
    }
}
