Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798565;
	b=ASxtSovSOmNH2k0l6IjETM2onrpWcpgZyL6pQ7Fz2TnSVmYkJOud5TdA42CYYRGV9uIo
	 J8QPmZX/0lHU28UW0G9e7RnU0vE01PXHICenMPd+q3OFPhp514odlLZvltkQ2SrGSzLMO
	 bwPW0rf++BuzY2c3mJimlvV+yxzQDrHK/0ADv6ht8MFn68WYgoJOk0oZet0z0yUFb4ZLR
	 9fQxn135bqbGbw+6C3Bp3XXWZ3n/Vz+j7qeRM0DlGYeDrMNgFch2SrCLSNWQL2KqAhGT6
	 sE4U5IbnkqByCa6m7NR+r7A6gVck9bpl0a9Ksg1yTNBd14d9SISrwTilV12UmfeKzew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0Qk+C52F/WT5bFnsjK29OcxfCcFJJ39L41GGvCZ8GDo=;
	b=TfqS1bmz7tOYWYIR5fAQT+VfZGfs01x9DT+chK3fmzcoeO7h4KJQ56fX6FKnJwUV9e52
	 mkvV067L+zJ+4oVChCAWWKYkqeMTfftJiRbSEZWbjAbMUE6JSrGHs/tI+vXnWPQmFQjM6
	 sCexVO6ag4m7+7d01keI3qY5Bclh3JFn3/AQ+XiJJGoqgJ8Yd98RGaqXGnAC5TxSIJpGf
	 3KMKohTVJoJbmc83eAy1KOE2OHx5XtA3Kgc607d2k5DZ2dTCVm92Z5uFkagQnTtduyVkr
	 /YtoFCtfIN3ucrxCjqET+ojPTSDI2N1ytgkxF3dM6CWtjFdpaPx2iYsf6JyaSerH7pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fEEncees;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46290606A31E
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 16:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46290606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fEEncees
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so48745705e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 08:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798563; x=1796403363; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Qk+C52F/WT5bFnsjK29OcxfCcFJJ39L41GGvCZ8GDo=;
        b=fEEnceesE1U/McmHpE5qI6qyw59kSIhWenV741K2DosHcT06dDm5PmqmWsBZ3NLxPM
         YdAdUfUwT6SEWvkr3u7NJf0YV9ItF5c0YpNclrGcuo2BURhuG/dB45f1wqGpAAMdF8q9
         ySrAbEyr0+HwKFji2KRNupIIO5966uWks6zohK1JLp7kLhoYWe38jk5MpjtDHOGLv5ax
         MASqQWLNLZaoVj71FRnmpkK9yh/yKxcQKsXnxipBVxoQgmI0u3mRBcQ1nbZ+XsDS9z7W
         BdS0jkmG/cl8QA4oIviJzNK+vKmHp2sJeuEgtK2NPEr/rU4dJfE4MVdEA0f/sAd00LHe
         QLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798563; x=1796403363;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Qk+C52F/WT5bFnsjK29OcxfCcFJJ39L41GGvCZ8GDo=;
        b=udnFaxXfZNgIu7T7Ek1rV2h9mZqyupruUgMmmIs0LeqnYTd72zL0sVCDEqtOtDk5ve
         n/Co0Br8TA5bXlnaM4quAv+FJutxTWIF1v6n2Ne4sQt4PcL94iCXNgIJykGc3rXOwwhi
         RFXbLjwS0Bu5e0S0zjnhjro0LJv2xEiS1o2UYEcX/1xRRp6JLid/lvFz4E2KxTvc4CrG
         1JSDztKBYLTc9dFR8uFKbxJN8dC00a4QbKpX3hXN3FAry9C+pBAhWZAMoobtPRZa8WrI
         RXNJTPahZUwRQVMDjOCXyb3LFyr880EFP/qUcoHNAUqTyIDLJ4W42vwK7h4GD8AQ4Isb
         T50A==
X-Forwarded-Encrypted: i=1; AL+hErHLS1W/hhrv5RZ0oyMHOt2XMDdsGTqq3ove1ZHSqxhyK/UpXu1V+QKj4K8/A9i6ddBd2zbnWrukNTlFOLmTLGM=@lists.linux.dev
X-Gm-Message-State: APuU4Z8rtCsQdLZ3C17wsH+OBLOtkobj93RAMvlP/UMIvAkhgmUt9SgW
	y1Q7LsVv6nhxp4cNLh6nhYjVjYp/r85moBWEHJ+Z+rtmu1FM24rgdKtrQRBk97X7F8A=
X-Gm-Gg: AZFdTZecw8Mnb8+ehiXPpM9jEyjkI6/7yrjeuUaM52cRwapaNA1Z10G0+xJ5LOjBwYZ
	Y0cvth17vGYbGKqXghziST/X0s9LF8gUamUS2xlADmoo5wW/IAFkCL7ohDfltBCZzUqmUum0QpM
	CVq+hTOLDTQ3V7jO0TDOt3DSAepwpLhXg9HVkEAvizTugmQuq8LApD2JvxHKj9mD4UxlSXVX9iB
	EG/TnY2ReoG/qAUT7Ht5wPafp/gYNkd+kCUQ1is42ud9SlgkCjSH+BRjJ+ugVCcvqgKsOGxh6pB
	qfRQ7b1HcQd5RomqJP4+J6+f7jEbYgQVJuSi/iD0Nd3FbIV+et3huz+sgne5jM8vDjPWvI4Vs3U
	2vLe3Bt/6wYms28trw2oBm7HRURRCxzY+7SrvmKOHPeW65bWiFg84MnUlQEZbNG0JNOQBX9EOKE
	XJv/460AktU+JSHzBySFZ1Un7GnyraFyydx/YNHeY8/Vv3JqQZoTJHezUCuphezBmiGmk5RHgdo
	cQeW5lNp5L5WzRlfOFKGststcfUuiBwPCof2g2dNRlE0pLmNlrYePKjPFGzxsMoUsRLRbYBzaSD
	TEs4YNpIcW7oWGHwa2P+MNrEOvhr3j00uD2+wIO6vgUt41HY13S7iGEAkto3R7DFQ3C7khDySuF
	+nS7Qeo/iSe3tN3HCw46rW1SIMlRp
X-Received: by 2002:a05:600c:a55:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4bb889234a7mr473209425e9.16.1795798563314;
        Fri, 27 Nov 2026 08:56:03 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm733858735e9.3.2026.11.27.08.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:56:03 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-riscv@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH RFC 1/4] serial: esp32: Validate the baud rate before programming the UART
Date: Fri, 27 Nov 2026 16:55:49 +0000
Message-ID: <20261127165552.133713-1-vitorhg20080@gmail.com>
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

Early console setup can reach esp32_uart_set_baud() with no baud rate
or clock rate. Reject rates that cannot produce a valid divider
before dividing or writing the UART registers. Early console output
can continue with the firmware configuration in this case.

A mocked register test verified that a zero baud or clock rate leaves
the registers untouched.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
This series addresses five findings from the review of patch 10/19
and applies after patch 11/19 of the ESP32-P4 RFC.

 drivers/tty/serial/esp32_uart.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/esp32_uart.c b/drivers/tty/serial/esp32_uart.c
index 304e134..895d0ec 100644
--- a/drivers/tty/serial/esp32_uart.c
+++ b/drivers/tty/serial/esp32_uart.c
@@ -448,7 +448,12 @@ static void esp32_uart_shutdown(struct uart_port *port)
 static bool esp32_uart_set_baud(struct uart_port *port, u32 baud)
 {
 	u32 sclk = port->uartclk;
-	u32 div = sclk / baud;
+	u32 div;
+
+	if (!baud || baud > sclk)
+		return false;
+
+	div = sclk / baud;
 
 	if (port_variant(port)->has_clkconf) {
 		u32 sclk_div = div / port_variant(port)->clkdiv_mask;
