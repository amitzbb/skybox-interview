 resource "local_file" "haproxy" {
  content = templatefile("templates/haproxy.cfg.tpl",
    {
        backendPools = local.list_of_app
  })
  filename = "load-balancing/haproxy/haproxy.cfg"
}