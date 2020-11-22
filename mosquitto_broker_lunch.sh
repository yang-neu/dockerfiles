# 1883 : MQTT, unencrypted
# 8883 : MQTT, encrypted
# 8884 : MQTT, encrypted, client certificate required
# 8080 : MQTT over WebSockets, unencrypted
# 8081 : MQTT over WebSockets, encrypted
docker run -it -d -p 1883:1883 -p 8883:8883 -p 8884:8884 -p 8080:8080 -p 8081:8081 --name broker_mosquitto alexandaryang/portable-server:u18_rpi_w_python
