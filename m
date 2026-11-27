Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798570;
	b=lEYbCrRQQ9SDFKFtGFn4rZyEK6GGJhik9+HoaYqR4ZYjvqEMEY8IuHOykJe/mFiPvplw
	 PJyZ6x20GImThunUrAxE0WJ7j6HPNR+F79TmBcUR+z0qIZeOY7ZG0jZ9qChVm6/C3W2M3
	 J+kwXn0ojIR0q96VxIhcjzQsDfWeRV3yrj4KR5GUqCUe/AMlMOyowZTaESIE8nw8pT17C
	 h2TQMYLa3LmFXz/Z69qBDfN5qQAqyHNei3pBANfEuKRMcsg9aOnD0VpvkZIpAZbHIyRqf
	 zTA7GTVY79Hzs+t12EpqQoMVDquudL24Ys+CTGb/vqXsyEuqT38PcUvapE4+L4HUAcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=tBQuv6Lhdi7fEtiV2oM4BKslPIEAViTQUedU+aiaIxU=;
	b=YDXfG79uoUPKgIcPU6pWhXiOPYI2jEOqSsKxqBBpnj0o1IzRKG09P6DXlnVcThYWgbMQ
	 A0PvwI35qk+LC6vNdos+kqbfHV3EgxBXwXEhVD7fu2i1PV5M0Cx7Ab+CNGtNDaXgVfAi5
	 SQ590/EfRU1YMh/u4GBRLvfT0TZCU5oSqwflJdjDTRD0gP9nJ4ciNQf2/dDK8HLYCntUR
	 3LKoheioFKZ5ZeI12E2YloNvKblKG+V/8TIdz/zehEQotzyJzV5G7na9p38OYAnidvUKc
	 6oyiJFjbyAjZdRDVqlh6utWxGZbTa4DYhIB5DNjLVrASSd8UWj2/F2/VWLQJ+zxMi0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmq9tQ9l;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8BB606A323
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 16:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C8BB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmq9tQ9l
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb606491faso44125465e9.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 08:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798568; x=1796403368; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tBQuv6Lhdi7fEtiV2oM4BKslPIEAViTQUedU+aiaIxU=;
        b=hmq9tQ9l/z3ta1sUnB0S9rwEjbsWkrxnW8ZQ+b3UI1t3dgX754bySw2MMvNzY08HOK
         2stxuLkMLZ22J+84z/T5IHE1LmgbfwSdHFZRGBBjOqPHWsvq3sK5aAFWxSNiBpxHuuZX
         zFjpa7BCxJc04GTmM6HKJ6WC8XCQiOuUCB539nrpIuo5NIkVztT2xJKg7WwQDo8iiyhr
         tdkWU+HF+o/TSb4SUgRJiT3HuNv5Q6fOgwqnK69rXcaDaTnC4HxvlmNmGsSFx511XZED
         zg4VaN8vgHkDbuRzd9V8KtsIS9z6DE4/fe0ayUMAwcmm/amgEthJTsWzxBA8jBo+lCh2
         ltyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798568; x=1796403368;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBQuv6Lhdi7fEtiV2oM4BKslPIEAViTQUedU+aiaIxU=;
        b=PBbGy2ciP0L1tD1A2GaBKbLqXk81JVvwmYWJnrCIhcjcDNqG+LQik/NXrfjlZibng6
         W6asrtwYoPBz4jHiv9u3i5JqxH+i4eBh+q6rl99Frs/Xu8RaM4XkiaUe8sQXiBRdUQqx
         E3q2pqIq1tI6c3+vziy0IEtYmgC2cKlG4O49mrgc98D1jEuE/CXsKGsHRNxupvtHrZCZ
         toFsFnZ/AanlPU2RtwJpTsOb4vcWOcixTFqMyrgLUFdkwhJw/pwbZ2H85U+bUF7n4DhZ
         TLJf1G3LiE+Mjxi+CyEWLqqejcQMHDb3ShuKCqOiBpqMT+iI6i5nycP/4sB5uqI054/Q
         mh1A==
X-Forwarded-Encrypted: i=1; AL+hErH4NyFOL3IvKNpcN8oGPtKTi0BKC3fWf1sC9CpX+9/aYLFHxbPL5TD+1rov9GDsBsTMwrmf+p78zhFlO6fnSMY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9tfce8RKblYGBCLbEj4CkFpQI67TjkJNvFMYMB/gy+jo/q3qIp
	8eYS3lGQHYELtGyHcew7+grFOo5NfFaYMLTYCm8EOokBfVm94LdMVgreZi0lgm3NCOo=
X-Gm-Gg: AZFdTZe0NQX8jjGIj3Peu+/jdN3o89IUNYKzBN7GbowNW2FonJ5pS4mGRRVJNPMTobQ
	yaQSG5ioB6covwHB0OrkVJxrMhZI+qZ1mxcDwiI9WLgoBIVUsVLfmJOwUOcbaIXoUntD6ywUGg8
	P8hN5uadjwr0+X3LZ93bheJaKT2G2zYhkicsQDNnWoxyl2DwffmltLoRWXOxetw6wEOQ+034svX
	vc4cs9qgTAPIrmESbJ/atIUDHKqFaVp/PmMlou8AJds+EymJ1TG1bQvqcl6ZGWKWofdlPbhpqNA
	5/gLjd/irnWU6i0o6baz3GKBOdJ/hxctPjqm6jg57dV5FyESBKwMaTSWaFpdS2yKxHAJVNYc5JU
	o7uPPYQFiYfNvsSbKRsuEwgSDV5Sn1qAzvOkUvxuV8n8JNOchcLM923eIELiGqZ17vMVbJXECD8
	ZkVXJHUNug/D7p2LgjFNzEAsmWAV2xV9gBwijv6oalQAQk9Zsx04ThSJ5LFH6WEIphY6YeH10P1
	6YG8N01EMsBiIppYOxhrJLNnpuqwClQIp5bG0qifXnNQDrIBYPcltm+oefVBpNI8je7t3gtu1PR
	r7JjXjsso66TaFaMcX/KM42BvT3EGRg87RvAMD3KTq628KKHH8WVlAuZ5zkDb4I9tx7yK3Z17V1
	RpnWlEN4=
X-Received: by 2002:a05:600c:1d86:b0:4bb:6a5a:7824 with SMTP id 5b1f17b1804b1-4bb8892099amr546093415e9.30.1795798568353;
        Fri, 27 Nov 2026 08:56:08 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm677062805e9.6.2026.11.27.08.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:56:08 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-riscv@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH RFC 2/4] serial: esp32: Fix ESP32-S3 baud rate prescaler calculation
Date: Fri, 27 Nov 2026 16:55:50 +0000
Message-ID: <20261127165552.133713-2-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127165552.133713-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-11-vitorhg20080@gmail.com>
 <20261127165552.133713-1-vitorhg20080@gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ESP32-S3 encodes the SCLK prescaler as divisor minus one. At the
maximum unscaled integer UART divider, the driver can program a
prescaler it did not use in the baud calculation. At lower rates the
prescaler can also exceed its register field.

Select the smallest prescaler that fits the UART divider, including
its fractional part, and reject an out-of-range prescaler before
programming the registers. Round up the minimum baud rate to avoid
advertising a rate the hardware cannot generate.

A mocked register test covered the divider boundary and rejected
38 baud while accepting 39 baud with a 40 MHz reference clock.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 drivers/tty/serial/esp32_uart.c | 40 ++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/tty/serial/esp32_uart.c b/drivers/tty/serial/esp32_uart.c
index 895d0ec..0e7128a 100644
--- a/drivers/tty/serial/esp32_uart.c
+++ b/drivers/tty/serial/esp32_uart.c
@@ -8,6 +8,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -447,35 +448,35 @@ static void esp32_uart_shutdown(struct uart_port *port)
 
 static bool esp32_uart_set_baud(struct uart_port *port, u32 baud)
 {
+	u32 div_mask = port_variant(port)->clkdiv_mask;
 	u32 sclk = port->uartclk;
-	u32 div;
+	u32 div, frag;
 
 	if (!baud || baud > sclk)
 		return false;
 
 	div = sclk / baud;
-
 	if (port_variant(port)->has_clkconf) {
-		u32 sclk_div = div / port_variant(port)->clkdiv_mask;
+		/* The SCLK field encodes the divisor minus one. */
+		u32 sclk_div = div / (div_mask + 1);
 
-		if (div > port_variant(port)->clkdiv_mask) {
-			sclk /= (sclk_div + 1);
-			div = sclk / baud;
-		}
+		if (sclk_div > FIELD_MAX(ESP32S3_UART_SCLK_DIV_NUM))
+			return false;
+
+		sclk /= sclk_div + 1;
+		div = sclk / baud;
 		esp32_uart_write(port, ESP32S3_UART_CLK_CONF_REG,
 				 FIELD_PREP(ESP32S3_UART_SCLK_DIV_NUM, sclk_div) |
 				 ESP32S3_UART_CLK_CONF_DEFAULT);
 	}
 
-	if (div <= port_variant(port)->clkdiv_mask) {
-		u32 frag = (sclk * 16) / baud - div * 16;
-
-		esp32_uart_write(port, UART_CLKDIV_REG,
-				 div | FIELD_PREP(UART_CLKDIV_FRAG, frag));
-		return true;
-	}
+	if (div > div_mask)
+		return false;
 
-	return false;
+	frag = (sclk * 16) / baud - div * 16;
+	esp32_uart_write(port, UART_CLKDIV_REG,
+			 div | FIELD_PREP(UART_CLKDIV_FRAG, frag));
+	return true;
 }
 
 static void esp32p4_uart_limit_baud_rate(struct ktermios *termios,
@@ -514,10 +515,13 @@ static void esp32_uart_set_termios(struct uart_port *port,
 
 	termios->c_cflag &= ~CMSPAR;
 
-	if (port_variant(port)->has_clkconf)
-		max_div *= FIELD_MAX(ESP32S3_UART_SCLK_DIV_NUM);
+	if (port_variant(port)->has_clkconf) {
+		max_div *= FIELD_MAX(ESP32S3_UART_SCLK_DIV_NUM) + 1;
+		min_baud = DIV_ROUND_UP(port->uartclk, max_div);
+	} else {
+		min_baud = port->uartclk / max_div;
+	}
 
-	min_baud = port->uartclk / max_div;
 	max_baud = port->uartclk / 16;
 	if (port_variant(port) == &esp32p4_variant)
 		esp32p4_uart_limit_baud_rate(termios, old, min_baud, max_baud);
