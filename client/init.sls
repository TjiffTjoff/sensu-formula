include:
  - sensu

sensu-client:
  service:
    - running
    - enable: true
    - watch:
      - file: sensu-client
      - file: rabbitmq.json
  file:
    - managed
    - name: /etc/sensu/conf.d/client.json
    - source: salt://sensu/client/client.json
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - context:
      nodename: {{ salt['grains.item']('nodename')['nodename'] }}
      ip: {{ salt['network.interfaces']()['eth1']['inet'][0]['address']}}

rabbitmq.json:
  file:
    - managed
    - name: /etc/sensu/conf.d/rabbitmq.json
    - source: salt://sensu/client/rabbitmq.json
    - template: jinja


