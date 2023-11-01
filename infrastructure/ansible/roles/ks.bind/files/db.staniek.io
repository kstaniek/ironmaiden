$TTL 3600 ; 60 min
@               IN SOA  ns1.staniek.io. root.staniek.io. (
                        2023102401 ; Serial
                        3600       ; Refresh (1 hour)
                        3600       ; Retry (1 hour)
                        604800     ; Expire (1 hour)
                        3600       ; Minimum (1 hour)
)

; Name Servers - NS records
@               NS      ns1.staniek.io. ; This is required
@               NS      ns2.staniek.io. ; You should have two name servers
@               A       172.31.20.50
@               A       172.31.20.51
ns1                        IN  A      172.31.20.50
ns2                        IN  A      172.31.20.51