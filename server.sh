# compose the [server.conf]

CONFIG_DIR=/etc/lighttpd

rm -rf $CONFIG_DIR/server.conf

cat $CONFIG_DIR/basic.conf >> $CONFIG_DIR/server.conf

echo "server.container_hostname = \"`hostname`\"" >> $CONFIG_DIR/server.conf
cat /etc/hosts | grep `hostname` | echo server.container_ip = \"`awk -F '\t' '{print $1}'`\" | tee >> $CONFIG_DIR/server.conf

echo "setenv.add-response-header += (\"X-Container-Hostname\" => server.container_hostname)" >> $CONFIG_DIR/server.conf
echo "setenv.add-response-header += (\"X-Container-IPAddr\" => server.container_ip)" >> $CONFIG_DIR/server.conf

lighttpd -D -f $CONFIG_DIR/server.conf