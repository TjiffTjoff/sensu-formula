repo:
  pkgrepo.managed:
    - humanname: Sensu repository
    - name: deb http://repos.sensuapp.org/apt sensu main
    - file: /etc/apt/sources.list.d/sensu.list
    - key_url: http://repos.sensuapp.org/apt/pubkey.gpg
    - required_in:
      - pkg: sensu

sensu:
  pkg:
    - installed
