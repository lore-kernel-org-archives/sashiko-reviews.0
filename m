Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794992;
	b=w2yb//kkBODHCYADqzXa4yUYECTc2oPB/rbs1rodQn1qVI+pqtRzNe8tF0SxvDcFVVRN
	 f/bWhOHwCeu1vaQYrF5mrbA4czzx6DcJ6CDwemU6T5SOLgFK75uaprwwYskJSUehsIuXl
	 af+Wgz1CHK9hwLoiZh4bpHUjLcYKZtnfYhJBHhx5hJVlPsdcxQXWIYYtWmJo9Hlm3hqIO
	 nyoHAHBDZlO6rAeFHDUCiIh5j5RgdxpQY2NCvFQujGBzT4gfHmOKCKKRP0VhHkh/Im9ZY
	 fdWH5KPkvRLJfCvu4zAsbZaP54HVYWvEx84/PAjtONyJAJwfrMOWdJsmUpY/aR4fWWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Va7mmJMRyV8C2mf4qXe8YFNGI85O0e3HsmDcruX7rYs=;
	b=X48FyAMe2u0XIf9miJcu82j5/qbrQKpJmGqXs5GgKQHzLwvFee2m5wH1r59YRDPwzdsk
	 5zDpeDPGJiudBAkZjke/A0aHuluT9HIvEZyds1C0vjck48fTmD+M1+d4LYNEFfgYeE0jH
	 MKU7VmfydzZL2npYuYWbT3P1QcUk0e0ZUdUfduqLpR5JG5eiO1IicrVqNgVyYX90lSuTn
	 Hq5G6I14j1xGAb1adtDwJpA2Ar+UkEfgAzBaCOcJIkcnCTS6Tjrk/b6vA5NEoV7n1umQU
	 atM3T1Ny2k+dIygIiJMZ56gyN4RQw/ERaXdcIB8XhBJ8523Y+T+Zsg9cWZw/0c/LnbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDqJXZ1Y;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F7F606A32E
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 15:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29F7F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDqJXZ1Y
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491846221ffso7288189f8f.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 07:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795794989; x=1796399789; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Va7mmJMRyV8C2mf4qXe8YFNGI85O0e3HsmDcruX7rYs=;
        b=IDqJXZ1Y/zDlzxZHwGXSOZlvWQK50QUvD0/8NXY7iT0CFe4hS6gd9TZZXCcNqPcnFz
         b5vc/DeNuPxVPIZ1xs3mhNrOu/EerxA0lnIbAYds55G68i2Tca+YxPiOMJR9kOOSN384
         IctAy1zADGmIPgHU0bPuRL/kQqw5FcWRXSWRwQ2YhNR3PJInloTPcIlDj1/vdH0lZW+0
         OOJbiv8CXPAkl9eZldmOThAh2X3IJqjpGWSxeowQ/IBjcDJidN+/lZ8StIUN4Gs7cQEl
         duA/Tp4tfyW1eBnRLPRz2r5QqT8HR2NHWWlGVzGDTEwOPJnbk/9Rtt54cnGtnh9MfiSD
         ycEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794989; x=1796399789;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Va7mmJMRyV8C2mf4qXe8YFNGI85O0e3HsmDcruX7rYs=;
        b=kidXlqmaUZ6lNknjLG7Pf0Sm62qKUqmvu5Et2heaGT+6OY+j8y4aTOB6CUF/Bvzk3f
         g/KoVDG8VLZArxqSCgJBJdqh05i7ys1R84c+ho+eHSEdnq4tZR554v+wOAnRLMz66TL5
         8DoU+jBph0kr7rCS6eS8q6Ved0ZN9n2+AiaSvKH8HxHzcxqXXKcLaYD+zfowM5JIjhrK
         RVHUFvWiQ8jMTuveHW7b8uSUeNNO7yIsJlGFuribN8jRntIZPAbmB2Ksprvbteprzwlr
         hTJ5XS98cXqzbdooBzPr8wx3Dtd6Y213R8SB9jrdiNSx/MtAuy6KngIR0CZoqavH3g9x
         1Ofw==
X-Forwarded-Encrypted: i=1; AL+hErGHwyIFu/PLx/3gE6PDwaUqQ51qJ5uHFKyDx3TfkT0Ft9qDMeNLSD009CbQ0Dd/3E2xurcBevr6kn3axtIY7DU=@lists.linux.dev
X-Gm-Message-State: APuU4Z/vc9r7qD72PFRnk9ShqZdNy1syiJAwwBW0l9/OU/5eiDzbhjgI
	813pIINfldzMZyUjg3rpUDsLg3VSU2tZ5PFOSZIBAA3AfDgLdG68ogAt
X-Gm-Gg: AZFdTZcQwncZufWgXN69JhrCXRfeL9kGbTIjhAnYBEv3AtNARpyMjdu2t/ObXpQr5Qp
	PkenATu50zYMwldduvGsuVsFDQP3hQWHfhY0km8reKVxp4q4X2T7MYWVVupnqpAcWvvBRENqx9d
	+l8/S/PCxuTBOd7Z7tKjMTm7O2FLyO1pRxfzmDPd3hpXWjdKdrXAWsJFQuSPwMR0CBvCwe4eqXf
	6DR+OVc+VwSSV/O1svnPW1VDhSoe+CoQcedWqRDiYuZl9lJ+oNmH9W6gZZunzLyrKYQsVtmqAEo
	KomNW5HgTrQbyqI+J1+0kbWd4inVh3RUgqqygptgnn1xn2tJv+QW4MyVjOYmkHwpvFKuYvlO3aN
	GKEQfwhz+YtSaFD+jEtJLqRUr5Gej6oUb8tNiFGiOCSQhqP7Hdn7Q/6tgxHtFnjx+YoP1VKMuEV
	UEJ6KE4VK312TSHcjBf94DU2zLvrOK8qFwboOOMvqHcpjtQB9+uPMurXodQl8D0yoooBuPjhDqj
	anE1aTk0CbHNzORhrJLVMl9BvK8SEa+hZx5uBaCAME/mPxqOcqHAZ4z9ijmxcdVzGevnK8LrV2V
	doLygmxngpeUKojopsEe4ixDv2z1ZjTvTotL2JlkoH3WHm44yAYSXaoZX6FfqX9EQ6DUaW4bOhM
	I07pLaVM=
X-Received: by 2002:a5d:64e5:0:b0:4a4:f208:6a37 with SMTP id ffacd0b85a97d-4abb4e642fdmr49567529f8f.42.1795794989438;
        Fri, 27 Nov 2026 07:56:29 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm39382661f8f.35.2026.11.27.07.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:56:29 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-riscv@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH RFC v2] serial: esp32: Rearm TX interrupts when the FIFO is full
Date: Fri, 27 Nov 2026 15:56:23 +0000
Message-ID: <20261127155623.129706-1-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-13-vitorhg20080@gmail.com>
References: <20261125233020.1380594-13-vitorhg20080@gmail.com>
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

When transmission starts with a full FIFO, queued data can be left
waiting with the TX interrupt disabled. Keep the TX FIFO empty
interrupt enabled while a high-priority character is pending or while
transmission can progress on queued data.

Use UART_TX_NOSTOP so the driver controls TX interrupt masking. If a
deferred x_char is sent while normal transmission is stopped, mask the
TX interrupt and leave the queued data for the next start_tx() call.
This prevents repeated TX interrupts while the queue is stopped.

Hold the port lock in the TX interrupt handler as required by the
serial core TX helpers.

A mocked FIFO test verified the deferred x_char case, IRQ masking and
TX restart. Normal serial console operation was tested on the
Waveshare ESP32-P4-Module-DEV-KIT.

AI assisted with driver development.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
Changes in v2:
- Keep TX IRQ masking in the driver and mask the IRQ after sending a
  deferred x_char while TX is stopped.
- Verify the stopped-TX sequence with a mocked FIFO and run a serial
  console regression test on the ESP32-P4.

This replaces patch 12/19 and applies after patches 10 and 11 from v1.
v1: https://lore.kernel.org/linux-serial/20261125233020.1380594-13-vitorhg20080@gmail.com/

 drivers/tty/serial/esp32_uart.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/esp32_uart.c b/drivers/tty/serial/esp32_uart.c
index 304e134..2058bd6 100644
--- a/drivers/tty/serial/esp32_uart.c
+++ b/drivers/tty/serial/esp32_uart.c
@@ -354,25 +354,31 @@ static void esp32_uart_transmit_buffer(struct uart_port *port)
 	unsigned int pending;
 	u8 ch;
 
-	if (tx_fifo_used >= ESP32_UART_TX_FIFO_SIZE)
-		return;
-
-	pending = uart_port_tx_limited(port, ch,
-				       ESP32_UART_TX_FIFO_SIZE - tx_fifo_used,
-				       true, esp32_uart_put_char(port, ch),
-				       ({}));
-	if (pending) {
+	tx_fifo_used = min_t(u32, tx_fifo_used, ESP32_UART_TX_FIFO_SIZE);
+	pending = uart_port_tx_limited_flags(port, ch, UART_TX_NOSTOP,
+					    ESP32_UART_TX_FIFO_SIZE - tx_fifo_used,
+					    true, esp32_uart_put_char(port, ch),
+					    ({}));
+
+	/* Keep TX IRQs enabled while there is sendable data. */
+	if (port->x_char || (pending && !uart_tx_stopped(port))) {
 		u32 int_ena;
 
 		int_ena = esp32_uart_read(port, UART_INT_ENA_REG);
 		int_ena |= UART_TXFIFO_EMPTY_INT;
 		esp32_uart_write(port, UART_INT_ENA_REG, int_ena);
+	} else {
+		esp32_uart_stop_tx(port);
 	}
 }
 
 static void esp32_uart_txint(struct uart_port *port)
 {
+	unsigned long flags;
+
+	uart_port_lock_irqsave(port, &flags);
 	esp32_uart_transmit_buffer(port);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 static irqreturn_t esp32_uart_int(int irq, void *dev_id)
