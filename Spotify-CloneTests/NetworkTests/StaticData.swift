//
//  StaticData.swift
//  Spotify-CloneTests
//
//  Created by Azhar Anwar on 4/9/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import Foundation

struct StaticData {
    static let data = """
    {
      "items": [
        {
          "album": {
            "album_type": "ALBUM",
            "artists": [
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/6vXTefBL93Dj5IqAWq6OTv"
                },
                "href": "https://api.spotify.com/v1/artists/6vXTefBL93Dj5IqAWq6OTv",
                "id": "6vXTefBL93Dj5IqAWq6OTv",
                "name": "French Montana",
                "type": "artist",
                "uri": "spotify:artist:6vXTefBL93Dj5IqAWq6OTv"
              }
            ],
            "available_markets": [
              "AD",
              "AE",
              "AR",
              "AT",
              "AU",
              "BE",
              "BG",
              "BH",
              "BO",
              "BR",
              "CA",
              "CH",
              "CL",
              "CO",
              "CR",
              "CY",
              "CZ",
              "DE",
              "DK",
              "DO",
              "DZ",
              "EC",
              "EE",
              "EG",
              "ES",
              "FI",
              "FR",
              "GB",
              "GR",
              "GT",
              "HK",
              "HN",
              "HU",
              "ID",
              "IE",
              "IL",
              "IN",
              "IS",
              "IT",
              "JO",
              "JP",
              "KW",
              "LB",
              "LI",
              "LT",
              "LU",
              "LV",
              "MA",
              "MC",
              "MT",
              "MX",
              "MY",
              "NI",
              "NL",
              "NO",
              "NZ",
              "OM",
              "PA",
              "PE",
              "PH",
              "PL",
              "PS",
              "PT",
              "PY",
              "QA",
              "RO",
              "SA",
              "SE",
              "SG",
              "SK",
              "SV",
              "TH",
              "TN",
              "TR",
              "TW",
              "US",
              "UY",
              "VN",
              "ZA"
            ],
            "external_urls": {
              "spotify": "https://open.spotify.com/album/1jJdkoOAj3Uk6Tbv3S4fsa"
            },
            "href": "https://api.spotify.com/v1/albums/1jJdkoOAj3Uk6Tbv3S4fsa",
            "id": "1jJdkoOAj3Uk6Tbv3S4fsa",
            "images": [
              {
                "height": 640,
                "url": "https://i.scdn.co/image/ab67616d0000b273cd18f7eac6073cc94e3b6cad",
                "width": 640
              },
              {
                "height": 300,
                "url": "https://i.scdn.co/image/ab67616d00001e02cd18f7eac6073cc94e3b6cad",
                "width": 300
              },
              {
                "height": 64,
                "url": "https://i.scdn.co/image/ab67616d00004851cd18f7eac6073cc94e3b6cad",
                "width": 64
              }
            ],
            "name": "MONTANA",
            "release_date": "2019-12-06",
            "release_date_precision": "day",
            "total_tracks": 20,
            "type": "album",
            "uri": "spotify:album:1jJdkoOAj3Uk6Tbv3S4fsa"
          },
          "artists": [
            {
              "external_urls": {
                "spotify": "https://open.spotify.com/artist/6vXTefBL93Dj5IqAWq6OTv"
              },
              "href": "https://api.spotify.com/v1/artists/6vXTefBL93Dj5IqAWq6OTv",
              "id": "6vXTefBL93Dj5IqAWq6OTv",
              "name": "French Montana",
              "type": "artist",
              "uri": "spotify:artist:6vXTefBL93Dj5IqAWq6OTv"
            },
            {
              "external_urls": {
                "spotify": "https://open.spotify.com/artist/1zNqQNIdeOUZHb8zbZRFMX"
              },
              "href": "https://api.spotify.com/v1/artists/1zNqQNIdeOUZHb8zbZRFMX",
              "id": "1zNqQNIdeOUZHb8zbZRFMX",
              "name": "Swae Lee",
              "type": "artist",
              "uri": "spotify:artist:1zNqQNIdeOUZHb8zbZRFMX"
            },
            {
              "external_urls": {
                "spotify": "https://open.spotify.com/artist/7bXgB6jMjp9ATFy66eO08Z"
              },
              "href": "https://api.spotify.com/v1/artists/7bXgB6jMjp9ATFy66eO08Z",
              "id": "7bXgB6jMjp9ATFy66eO08Z",
              "name": "Chris Brown",
              "type": "artist",
              "uri": "spotify:artist:7bXgB6jMjp9ATFy66eO08Z"
            }
          ],
          "available_markets": [
            "AD",
            "AE",
            "AR",
            "AT",
            "AU",
            "BE",
            "BG",
            "BH",
            "BO",
            "BR",
            "CA",
            "CH",
            "CL",
            "CO",
            "CR",
            "CY",
            "CZ",
            "DE",
            "DK",
            "DO",
            "DZ",
            "EC",
            "EE",
            "EG",
            "ES",
            "FI",
            "FR",
            "GB",
            "GR",
            "GT",
            "HK",
            "HN",
            "HU",
            "ID",
            "IE",
            "IL",
            "IN",
            "IS",
            "IT",
            "JO",
            "JP",
            "KW",
            "LB",
            "LI",
            "LT",
            "LU",
            "LV",
            "MA",
            "MC",
            "MT",
            "MX",
            "MY",
            "NI",
            "NL",
            "NO",
            "NZ",
            "OM",
            "PA",
            "PE",
            "PH",
            "PL",
            "PS",
            "PT",
            "PY",
            "QA",
            "RO",
            "SA",
            "SE",
            "SG",
            "SK",
            "SV",
            "TH",
            "TN",
            "TR",
            "TW",
            "US",
            "UY",
            "VN",
            "ZA"
          ],
          "disc_number": 2,
          "duration_ms": 194171,
          "explicit": true,
          "external_ids": {
            "isrc": "USSM11914355"
          },
          "external_urls": {
            "spotify": "https://open.spotify.com/track/54yCP5dfn4uvU5h37aE8f4"
          },
          "href": "https://api.spotify.com/v1/tracks/54yCP5dfn4uvU5h37aE8f4",
          "id": "54yCP5dfn4uvU5h37aE8f4",
          "is_local": false,
          "name": "Out Of Your Mind (feat. Chris Brown)",
          "popularity": 69,
          "preview_url": "https://p.scdn.co/mp3-preview/3da953231c0fdd15660324cbfbb8e5d8fe9c0be9?cid=4ff8e60b1da948e1af07650bde11ed97",
          "track_number": 2,
          "type": "track",
          "uri": "spotify:track:54yCP5dfn4uvU5h37aE8f4"
        }
      ],
      "total": 50,
      "limit": 1,
      "offset": 5,
      "href": "https://api.spotify.com/v1/me/top/tracks?limit=1&offset=5",
      "previous": "https://api.spotify.com/v1/me/top/tracks?limit=1&offset=4",
      "next": "https://api.spotify.com/v1/me/top/tracks?limit=1&offset=6"
    }
    """.data(using: .utf8)
}
