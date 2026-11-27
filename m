Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798574;
	b=V78w5KUExJ/4M5V1do+EgTE0WuUvhR2i7fZq1izZ66Nb4qHhhdd9NCWchle9vDTEUENk
	 leGzUy4UAzyxar/qpJ0g5gq+VyqV6eOOKfVDbWE1iZddTp1Hn6Zw+UZE6zLxQ0qvcPZ/n
	 bQne+JZFdokIINfm43dspZ193v7N6gjCVxmjvCrqbb4oppp6YUhxdoomf9iaLJtLtQhIu
	 D69okvCRD4Dj+auRDeozX3+oXr6lp9AcDl+lICAtCpyhGYj56Y/jlCO5cm+6mUoRtTInO
	 atYbjuwQtOh0FMWVkDxyra7Lh5hRJ0XEHFllS04SJUhvCw2rky8sRGNSFY5IgdbzKfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NDQdal3wNitMcunk+R+QXDq5g9roUTKZhJO2aGBztU8=;
	b=u/wy7jc845s/l4NOYpoJHf4aV5JmuBfAbjaJmmQVweYr52cIntfe4bC7te59mfNdcD57
	 v5IjLdoxUtJ/kiTxG4vNSeUB6h5pB4xlkJUMKk25Z3OmR0x+obhyYj0yI5RkV3l18imkk
	 igFHcTt+dGLTPkS5lTbvswL98DVW9Ml4HFCRew1Uln9+QOrVM8hqHJnm417bidv0/3Liy
	 aJ6oWhIva1O1Nn86ZoLZv9Weae2FUeF1WSMwDizyi6dYU0viEwKNUXmXoaUxWOLyg1FP2
	 yt+FuioS9EJ66zpHTg2pdDDYRfHhQWpimuJCUmlXPF5UAeupNu9UVs8ip7x+JVE/DpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZ8JtXFI;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A745606A321
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 16:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A745606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZ8JtXFI
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so106533005e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 08:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798573; x=1796403373; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDQdal3wNitMcunk+R+QXDq5g9roUTKZhJO2aGBztU8=;
        b=KZ8JtXFIkQfXz2c7Tsx+GAZ3Fzt2x+OHJnSYymgbCPmi1W+LEUuJjx8lUZexWKa/Nx
         gGPeIbtoNqjHY2cLjqoNLCvZ1pi6OF2pO7hVTdWjNoMmGteMECLueM+xs1U6EOUGY5B5
         reGZ5etnP/Nr/6J6D/5rcu31be1AnRVTWkwwBLI7sBZ/q908iUAEMNAhpUSw6wrv5xla
         HiUTB14Dg+HcqY4G9dn3rwq/ZsPXM9mFlwQBIKaPRlGJS+2TsjUWhzKT25xFvvTJHEVJ
         fsVdYWn6EJIMmLmfuqvWN1pYOYEF146U0CVhQS+Zos8uMRFabucmjiJhAAlkcsIXxoTQ
         9wFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798573; x=1796403373;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDQdal3wNitMcunk+R+QXDq5g9roUTKZhJO2aGBztU8=;
        b=nOjzud3wTK8B8R1RL/7KlADT46onXNVgCwV++qPGQwBfMq+1/DeS3GJJftdrcE8Y0b
         bDPei/CP3omTJa/ZSMkbcimPa3FaDhe6egiIZcbVadHp3pEnpC3ty/kDyehp17W1CtHi
         B6Yx0nIqGlyWAgT6F4hHnzwDTO0mXs7kZgd6Eob8kBE9WRd0vkvlUQyt6lWME5EngBx1
         dMH+30QGjrYwJzAzjujG1Lh0fiMD26jwmV00ELCFvD+L8IcHmWMBXw/kL0E8+QB1adk5
         yRU8V3ANImHrhts1kgf1CrKYAgjXdyZdMO9EQXvHvIV+W4wPNpkLvrrIkYGCadt/J+rU
         aXfQ==
X-Forwarded-Encrypted: i=1; AL+hErEy+0mE5BJP39tP6Awebi/gowAm8CrAt66I8JcjOZ25LQ5w8qRXbZMM8y/G5sg/Lb985GCBtF6w6ETFfTyrdrk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+O61KPP8KArx+FwF+lUQDF9WhpQ6pM2Pe/rQlb1T2l7hVWqtDk
	jZTT0hP5zTiE0A/YwD5EaEioLpaOeHC89AMrTd0IUZqZrBos/qiFiczvkrFUPuVBTu0=
X-Gm-Gg: AZFdTZcgBaoj0MgPaSUWmEBW7LQ/h8lGE6YFLd6u9W5ixz+0ItxQI0ay32G1azP06jZ
	RVMtrJWWY/3HF/GeateCHnRvoZOkWXLcfylhmjU3FzB2tMfrIV8CXxkxHQK32uFnO7SH/BJKoSt
	5NpKRV5MbMTyhqb7nWecWyZyzVC8ghHGwtk4Dg0DbDVfoR0h51ixKhB+MPpHUjTCx+ul9nE6kKa
	bupBcs+SoOVe5Rs8QHd7lpww4F0r8hl8ophBmdDmhB0/j3C5YT4lvc/OZbHpCSP4jcdyhms+uyD
	pDMLPjCw51GzoPdUuUFdgjIiYjR1C9UQiqCJTXQwH2/r3t6L6XNe0LPcYv7TYV19uqR2hlmF9Nw
	oFg9AgyFNw1u8wHbnvTT4BWxSqbreSMeDoHM+ziShVEutIbsf0QG1bEnD7l/KAsVQOS0FwB29V+
	YiO7G+ZjkdvOWKhteWYxsyrh3k2i9nE2YsokXT0Z+laOzgKkW08VzNId5xPv4Li2UxepLDmey3I
	U6PmGZByMEt15i4A2/oAKs+tNQ+kBD6i7p1ZLKysUuSmV7rcOX9rq1L4YvUvCo6flTUtmIAQnEp
	Kmu5vFCXzYgbfpKq848vzf0QYyUQbk5yGHiwDwn1+NEbLSme7dcb3iEsJLRqZSvkdVlk7O8famf
	y7jwyg/4=
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr539373665e9.14.1795798572537;
        Fri, 27 Nov 2026 08:56:12 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm721676685e9.7.2026.11.27.08.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:56:12 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-riscv@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH RFC 4/4] serial: esp32: Enable the UART clock during port registration
Date: Fri, 27 Nov 2026 16:55:52 +0000
Message-ID: <20261127165552.133713-4-vitorhg20080@gmail.com>
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

uart_add_one_port() can invoke the modem control callbacks before
the console setup or startup callback enables the UART clock. Keep
the clock enabled across registration so those callbacks can
access the registers. Release the probe's clock reference after
registration, including when it fails.

Serial console registration and operation were tested on the
Waveshare ESP32-P4-Module-DEV-KIT.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 drivers/tty/serial/esp32_uart.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/tty/serial/esp32_uart.c b/drivers/tty/serial/esp32_uart.c
index 40acff7..cd68478 100644
--- a/drivers/tty/serial/esp32_uart.c
+++ b/drivers/tty/serial/esp32_uart.c
@@ -856,9 +856,15 @@ static int esp32_uart_probe(struct platform_device *pdev)
 	if (esp32_uart_ports[port->line])
 		return -EBUSY;
 
+	/* Serial core accesses modem control registers during registration. */
+	ret = clk_prepare_enable(sport->clk);
+	if (ret)
+		return ret;
+
 	/* Console setup can look up the port during registration. */
 	esp32_uart_ports[port->line] = sport;
 	ret = uart_add_one_port(&esp32_uart_reg, port);
+	clk_disable_unprepare(sport->clk);
 	if (ret) {
 		esp32_uart_ports[port->line] = NULL;
 		return ret;
