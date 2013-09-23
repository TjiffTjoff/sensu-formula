rabbitmq.json:
  file:
    - managed
    - name: /etc/sensu/conf.d/rabbitmq.json
    - source: salt://sensu/server/rabbitmq.json
    - template: jinja

rabbitmq_user:
  cmd:
    - wait
    - name: rabbitmqctl add_user {{ salt['pillar.get']('sensu:rabbitmq:user', 'sensu') }} {{ salt['pillar.get']('sensu:rabbitmq:password' , 'sensu') }}

rabbitmq_vhost:
  cmd:
    - wait
    - name: rabbitmqctl add_vhost {{ salt['pillar.get']('sensu:rabbitmq:vhost', '/sensu') }}

rabbitmq_permissions:
  cmd:
    - wait
    - name: rabbitmqctl set_permissions -p {{ salt['pillar.get']('sensu:rabbitmq:vhost', '/sensu') }} {{ salt['pillar.get']('sensu:rabbitmq:user', 'sensu') }} ".*" ".*" ".*"
    - watch:
      - cmd: rabbitmq_user
      - cmd: rabbitmq_vhost

