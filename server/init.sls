include:
  - sensu
  - sensu.server.rabbitmq

sensu-server:
  service:
    - running
    - enable: true
    - watch:
      - file: redis.json
      - file: dashboard.json
      - file: api.json

redis.json:
  file:
    - name: /etc/sensu/conf.d/redis.json
    - managed
    - source: salt://sensu/server/redis.json
    - template: jinja

sensu-dashboard:
  service:
    - running
    - enable: true
    - watch:
      - service: sensu-server

dashboard.json:
  file:
    - managed
    - name: /etc/sensu/conf.d/dashboard.json
    - source: salt://sensu/server/dashboard.json
    - template: jinja

sensu-api:
  service:
    - running
    - enable: true
    - watch:
      - service: sensu-server

api.json:
  file:
    - managed
    - name: /etc/sensu/conf.d/api.json
    - source: salt://sensu/server/api.json
    - template: jinja
