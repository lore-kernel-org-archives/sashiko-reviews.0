Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807530;
	b=BcTEhF3DlkTQjfChIxdFVi6dROYkeYGykAbxNd1SxdxmYH+h2c4xvEUIXyyouayqefJz
	 wUAVfiqXEPiToC0AIEttPw3iRoSurP5fCEv+uSRfdPKG9pRfwxyHz0vKhAsW/PlKa9yAD
	 /q/PUD9a0Q64Kdb5wTrFVaIhlmZJVGmQ+udcAF6cXRLSl6kxZgO3JbfR/XIlqRbF5tde+
	 kRXz12pxBILua6AdLPeFDpG6u/h8mT8HIZlp20y/yt05P2XNC/qDpWQ6WrEn2dn4046RK
	 o/qc5HurY4caD0++r9jprc6wXq9KeJpBEsP2AN8DDiypA24gLgJM6K8Cm4WtVS9yQYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=X+Y8inuTsfkFjk3koINUb0aKmLGPzBSOedDj4A9k4LA=;
	b=lleyxZWsPtXld42W5a7LqQNMODeFAGHNqFGzIPoG1dLYVaYMZlPFnhBKKcZmf0uUfZSj
	 tMZP/3ISyOqO9uVZF7PK/q/RDl0ZyugyYR4RpdWV3jhexpU8DMxi0yrxc2H/qsRHbQ/Aa
	 1OZOtHL8SuRpqK7T+v2npNjy5q0+3KgStVl8jUByPQsJfiaoG3byGngUQKNG2UHYitx73
	 59d0uinf6nHACnx1yqeWHXrvyl/oaP+RLCba1KxBpwYS8TxDhGyXgO30wjLjyBRLiad5i
	 DVSJLPk06TA9CPvwrAxSIpG1XUcza27NvV/ZzOgjKfJY/Gsal+vSiUdpJ1uRB/6Fm5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kVSn6qP7;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6633E606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 19:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6633E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kVSn6qP7
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb606491faso44702845e9.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 11:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807529; x=1796412329; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X+Y8inuTsfkFjk3koINUb0aKmLGPzBSOedDj4A9k4LA=;
        b=kVSn6qP7lQJsf8kg/z6LabGu8C84zTa0i7DGEM+nrDwfn3MrHaJGtri1zApKfwtmeP
         DPHAjG1jz6WOkYhhfLk/HIobiKtK2xep8g0NJJeGv5WrXwg0mi6lN+3oOMF0KC3QNMPt
         yRvrqdo5Z06YZVqQm6dfWKF/lnTikANodsW+pLORhrdIqud2uCs7fhwFuAV2m1LH5EpG
         bzQ7kHB8CsG1Izlowg9wG3l8gdTMZG20CEAM+75rE2rRz+1QJX0x7uzRW9uUgsD2Ya2M
         37R37NL0XCjARtVGRdvtAydmzVJSLHvS609wSv8E6ldfVKJHVKX3nVm3Mx4jF3bhqRCU
         gcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807529; x=1796412329;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+Y8inuTsfkFjk3koINUb0aKmLGPzBSOedDj4A9k4LA=;
        b=pKghP66Gxsf0NNFfHq1N9aVM71WWgDA8BcGsrHglwjW9Ca15jw5udmC4hvCas0Ys9I
         uqnKqctivkHu75Csoeq6zhaoonyShxJGfEkNJS9fCHQW7emDZRS4L/SUhd6JbB2u6rbC
         AoMqpyouGThw8c8W+3j1GzA5Ts+7VW0ImOgUqCcqT5pGlt6px1SC8YjgmFZEtCvqAVtA
         WoVJH3yzvzTtesVfiikIwmAl42Ea/VHszALfSF8QtpN70epjACIw1lK5bqLi1VaNI216
         9KIj7vzmtYK6ZE30b+EcggtGCfQDy82gAtIgXMUEl9MLuSvk78wAVOkcvKtbGDWCL7Z/
         I0Ow==
X-Forwarded-Encrypted: i=1; AL+hErHCivVbgf58YbstM/K+q1QiCz9LHty9QrS2vnnEtHWPcSPZXblfhI1T6qthbjp2I423i7YHunqWqMQwHOfrcps=@lists.linux.dev
X-Gm-Message-State: APuU4Z802xxEKz3kRFNvI4xpboXoz2nsz8GEUe02Rsno1s+PuERfsWnv
	wrgHi/H6mDQOx4ZevBA2Fb/gap4oJPeH4EWl8idn8eTf3zfHtuISvXfc
X-Gm-Gg: AZFdTZdf5c6NyuHUoVNjyCuLz9+HZHVy6oFuAcMCa4OwdUd31I+1R6zLN8KLU1w6Bw5
	VbZxMNorva4WvJWbbDILNeV+iTrW3OaI10NhdOcxWrRuK9WsOg6yaTGPWqPSnJULuwHqzXQvZnH
	2mTldTfGHkqzjxxKWqDDEUf3a+NCu9RGS9X6/8FZipDqssbcYYpWxts3kJzbXySbCRXpkQzepcK
	PuxISxapzVrXqELJxG3NPdga64uOBCukabIoFu0cW/nCR/r8p/Q/HkjHGF/upnZneyNCre6S4Tm
	sHf5bHpXKroX/zDuW8eRhU2Nrd04cJga69PJ49cBhS9XShjoWY89ejjGhR9Bm04mtHqnEzoRQp1
	CFHVIlTPnJV4QBmEUoZnd5mtNMmIL9au0ELRoK6PUICavCzkvBtfm7M5ADZ52OTG1ALXqprGq37
	ScqcIrNsV7FqhWUyybrsJVdP+RvnRYpQ/7S1Gt5riw7sxjKyq48etl1JFHvU+SXR8CYLbCI9tg2
	iINb0+/6cVCgLQy2Hx7eoI926i+54ouv/y4KFuLq6RmMyl9hJlmxV+LaA4Pxrg2k/Dbgt4hs5pt
	KjFXWD6F4pvrabXqaJQQM7cWgq8QKV0bH5nY3zc/zY1FJPPw2/ZGzb+x8Q710kMNw30Nm2rkNjX
	j1SDoQ5Y=
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr543971595e9.12.1795807528540;
        Fri, 27 Nov 2026 11:25:28 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm358570565e9.4.2026.11.27.11.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:25:28 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-riscv@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH RFC 1/2] serial: esp32: Enable hardware RTS/CTS flow control
Date: Fri, 27 Nov 2026 19:25:10 +0000
Message-ID: <20261127192514.174468-1-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-11-vitorhg20080@gmail.com>
References: <20261125233020.1380594-11-vitorhg20080@gmail.com>
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

CRTSCTS currently enables receive flow control without programming an
RX FIFO threshold or enabling CTS gating on transmit.

Set a 64-byte RX FIFO threshold using the register layout of each
variant. Enable hardware CTS gating and tell serial core that the
UART handles CTS. Let the FIFO control RTS while RTS is asserted,
and use software control to keep RTS deasserted when requested.

On the Waveshare ESP32-P4-Module-DEV-KIT, UART1 internal loopback
verified that deasserting RTS with CRTSCTS enabled stopped transmission
and reasserting RTS delivered the queued bytes intact. With CRTSCTS
disabled, transmission completed with RTS deasserted.

AI assisted with driver development and the loopback test.
Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
Applies on top of the ESP32-P4 UART RFC through patch 13/19 with the
four UART fixes for patch 10/19 and v2 of patch 12/19 applied.
RFC: https://lore.kernel.org/linux-serial/20261125233020.1380594-1-vitorhg20080@gmail.com/
UART fixes: https://lore.kernel.org/linux-serial/20261127165552.133713-1-vitorhg20080@gmail.com/
TX IRQ v2: https://lore.kernel.org/linux-serial/20261127155623.129706-1-vitorhg20080@gmail.com/

 drivers/tty/serial/esp32_uart.c | 82 +++++++++++++++++++++++++++------
 1 file changed, 68 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/esp32_uart.c b/drivers/tty/serial/esp32_uart.c
index 75f243f..7d58a41 100644
--- a/drivers/tty/serial/esp32_uart.c
+++ b/drivers/tty/serial/esp32_uart.c
@@ -26,6 +26,7 @@
 
 #define ESP32_UART_TX_FIFO_SIZE	127
 #define ESP32_UART_RX_FIFO_SIZE	127
+#define ESP32_UART_RTS_THRESHOLD	64
 #define ESP32_UART_TX_POLLS		1000000
 
 #define UART_FIFO_REG			0x00
@@ -71,8 +72,11 @@
 #define UART_RXFIFO_FULL_THRHD_SHIFT		0
 #define ESP32_UART_TXFIFO_EMPTY_THRHD_SHIFT	8
 #define ESP32S3_UART_TXFIFO_EMPTY_THRHD_SHIFT	10
+#define ESP32_UART_RX_FLOW_THRHD		GENMASK(22, 16)
 #define ESP32_UART_RX_FLOW_EN			BIT(23)
 #define ESP32S3_UART_RX_FLOW_EN			BIT(22)
+#define ESP32S3_UART_MEM_CONF_REG	0x60
+#define ESP32S3_UART_RX_FLOW_THRHD		GENMASK(16, 7)
 #define ESP32S3_UART_CLK_CONF_REG	0x78
 #define ESP32S3_UART_SCLK_DIV_B			GENMASK(5, 0)
 #define ESP32S3_UART_SCLK_DIV_A			GENMASK(11, 6)
@@ -101,10 +105,12 @@
 
 /* ESP32-P4 uses a dedicated register for RX flow control. */
 #define ESP32P4_UART_HWFC_CONF_REG		0x2c
+#define ESP32P4_UART_RX_FLOW_THRHD		GENMASK(7, 0)
 #define ESP32P4_UART_RX_FLOW_EN			BIT(8)
 #define ESP32P4_UART_REG_UPDATE_REG		0x98
 #define ESP32P4_UART_REG_UPDATE			BIT(0)
 #define ESP32P4_UART_LOOPBACK			BIT(12)
+#define ESP32P4_UART_TX_FLOW_EN			BIT(13)
 #define ESP32P4_UART_SW_RTS			BIT(21)
 #define ESP32P4_UART_SW_DTR			BIT(20)
 #define ESP32P4_UART_RTS_INV			BIT(18)
@@ -121,8 +127,11 @@ struct esp32_uart_variant {
 	u32 rxfifo_cnt_mask;
 	u32 txfifo_cnt_mask;
 	u32 txfifo_empty_thrhd_shift;
+	u32 tx_flow_en;
 	u32 rx_flow_reg;
 	u32 rx_flow_en;
+	u32 rx_flow_thresh_reg;
+	u32 rx_flow_thresh_mask;
 	u32 loopback_mask;
 	u32 sw_rts_mask;
 	u32 sw_dtr_reg;
@@ -138,8 +147,11 @@ static const struct esp32_uart_variant esp32_variant = {
 	.rxfifo_cnt_mask = ESP32_UART_RXFIFO_CNT,
 	.txfifo_cnt_mask = ESP32_UART_TXFIFO_CNT,
 	.txfifo_empty_thrhd_shift = ESP32_UART_TXFIFO_EMPTY_THRHD_SHIFT,
+	.tx_flow_en = UART_TX_FLOW_EN,
 	.rx_flow_reg = UART_CONF1_REG,
 	.rx_flow_en = ESP32_UART_RX_FLOW_EN,
+	.rx_flow_thresh_reg = UART_CONF1_REG,
+	.rx_flow_thresh_mask = ESP32_UART_RX_FLOW_THRHD,
 	.type = "ESP32 UART",
 	.loopback_mask = UART_LOOPBACK,
 	.sw_rts_mask = UART_SW_RTS,
@@ -153,8 +165,11 @@ static const struct esp32_uart_variant esp32s3_variant = {
 	.rxfifo_cnt_mask = ESP32S3_UART_RXFIFO_CNT,
 	.txfifo_cnt_mask = ESP32S3_UART_TXFIFO_CNT,
 	.txfifo_empty_thrhd_shift = ESP32S3_UART_TXFIFO_EMPTY_THRHD_SHIFT,
+	.tx_flow_en = UART_TX_FLOW_EN,
 	.rx_flow_reg = UART_CONF1_REG,
 	.rx_flow_en = ESP32S3_UART_RX_FLOW_EN,
+	.rx_flow_thresh_reg = ESP32S3_UART_MEM_CONF_REG,
+	.rx_flow_thresh_mask = ESP32S3_UART_RX_FLOW_THRHD,
 	.type = "ESP32S3 UART",
 	.has_clkconf = true,
 	.loopback_mask = UART_LOOPBACK,
@@ -169,8 +184,11 @@ static const struct esp32_uart_variant esp32p4_variant = {
 	.rxfifo_cnt_mask = ESP32P4_UART_RXFIFO_CNT,
 	.txfifo_cnt_mask = ESP32P4_UART_TXFIFO_CNT,
 	.txfifo_empty_thrhd_shift = ESP32P4_UART_TXFIFO_EMPTY_THRHD_SHIFT,
+	.tx_flow_en = ESP32P4_UART_TX_FLOW_EN,
 	.rx_flow_reg = ESP32P4_UART_HWFC_CONF_REG,
 	.rx_flow_en = ESP32P4_UART_RX_FLOW_EN,
+	.rx_flow_thresh_reg = ESP32P4_UART_HWFC_CONF_REG,
+	.rx_flow_thresh_mask = ESP32P4_UART_RX_FLOW_THRHD,
 	.type = "ESP32-P4 UART",
 	.needs_reg_update = true,
 	.loopback_mask = ESP32P4_UART_LOOPBACK,
@@ -249,16 +267,43 @@ static unsigned int esp32_uart_tx_empty(struct uart_port *port)
 	return esp32_uart_tx_fifo_cnt(port) ? 0 : TIOCSER_TEMT;
 }
 
+static void esp32_uart_set_rx_flow(struct uart_port *port, bool enable)
+{
+	const struct esp32_uart_variant *variant = port_variant(port);
+	u32 flow = esp32_uart_read(port, variant->rx_flow_reg);
+
+	if (enable) {
+		u32 mask = variant->rx_flow_thresh_mask;
+		u32 threshold = field_prep(mask, ESP32_UART_RTS_THRESHOLD);
+		u32 reg = variant->rx_flow_thresh_reg;
+
+		if (reg == variant->rx_flow_reg) {
+			flow = (flow & ~mask) | threshold;
+		} else {
+			u32 val = esp32_uart_read(port, reg);
+
+			esp32_uart_write(port, reg, (val & ~mask) | threshold);
+		}
+		flow |= variant->rx_flow_en;
+	} else {
+		flow &= ~variant->rx_flow_en;
+	}
+
+	esp32_uart_write(port, variant->rx_flow_reg, flow);
+}
+
 static void esp32_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
 {
 	const struct esp32_uart_variant *variant = port_variant(port);
 	bool dtr_in_conf0 = variant->sw_dtr_reg == UART_CONF0_REG;
+	bool hw_flow = port->status & UPSTAT_AUTOCTS;
+	bool rts = mctrl & TIOCM_RTS;
 	u32 conf0, dtr_conf;
 
 	conf0 = esp32_uart_read(port, UART_CONF0_REG);
 	conf0 &= ~(variant->loopback_mask | variant->sw_rts_mask);
 
-	if (mctrl & TIOCM_RTS)
+	if (rts)
 		conf0 |= variant->sw_rts_mask;
 	if (mctrl & TIOCM_LOOP)
 		conf0 |= variant->loopback_mask;
@@ -275,7 +320,14 @@ static void esp32_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
 	else
 		esp32_uart_write(port, variant->sw_dtr_reg, dtr_conf);
 
+	/* Keep RTS deasserted until the FIFO can control it again. */
+	if (hw_flow && rts)
+		esp32_uart_set_rx_flow(port, true);
+
 	esp32_uart_write(port, UART_CONF0_REG, conf0);
+
+	if (hw_flow && !rts)
+		esp32_uart_set_rx_flow(port, false);
 }
 
 static unsigned int esp32_uart_get_mctrl(struct uart_port *port)
@@ -515,16 +567,16 @@ static void esp32_uart_set_termios(struct uart_port *port,
 				   struct ktermios *termios,
 				   const struct ktermios *old)
 {
+	const struct esp32_uart_variant *variant = port_variant(port);
+	bool hw_flow = termios->c_cflag & CRTSCTS;
 	unsigned long flags;
-	u32 conf0, flow;
+	u32 conf0;
 	u32 baud, min_baud, max_baud;
-	const u32 rx_flow_reg = port_variant(port)->rx_flow_reg;
-	const u32 rx_flow_en = port_variant(port)->rx_flow_en;
-	u32 max_div = port_variant(port)->clkdiv_mask;
+	u32 max_div = variant->clkdiv_mask;
 
 	termios->c_cflag &= ~CMSPAR;
 
-	if (port_variant(port)->has_clkconf) {
+	if (variant->has_clkconf) {
 		max_div *= FIELD_MAX(ESP32S3_UART_SCLK_DIV_NUM) + 1;
 		min_baud = DIV_ROUND_UP(port->uartclk, max_div);
 	} else {
@@ -532,17 +584,15 @@ static void esp32_uart_set_termios(struct uart_port *port,
 	}
 
 	max_baud = port->uartclk / 16;
-	if (port_variant(port) == &esp32p4_variant)
+	if (variant == &esp32p4_variant)
 		esp32p4_uart_limit_baud_rate(termios, old, min_baud, max_baud);
 	baud = uart_get_baud_rate(port, termios, old, min_baud, max_baud);
 
 	spin_lock_irqsave(&port->lock, flags);
 
 	conf0 = esp32_uart_read(port, UART_CONF0_REG);
-	conf0 &= ~(UART_PARITY_EN | UART_PARITY | UART_BIT_NUM | UART_STOP_BIT_NUM);
-
-	flow = esp32_uart_read(port, rx_flow_reg);
-	flow &= ~rx_flow_en;
+	conf0 &= ~(UART_PARITY_EN | UART_PARITY | UART_BIT_NUM | UART_STOP_BIT_NUM |
+		   variant->tx_flow_en);
 
 	if (termios->c_cflag & PARENB) {
 		conf0 |= UART_PARITY_EN;
@@ -570,11 +620,15 @@ static void esp32_uart_set_termios(struct uart_port *port,
 	else
 		conf0 |= FIELD_PREP(UART_STOP_BIT_NUM, UART_STOP_BIT_NUM_1);
 
-	if (termios->c_cflag & CRTSCTS)
-		flow |= rx_flow_en;
+	if (hw_flow) {
+		conf0 |= variant->tx_flow_en;
+		port->status |= UPSTAT_AUTOCTS;
+	} else {
+		port->status &= ~UPSTAT_AUTOCTS;
+	}
 
 	esp32_uart_write(port, UART_CONF0_REG, conf0);
-	esp32_uart_write(port, rx_flow_reg, flow);
+	esp32_uart_set_rx_flow(port, hw_flow && (port->mctrl & TIOCM_RTS));
 
 	if (baud) {
 		esp32_uart_set_baud(port, baud);
-- 
2.56.1

