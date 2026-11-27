Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807532;
	b=3Km7qm+wCfFv52ahxIJDmYb+FACich+B8g/DeGaZpUXZFFwHsKNpm9AIp1oMcJKUk7nt
	 qFypSYxZdRU1uw4at67CewOfDKY6Ut+32E8psfhoaK+ZisorvuvtBavHRpFo/Y9QjBPZj
	 95LMji5QiDGFFN8pAy8p1nq5iCKwUy8iWFxW1LwQyd5m7PRv/gWsyNGDfNIrasx66x5Bc
	 FED+11bgP3VlpwX43+uH7pYO//4OD2GY0cAy6z8YxnAPnoUhsBiGi3iIzwnQvpiLyL1I9
	 6eyF+dPbSULv1L9igNvssImoyhaZ2uL1oNzMXfkwhPFjjqj17WMPm+JYaPdUb/pVh9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XH9gWDCllqbYGijR6SSDBIRKOHxF1ZqXOL/NGtJepT4=;
	b=du4DrSqlsvOuHatfUTzKzYJih7PgML74gjuORQDlwwT6H4Fg3XG9dd7ErWsKrXOIMe/N
	 keMuny5AwYN1Fd1tZcnT12ZMWLcE8oYfWQTYRMVlinWQakENfJuvFqytCTsdi1teJY5zB
	 Japg3msTjMqA+rmfBuOtGroV5PTfv8LNg3C/iptZ2sfJNNL7+mglkf3q3LyMKOy+CQP9o
	 ZC5+PLLRqzXTI3iSc1dBAqzukpSDkbP7plrEMcnAMqnGSB2Np1sm2RY/apsnJceQLsK7O
	 LRjB++FfceV5tXWLYdTASELQhJUchOVKw6rkzN8ou3Vvdlnzs5R7je0deYAxZHgeKCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awrtJwRL;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E34606A31F
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 19:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E34606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awrtJwRL
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso65372005e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 11:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807530; x=1796412330; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XH9gWDCllqbYGijR6SSDBIRKOHxF1ZqXOL/NGtJepT4=;
        b=awrtJwRLbO49ktUPgdA9diZNobDyWYg33D/nR23oUW/l6D8wYPqEjRGbizv+h/bBH4
         RAuvGl6WQvkOU0i04n8UmJB0r19z/V/bXwSWlYnYPMtwqGMy1ggLJJ8fucEC1Z0mHPn9
         eDik5CBVpcpoQ2j/1G0nsSwTkVpTwq5RCm6prLuN9OSrTCVWhSCUrBjT8z9vVDQRg33q
         ybfcB6bl6DLPDITeIQnS6eLWTUuG2HkKWjhq2C0PJDESJk/jX6Mf6CIVoGocMw1+wdoo
         cw+wEVChSXu7/9bPmkLdpu/lpb6bQxmvW9qJEszsJTRcXQMwfhVctK7ym/538QXeAl4X
         7YBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807530; x=1796412330;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XH9gWDCllqbYGijR6SSDBIRKOHxF1ZqXOL/NGtJepT4=;
        b=c63PRUiNHAWfIfSDBkVSgAQwKPG2mahbGDAojFzkXsbuXvoTmNeu1AttDFN5q/GUrb
         JBX0r4mHnDItvijuxn1xb87ZWQ66zLrGLLXntexkE/eD9gUf8gDwA03oaEf1rwZajbOU
         t29sYPKq95YqEJNrXsqkVJvX+2F/B431ka70S+D+vfMZGVSYXEpjxWmNJdagWKitsfNm
         87pevl61+nM0tGkigrUt4Rd/q4M/SJiqgwJyKG6VSg2yyPFAh72AnqDgU6Fb0NCkvqmi
         bjiOkKFlPAaU9vlGXecyVhpcXAXKm03IpQTRy1B8TZQOcKuc96+YuY1RBE4RnDeE14tV
         9NoQ==
X-Forwarded-Encrypted: i=1; AL+hErFkg4+zgM1ubQsunL0bHBUICyxepEPkhObzkEjcdRpaHjwGSB8wRqjGF7cA27zqSCPDsf1YCkLtyoxAZ83pf+Q=@lists.linux.dev
X-Gm-Message-State: APuU4Z/32lU8UGww21ShsmDS2s7QQujENjdLtSjaIpKj45OXanDR7Hbs
	mTy8orbqS4gvo2NpwUDywTfmfEKQ4akUjiB9eFO348QsN0ikVbs9IA5/
X-Gm-Gg: AZFdTZdbu0NhlHVePFSLRaWL/bwqYAM70NppPvDHaPRmayuDGVG6zZANDkJ9tuF7CX2
	OeHhMH1EJBNh3F3x6PVs42kFp8bAxKFoApASUlth3ZE5RNzLBwR1BjhWAJNVjMOlPxqyL4xY9ML
	qbAIXZ0DmPxngm2ChhlDo7E7CNdaHC+972x/nl5NrTlrw45yFEm5MsQU+2PgBvmRS+kL+WhzKDa
	v6nNb5xGPZL5avWhj2odZSS2eeNL34SByVYEwydWm1W5FkNOoksWeBNMDJfgsQeHxLykcZ1DVWo
	VGun80Zs7+JoEGoLBJkcBFp+Z4ZrM7j/L5RaNvFwmSh0sqL2GL33xAybm4HzfJqEikzpuih5GEi
	L3nNbMsjbUnm4zoc/K/koiht++PxjvM2PiWTF3gBhmYmTFO93kH0s0bb4RbV9JjvPJv8lbLmBMr
	W65IAKNt6uGSiCpfK0di4FSSCPqwajoqsGzDXxEdLdqrMWPCiUwNASb00YBOfdcCtWuGaNPGLwZ
	xNZMAFWFQjsPCjtM6R7wsvcBmti1cxp5f94n20L7H1AdRejATRNwwIM399OVrGox6a3VugNiWC2
	bveD7hN3OD6JvtMC17hDeqrusQx6UWHl1CpEyDxC2aPb/LTtPTuyn+Hqqnm2VwcUrjJEGk4ZDkc
	jo++cDWuf
X-Received: by 2002:a05:600d:1c:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4bb9de0d5ffmr266662415e9.25.1795807530110;
        Fri, 27 Nov 2026 11:25:30 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm700412425e9.1.2026.11.27.11.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:25:29 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-riscv@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH RFC 2/2] serial: esp32: Report active-low CTS correctly on ESP32-S3 and ESP32-P4
Date: Fri, 27 Nov 2026 19:25:11 +0000
Message-ID: <20261127192514.174468-2-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127192514.174468-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-11-vitorhg20080@gmail.com>
 <20261127192514.174468-1-vitorhg20080@gmail.com>
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

The ESP32-S3 and ESP32-P4 UARTs permit transmission when CTS is low.
The driver currently reports the raw CTS level as TIOCM_CTS, so
TIOCMGET reports CTS asserted while transmission is blocked.

Record the CTS polarity per variant and report the logical CTS state.
Use the existing polarity for the original ESP32.

On the Waveshare ESP32-P4-Module-DEV-KIT, UART1 internal loopback
verified that TIOCMGET reports CTS deasserted while transmission is
blocked and asserted when transmission resumes.

ESP32-S3 hardware testing is pending.

AI assisted with driver development and the loopback test.
Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 drivers/tty/serial/esp32_uart.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/esp32_uart.c b/drivers/tty/serial/esp32_uart.c
index 7d58a41..ab0f739 100644
--- a/drivers/tty/serial/esp32_uart.c
+++ b/drivers/tty/serial/esp32_uart.c
@@ -140,6 +140,7 @@ struct esp32_uart_variant {
 	const char *type;
 	bool has_clkconf;
 	bool needs_reg_update;
+	bool cts_active_low;
 };
 
 static const struct esp32_uart_variant esp32_variant = {
@@ -172,6 +173,7 @@ static const struct esp32_uart_variant esp32s3_variant = {
 	.rx_flow_thresh_mask = ESP32S3_UART_RX_FLOW_THRHD,
 	.type = "ESP32S3 UART",
 	.has_clkconf = true,
+	.cts_active_low = true,
 	.loopback_mask = UART_LOOPBACK,
 	.sw_rts_mask = UART_SW_RTS,
 	.sw_dtr_reg = UART_CONF0_REG,
@@ -191,6 +193,7 @@ static const struct esp32_uart_variant esp32p4_variant = {
 	.rx_flow_thresh_mask = ESP32P4_UART_RX_FLOW_THRHD,
 	.type = "ESP32-P4 UART",
 	.needs_reg_update = true,
+	.cts_active_low = true,
 	.loopback_mask = ESP32P4_UART_LOOPBACK,
 	.sw_rts_mask = ESP32P4_UART_SW_RTS,
 	.sw_dtr_reg = UART_CONF1_REG,
@@ -332,12 +335,14 @@ static void esp32_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
 
 static unsigned int esp32_uart_get_mctrl(struct uart_port *port)
 {
+	const struct esp32_uart_variant *variant = port_variant(port);
 	u32 status = esp32_uart_read(port, UART_STATUS_REG);
+	bool ctsn = status & UART_CTSN;
 	unsigned int ret = TIOCM_CAR;
 
 	if (status & UART_DSRN)
 		ret |= TIOCM_DSR;
-	if (status & UART_CTSN)
+	if (ctsn != variant->cts_active_low)
 		ret |= TIOCM_CTS;
 
 	return ret;
-- 
2.56.1

