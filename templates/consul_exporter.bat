set CONSUL_HTTP_TOKEN={{ consul_public_exporter_token }}
c:\ProgramData\consul\bin\consul_exporter.exe --web.listen-address=":{{ consul_port_arg.exporter }}" --consul.server="{% if consul_arg.https %}https{% else %}http{% endif %}://localhost:{{ consul_port_arg.http }}" --no-consul.health-summary  --consul.allow_stale --consul.insecure
