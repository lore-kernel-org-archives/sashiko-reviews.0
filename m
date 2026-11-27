Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798572;
	b=rjQ/mzI77Y3lQpgXnP/TXfGCVyhQqkBEcvGKZYa2UNaGB0vdutf+iIsqhhgrBJO40B7e
	 fUD5L01cjOfYzFyS9KcwDs4/jLtEY10k+1AhZkagmXI5daJmBoelMAwH6rmTfQM1aT3PV
	 0YF29A5EeLGUPKF50lPcd0kwBwPzlD+dWs9rbP1S5tCb5T2r2qggtMDEByig15HbLUfY7
	 GQhbsJGFAt05tDRRWsx565Zq1rlCAuG0uLEXSmYteqz+9DBXsFMYSB5wWLpiOUjISdV4t
	 AZGq8DUJ/Guf4ipf3UBNiTNQDHUWGu+BDaH09Djx5LPM+xE0+HTSjl7wZ248zW3p4wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ipkmKJKWGNB6mDs2u9bY6uizcIe+dVA2X22JdmXX2qw=;
	b=Sr2h9CmlnH7Pscn6P43Ru4xveFLmar1qPW91ceeopxPXWXC72/vfZf987axhn1PZWgX9
	 GFGqkW+r5NOPTPJPHfviCcOV7Z2dL0PbCIuGpYxc+r5Wj0ropEjK6idNAfqFSThO5m+7R
	 0ROdxP9BsHO0Sdy1CaSmkT5o1mzNiLxtPJmUImXQfjO0+YxoU6/NvxBqaS7PiSBuRoDbu
	 mivmysGk3i+3BnlYyRD6BFdAJ+s9nRQu1VMOioOprXAzEdzIjMYeS/PGYWP1AK4iLySt4
	 397GpmLSTwwAGj3n/ZcVZ7bih2eXGr+EeB2sVvTDRlpr6QJTZfiyGg8vIhWljq/O+kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyaf9rdO;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD10F606A331
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 16:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD10F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyaf9rdO
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-497614c95f0so4755827f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 08:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798570; x=1796403370; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ipkmKJKWGNB6mDs2u9bY6uizcIe+dVA2X22JdmXX2qw=;
        b=xyaf9rdOkR8LVg4nBmyBm3H8jELSzcL56MRJNY3lZp+4RQiVnFNiB8FrIY8UONCDM9
         O7FHeMhVlINALqL6ibIyZkV+/5CwQRWsd4KRiMwrv+Fmc+Vd6LmpzqXsU5CiWasD4nfS
         e/XydrGRGlHKkNq2if883ROHMICzWpkEuUbUMZioyHX1s3w2GECgAp3zT4K7P+0j54v1
         OhXzAWe1rjvg7FOswnQ/af0QCI40GhXKfhLbRL9lwhH5uxfTU+tm7ITKGJp+OmrunrUd
         3qzFPF8qIC4ymy3g2TBbyYwp0HMPWuPtsg7PmrpEXgeDkOwAtDaEbYmoazlUo+mEvP9e
         Jk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798570; x=1796403370;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipkmKJKWGNB6mDs2u9bY6uizcIe+dVA2X22JdmXX2qw=;
        b=lZfMoUE/Geb1Nrxd1EM5JMTupAigG1NGeNjsHM3AfwXFuJ6nBErIvk//8w2LfRuP9l
         yULDU0jzDoezbHouaSMvka8DQkX8VBYWJvdaUMDi742Wrloc4Vk21xVTULRrnBuP6Lqz
         Md6U/q/O3evct7Qzzx58K6Cf6QRXp3MMKZl4/bnfBxT4GcS9k2yRv0Rh10O0R4LF4EpQ
         /PZiItBS4MsBaesJYIiN6NqiemryAu7hl4S1JDWQnRiukZWmNWl7mWMpblPQfWkGaxDc
         U00tEaKRa0gQpJAFuyxXd3qDKL2TxnoiHHKVdnZKHnrN/UJJBpFA7BfQ1hK2mrhuxIA3
         8+Ug==
X-Forwarded-Encrypted: i=1; AL+hErFpyvrQVif4+85fVeB4mYGw1CO4wZ9y/ezMJfNazh4YeA4CPcV+1RIWE/xj3+DcebYe1K3PQSw+au+oY3docfU=@lists.linux.dev
X-Gm-Message-State: APuU4Z9cLGunUfkN885565Vv5PU91BYRKu/pGrmMXD/MKL06hsMXj58l
	YTr/Cy0YGpkMCtb7mv7O5/QTQB3bMCkc/dlK0rhZoK/gbxHGGivnk75tjiZ4KvilGjk=
X-Gm-Gg: AZFdTZdHhS06dZ9cNhXqq7QFOdPV3lCrGJtJ0jM1lzvCOuNwojQWRL7pGBxuC7LqnnB
	bBZYTzQqIWHEJzKfv1DiSId9dafXg4cCMlsyM3DttazJF4aMdHYefsxiabE2oamwTDwVpZIqQdW
	wqKgEsziRoGRqFiIUJVnwroxoqRfosv0RAbKa8P8gOZywTET2VWBCQQn01QLhZid8PtEe92/F/5
	SwN9Mhbiypmn0sGosGew5Br/fMRqizCQrzmThOKT9dIps9x4+KM/X8CWXlo6RDiNbBk3DnmH+/m
	hW38qb/2H6GPn7+7HWvuUg3b/GQryxK92E2exc0L3gO3XxX77kcWYaCNXHjFsrrgHVVRiDtpIRR
	eK/HZyA4sqEdudTgQbhkvqQZtsMdqon5sUSwYBCozyqyEAwrqCOa3BdccAmNiRCuTbd0oC1Q+18
	HMAxqcsWbN+9NfnAZplt7QKEto8gdVOMjntWnhc4YR0tBZcBSYXAzIYIPTAttM++Vx6ooPrwrfe
	4NDlqh4UblfXzANaj70qOti/Ov5wPxnnatzvXS5aSAiOk8wWWc6hUQhmXyUy5jzUTFCViKtrFBs
	LPmL/z6ZysaHJmYpsJHsh438IZd0xiSyncbRK6cnHw7ewE/GoeLhHvghXDFuyqNEpbIIq0xAmMU
	3uRYAhjc=
X-Received: by 2002:a05:600d:6510:10b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb8881de57mr352984235e9.26.1795798570113;
        Fri, 27 Nov 2026 08:56:10 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm979838655e9.11.2026.11.27.08.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:56:09 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-riscv@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH RFC 3/4] serial: esp32: Deliver and mask receive break interrupts
Date: Fri, 27 Nov 2026 16:55:51 +0000
Message-ID: <20261127165552.133713-3-vitorhg20080@gmail.com>
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

Pass a hardware break to the TTY layer when uart_handle_break()
leaves it unhandled. This lets the line discipline apply the break
handling configured in termios.

Mask the break interrupt together with the RX FIFO interrupt in
stop_rx() so a break cannot restart receive handling. Leave the TX
interrupt mask unchanged.

A mocked interrupt test verified break delivery, handling by the
serial core and the resulting interrupt enable mask.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 drivers/tty/serial/esp32_uart.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/esp32_uart.c b/drivers/tty/serial/esp32_uart.c
index 0e7128a..40acff7 100644
--- a/drivers/tty/serial/esp32_uart.c
+++ b/drivers/tty/serial/esp32_uart.c
@@ -317,7 +317,8 @@ static void esp32_uart_rxint(struct uart_port *port)
 		    (esp32_uart_read(port, UART_INT_ST_REG) & UART_BRK_DET_INT)) {
 			esp32_uart_write(port, UART_INT_CLR_REG, UART_BRK_DET_INT);
 			++port->icount.brk;
-			uart_handle_break(port);
+			if (!uart_handle_break(port))
+				tty_insert_flip_char(tty_port, 0, TTY_BREAK);
 		} else {
 			if (uart_handle_sysrq_char(port, (unsigned char)rx))
 				continue;
@@ -403,7 +404,7 @@ static void esp32_uart_stop_rx(struct uart_port *port)
 	u32 int_ena;
 
 	int_ena = esp32_uart_read(port, UART_INT_ENA_REG);
-	int_ena &= ~UART_RXFIFO_FULL_INT;
+	int_ena &= ~(UART_RXFIFO_FULL_INT | UART_BRK_DET_INT);
 	esp32_uart_write(port, UART_INT_ENA_REG, int_ena);
 }
 
