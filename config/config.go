package config

import (
	"flag"

	"github.com/mailcache/envconf"
)

func DefaultConfig() *Config {
	return &Config{
		APIHost:    "",
		UIBindAddr: "0.0.0.0:8025",
		WebPath:    "",
	}
}

type Config struct {
	APIHost    string
	UIBindAddr string
	WebPath    string
}

var cfg = DefaultConfig()

func Configure() *Config {
	return cfg
}

func RegisterFlags() {
	flag.StringVar(&cfg.APIHost, "api-host", envconf.FromEnvP("MC_API_HOST", "").(string), "API URL for MailCache UI to connect to, e.g. http://some.host:1234")
	flag.StringVar(&cfg.UIBindAddr, "ui-bind-addr", envconf.FromEnvP("MC_UI_BIND_ADDR", "0.0.0.0:8025").(string), "HTTP bind interface and port for UI, e.g. 0.0.0.0:8025 or just :8025")
}
