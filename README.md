# HockeyRoster
Code sample for loading a roster of hockey players with list and detail view.<br> Real JSON url omitted for the privacy of the company who sent the challenge. 

### Challenge details:

1. Set up view to display a roster of hockey players.
2. Download and parse the JSON data at https://www.downloadablehockeyfoo.com/rosterbar.json. (fake url)
3. Display the roster in a scrollable list.
4. Each entry should show the person's picture (on the left), name (as the title), and position (as the subtitle).
5. When a row is clicked, use a new view to display the contact details (picture, name, and position, laid out however you like) and transition to said view.

### Notes:
+ Image URLS of hockey players in `generated.json` are from <a href="https://www.123rf.com/stock-photo/hockey_player.html">123rf.com</a> and not intended for any other use than a demon of paginated image loading.
+ Hockey player data (except for positions) was randomly generated with <a href="https://www.json-generator.com">Json Generator</a>.
+ Uses Swift 4's Codable protocols
