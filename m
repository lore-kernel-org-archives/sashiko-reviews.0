Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035432;
	b=MKl3I/bhaFhx0gFz0dxKjNn3c6kgGf/u1hhckrFFt5J03zkcf+/CEztlrpcLZP6eStw5
	 HsyCo0dRz8gxYv0D8kZLop1fUmerw1XW6bo9j+FP/82m4JjTbjyfCQ0hnL6g3aXW+QKKE
	 bmpOlzl+0G+hIQnBxV+N8rno7f/YXaCHElaXrZTjVC3FhnBo5lXXAgthYIPuRDffRmIG9
	 c+y1vtZLTve3GOH0qVv6VCe3MTZmCXj43J+fnwdKYDqBfGCxES93bfDURk0uyHmInE+Yw
	 fKjgHQxi/zpQHd5iuEYO4WMMHoOh3x8DoImnrTrsNdgNVBde7sAIgE71w9SvU8ImfUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lwp8t8LUVYUpnfQ5EdPfzGcZvgUEwhtKxs66E4lRwbI=;
	b=IHM6W5kPeCi8T/A8g5BMXWDkHEFtsULJXyRr0fwesSntzcy9xUBx5mqQILTuyS/cUQck
	 V0ogdTMW1zVEE9GGpdEI69ERqYkRbsCU4jk5auKmpZMgpKmiaJ8ldZqaKtxSY1jV/xtxp
	 mThWtfuGocWqdw6H6cSdDS/5arGid9sAMmLc9L09Hwg4KolroWuG25OrPe6EbdX1/9dwf
	 375VoPr0DA6SutqyfjjnE8qwKxacHAD5ikmwfVIBr0W0mNKC1tyVY7Ag4x82WPRK3zyMM
	 30gqknas5mKWbaFHRUTybwC3W6QTiertF3sjS1Vp68acmd+OD+2L84KuL2EbGxzviAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygPfm94B;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679B4606A32C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 20:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 679B4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygPfm94B
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso14898925e9.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 12:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035431; x=1795640231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lwp8t8LUVYUpnfQ5EdPfzGcZvgUEwhtKxs66E4lRwbI=;
        b=ygPfm94BdpaEDkVb2uMrtWzm7ifwdh9vyBChsxdN/lH2rMR8Mxrcdq8FcyzuASoypH
         0A3Iluq4bb8ddvqjFTMWw/i4WBPPM6omr14suCfO3OA2NVlRM6YUQ2Wd2UrBNSmOwuOj
         vrmlZkUrGRGRCXijkhHhviJHl260XvKQhoCT5DlnMXGctIAYJN9vJSF+ga8J9uEJtgWj
         Dz6aD0BPk0z4FHFjKSneZeSoQYChup5iVFQx4sKGpE8QPEwUaUPdiwm6th1S9MwCsJn/
         5cLRmJOib3uKsVmbqL2bQtkQWuAFaJVJGBkOY5yD+VMBzy2VcpelN1P5WFuWYz6d9/1W
         e/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035431; x=1795640231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lwp8t8LUVYUpnfQ5EdPfzGcZvgUEwhtKxs66E4lRwbI=;
        b=wIFH1sQJgjbMCmJ4gUw94zAj59KNJOCdYwRkAfy01f9FDhjWjitnbTu2fYVCus4vDU
         jm8nZO3in7q36ZZIrTeY7a4EgW7Huxi9i4i0XYNcoULJhZvW4ocwY5NIGPjTWyMmIJYc
         vSzQoKnPL5Jl75xU7vwwn0GfV9KzCZ0p9NyC1nBB3ndnZfqBTJ3/xXTXocYg0p3sOnej
         kZMP+f/ulYFkM8uBnnLR/dZf4kuGUrKxTvCWQjghLxHlrV3weAAfj6umH9qDi0eObft+
         y4/3KvdM8O9wNwOcHY5Oh8ltLWW+nNASW38WhXzmxGq8oc2RGu9YQ3e+Qaj6e64swQIf
         loNA==
X-Gm-Message-State: APuU4Z+JNsnh+0EQY9bHoqN/fTsPADgBusDGmEQiFbtzDlJWL2UXOJ9J
	IHgaN6AZiu0QaU2LVx1t5sfTu+DbEEgP+bn1Ac732z1ynLv4EDyxJPCJI4j52uoX
X-Gm-Gg: AYBFou34qiUDT11a3YGRjUpTHRl4HqAE+leyMtxfNAHHrKNZkCLAE3ScApZlgz1Vlnf
	G8jWr2iTtb1ky0jog+watig6H7g5xbKRqTT13LvTd0FV5rXQ2xK1cx/nSE+oomJSNJd1Ygc9sZG
	zk3ZaBO16ZZwwpJ6OuV3NXwA2cWIyKMGO6vG09bPCPb5V++nCKaP86gSjX23YUlTmykZXrfttJt
	N4AqxK7y2uiCLKvmraR5E8aKmAzP5hCaW/I/6Swwgw+4Vcw2kqz6SjjGHRrG8B0S3EucPhXHFVo
	qOOOUI49hebOfc2IM0UySe6OVDpxFLz36+5xTlOaVBGivC5GGLmHUC8/CCQamJ06kWhUvj5O5ME
	UEbQEOVVuiER6GT2lBjzqNofaG3+T/J3x3El04aQo8+UDS+bAn33W+MxoN26o9+2JifMNNDwH/L
	ynCNdWXlR3M8Y6RJGnlE4IqE45jo+NEwXn+3fkng9/JIEYGfxVS0p0IMxfhY9mQSvejQoXnjAat
	/kBN5erW85F+/cBAIeDsrn6VPDJJXBwJPewh2X7uagZGZ2MOIzvFocDFtvLMGRofATRqdNSe1EC
	1+Jq1BfiTXq0+ORI7rG6vQ661qyR
X-Received: by 2002:a05:600c:1c03:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4bb7da1392emr80734155e9.9.1795035430450;
        Wed, 18 Nov 2026 12:57:10 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7e577acfsm46582705e9.1.2026.11.18.12.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:57:10 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Michael Zaidman <michael.zaidman@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	dmitry.torokhov@gmail.com
Subject: Re: [PATCH v4 02/16] HID: ft260: uart: fix serial driver
Date: Wed, 18 Nov 2026 22:56:59 +0200
Message-ID: <20261118205703.49167-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-219657@kernel.org>
References: <sashiko-outbox-219657@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 17, 2026 at 08:49:47PM +0000, sashiko-bot@kernel.org wrote:
> Can taking port->xmit_fifo_lock with plain spin_lock() deadlock against
> ft260_uart_write()?

Thanks, that is a real deadlock. kfifo_in_spinlocked() and
kfifo_out_spinlocked() take the lock with spin_lock_irqsave(), and the
other users of xmit_fifo_lock must do the same. In v5, patch 2 uses
spin_lock_irqsave() in all of them.

> Can ft260_uart_write_room() and ft260_uart_chars_in_buffer() race with
> kfifo_reset() and return a bogus count?

Right, kfifo_reset() writes in and out with two stores. A reader
without the lock can see one old and one new value. In v5 both
functions read the FIFO under xmit_fifo_lock, as uart_write_room() and
uart_chars_in_buffer() do in serial_core.

> Does removing ft260_uart_change_speed() from ft260_uart_port_activate()
> leave tty->termios out of sync with the hardware across an unplug and
> replug?

Yes, it's correct. v5 sets TTY_DRIVER_RESET_SAVED_TERMIOS in
tty_alloc_driver(), as you propose.

> Can publishing dev in ft260_uart_add_port() before
> tty_port_register_device_attr() allow a concurrent open to reach
> tty_init_dev() before driver->ports[dev->index] is updated?

It can. tty_kopen_exclusive() and tty_kopen_shared() find the driver
by dev_t and do not need the cdev. They can open the minor in that
window. I will take both of your proposals in v5: ft260_uart_install()
uses tty_port_install(), and ft260_uart_probe() makes the port visible
to ft260_uart_install() only after the chip is configured, just before
tty_port_register_device_attr().
