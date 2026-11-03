Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793684401;
	b=0joMlvCKW7nYDp9UHeRjjo7szyDRAXKy19WwmEGe0ziwXjVdyhvoWJv0/m1gUKLLTNMQ
	 C7IDsa1XTxEp4bxYPI9cI0WHOigxs7DBN51+TWD15JXSGDeSH9860zTc9VCl6CTChSPGb
	 NG9Yt6oJqHbPyk+rpeTgCDQhSug2Xj4WC4Yc87nRSwEnXhapZpCMIwT4kPTsPHXjoOKBF
	 RCPuEdK9eE6tGzX6ST4TUs7+J77D/fwsMTSgSGilGCCS+xT9coaCdBG+yuHMCHcOtySba
	 tjboUwMMpyhOAZf0/h65ENnl1n/b8eOcYN4SYaSu1jy1e30Z4jVi0hENwG/brH+ZNKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793684401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SNfcSVIGEmINCcVw+uB8DPAiuuIIPUqBYgGuYhjglr0=;
	b=ossX/EYTHtKqG8DuUQiHaThRdQcojD+sTjG3prJWDmUG+Bi5s5xMTunnLlCjRVWA6K0M
	 0G3dOP6oW6IXZ/bBbbVYQARrO228Wp5DeOH4uBvMtqRKDD4FEOTgmvhkeR7URQ2I1O1L/
	 0t6ByXXFwRJeKTEdlU8Feb55N05+F2EYC8ZzdgT2AT/AxSAlwfl8eQW/rTfwMlL+p+H4T
	 YaqGScrmCWYiia9iAi7RAPQ2lix88u30kG8tuNG4ZHTgMs6NLeyt57VG8a6zkJ66SDWge
	 9V3vGhZH6uYMxv7zlVMOYHlXGiLQjA3VYTlyYPyuOA7a7nZqRXBpjxWeqU0nSQtR5jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oT6tciyU;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1182606A324
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 05:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1182606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oT6tciyU
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9d7791b00so29819835ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 21:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793684400; x=1794289200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNfcSVIGEmINCcVw+uB8DPAiuuIIPUqBYgGuYhjglr0=;
        b=oT6tciyUpa8ne0OSwZyzbQk3QhrexPpLPOPRSqNaS0V+dxp1C8QfefpQzhtbEjnDke
         93B26auj9ZejAPq9KKnvquTjcaAPszI+aYdZ0EBNmHsT72bbCC2gkDNmnCnumF+6+Epv
         9RQZKVOPwqgY5y9zQ8cQjUvjd/Klwzoc01IAqpoZQa+x4WqgXjk0bwicDtiBblozfd5u
         j7EdIFTwo0bxWLXYEStlyGPn38AfKHhqdY01CSsnfOlYHVxirXPWTQxX73206vRWBL+b
         polTmzvcaS6QZ1bu+Q8j3E2eOrMRJA81448PuysbwAEPbxao+JjTdlmmg9LsVNy+8H6+
         32XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793684400; x=1794289200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNfcSVIGEmINCcVw+uB8DPAiuuIIPUqBYgGuYhjglr0=;
        b=eCppc2ki8B7SUIKt4/+cJX+urjxgKBp6y2nHrQRlAQDnHx2sm86Q5LBIsFasNcA3qo
         4j4k9R6NWxI8LyTf0/hEHk9BlCi7JDFpctfUwy0j4iBuM6rCXLycglumO/SdL0lrKZSN
         2VY6ViOHpSWZJz04eHl8xHyA5BjROlMsTEyLs2NOHkQVMimZEnNI2pcECjlU+W7I77i1
         ukqox88R/JWCMcUCi9rDSFMKJPO7tioPxewf7qQbYjbCUj2AM/jd5HnEYDrs6s5NefoE
         18HLgj6bv/pKfewinl8KqkrHojfzOkG1q9f/6SHTT3rxiDIDDt2KT38LRF6NPdcCCdgI
         kikA==
X-Gm-Message-State: APuU4Z/L4qKfNdV31P3q3GFaVW0kacDb61zv51tQKyxG/TT5urrp20b2
	VkGShzEW1nNNNbUWaPDLq5P6t3G/ZUqJzHAolrS2FRnzvpw/Zm3aJTio/C0r3P2+901TnonFDh2
	+Tw6EpAig
X-Gm-Gg: AYBFou0uN2ldG4NtvHMTANl6WvFKVYj/X59++fb3MOczPdeNRZZ+mr+Zr/QSxCc5HFH
	pwFzt+sFjcGXQR+urvc8Uel6ldX8s1Nr8csCWcqizyQALah3gO3yht1AcRaaB+xgwlWybhR4Vgg
	OsTg9rDfDIodAPOLk2mWxMMt1YcoX2lIwxvL7h/xw1v+HmDycSOvi39MPIJzT5pDCD6Wtlve9MU
	A9yFujbZ2tPu3ijz69TporsxFN7FL1AKOwQRml427QkTkCXU3hXuCkwsHfTgiUo8pgvJnbhTn/T
	3Mq9wYnPObrTqld/KQrenZQ87Rj5VdVz0TErZlIjEXvKShArt/1wD6ns3umYhcBCLpvnoW+hiXC
	bLtsPvK06keVgDLVO5YN1L+RKYj2PqGe63Mm5yoO8xVOnc8U2OPhDgWdde3OaWg0G7ZkOgIqefD
	uswB13i/kVVdtl73/FGHzNhKcNKC94b6ettSWqMfBq53ViQXkRUh29aaZF+saQVmP4QHQQ9BHic
	l+uAkAypGPB5jsEKIVOemyDNNVQKsZcV9+9ft9InAJ4IfOUYGpev9+5WHRYwXOa6l+9lPMz3dqr
	sFcKXXUhiN8o8HbEFSDHoJE/cJ5Q/0sqWTq+35W9QMusChGtCzB/A6uMLWLxNi/NJdR1qR/2lcw
	kIQ8/jmDKv9qTmhTzUQ==
X-Received: by 2002:a17:902:ce05:b0:2dd:ad73:5b6f with SMTP id d9443c01a7336-2eb364b55camr111236385ad.31.1793684400160;
        Mon, 02 Nov 2026 21:40:00 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392494edsm35154505ad.31.2026.11.02.21.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 21:39:58 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: sashiko-reviews@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3 2/2] usb: core: add a pre_probe callback for device drivers that may defer
Date: Tue,  3 Nov 2026 12:39:52 +0700
Message-ID: <20261103053952.1138398-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-194542@kernel.org>
References: <cover.1793669297.git.jjc@jclark.com> <e96b91c85945237ca455869bf4d5a1e177358b54.1793669297.git.jjc@jclark.com> <sashiko-outbox-194542@kernel.org>
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

On Tue, 03 Nov 2026 03:51:41 +0000, sashiko-bot@kernel.org wrote:
> First, when udriver->pre_probe(udev) returns -ENODEV (for example from
> onboard_dev_usbdev_pre_probe() -> _find_onboard_dev()), usb_probe_device()
> still calls usb_autoresume_device(udev) and usb_generic_driver_probe(udev)
> to configure the device, bind all child interface drivers (triggering
> deferred probing), and emit USB_DEVICE_ADD, only to immediately tear them
> all down a few lines later in the error == -ENODEV block via
> usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev).

This is deliberate, and documented in the @pre_probe kerneldoc. An
error from pre_probe() other than -EPROBE_DEFER is handled as if
probe() had returned it, after the generic probe has run. This keeps
the -ENODEV fallback to the generic driver working as it does for
probe(). For onboard_usb_dev nothing changes: its -ENODEV used to come
from probe().

> Second, if udriver->pre_probe(udev) or udriver->probe(udev) fails with any
> other error (such as -EINVAL or -ENOMEM), usb_probe_device() jumps to
> err_pre_probe, which only calls udriver->disconnect(udev) and does not call
> usb_generic_driver_disconnect(udev) or usb_autosuspend_device(udev) to
> unwind the generic probe and runtime PM state. Because really_probe()
> clears udev->dev.driver to NULL when usb_probe_device() fails:
>
> - When udev is later unplugged, usb_disconnect() -> device_del() skips
>   usb_unbind_device() because udev->dev.driver is NULL, so
>   usb_notify_remove_device() (USB_DEVICE_REMOVE) is never sent. Subscribers
>   such as usbport_trig_notify() in drivers/usb/core/ledtrig-usbport.c never
>   remove the port entries added on USB_DEVICE_ADD, leaking struct
>   usbport_trig_port objects and sysfs attributes with a dangling port->hub
>   pointer to the freed struct usb_device, and usbdev_notify() in
>   drivers/usb/core/devio.c never runs usbdev_remove().

This was raised in Sashiko's review of v2. I missed that it can be fixed
when the device is unplugged. I will attempt to fix this in v4. I think
it can be fixed by recording in struct usb_device that USB_DEVICE_ADD
has been sent, and having usb_disconnect() send USB_DEVICE_REMOVE for a
device that has no driver.

> - For drivers with supports_autosuspend = 1 (such as
>   onboard_dev_usbdev_driver), usb_probe_device() does not take a runtime PM
>   reference, and hub_configure() enables autosuspend on hub devices; once
>   the device suspends, usb_resume_device() fails with -ENOTCONN because
>   udev->dev.driver is NULL.

This is a pre-existing bug that is new in this review.
usb_suspend_device() does a generic suspend for a device without a
driver, but usb_resume_device() refuses to resume one. I don't know
why resume is refused. If a generic resume is safe there, that would
fix it.

> Third, if udriver->pre_probe(udev) succeeds and udriver->probe(udev) then
> returns -ENODEV, the error == -ENODEV block runs
> usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev) before
> err_pre_probe calls udriver->disconnect(udev), reversing the teardown order
> used in usb_unbind_device():

I will fix this in v4.

James
