Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910721;
	b=IwiVvJa4OILUgrXLJ+quNqFLmYHFXJz4lehi0lKZxx+vzB6QJYJtPCwoMNgrKdr+bzpY
	 3stAZ18RW1cPotnNjc5DYyaC738QynkZES9JelNDcZ1azwEUJf12nhYWCMTBSFl38t2+R
	 C2t3MGzRlBVz1dTKZCBsQjl57Ldmon4A+hZZOmojgSKqbU3filqMsXR+H2otFCJW+rEiq
	 7Ivxoar9/DqHLsn6/2DD3znVlQwYLIqMnocmFI2eQZcJ9v1sbmKasp8fN43yREriPD5Lz
	 bqqiD5nYSUivK4i8Q0T0yI1MjD9L2shBGxY5OAxEPaA1JhnSnjHK1GVv8S4JyRX7RCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=naL9ZYlGHpjK154MUN/eO3m7g6+A6qo1lAhYSkBJyWI=;
	b=guR88IdmWJuMR5cohy8HRAfkW4molELxZLrpGdYkNlk1ETTG7IM6cFHApMu/Oz90ReBr
	 hwNqQdz75PfL9g/ZpNDWBpEtK6P8plCaFmM8+RMpO91UVQFwTNAV1+l11PyST1jsHduwg
	 FPfGkRYNnY82wXa9Owom3gUdxzQicG6bb0YI3CEipHwKm/sG1y5xsRPuOQyMxxCjy+eJ4
	 y5cRRP9xdGHW/xdnHWa4I3vVASlshyYTiYLDJoPnGEvWUJFZGvt/jVjo0Vu3UxF7sWS4P
	 0CmhzPB8w6APzoN7Zlj22/uSJGamDXybGL6o1OyfzGt/JVvBDeYcQLfzE+L+YVaTvEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ddgdhJSf;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6438606A32D
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 20:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6438606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ddgdhJSf
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53fdd2fb171so24601331cf.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 12:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793910720; x=1794515520; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=naL9ZYlGHpjK154MUN/eO3m7g6+A6qo1lAhYSkBJyWI=;
        b=ddgdhJSfMJ3k6FN+WajeMxUgJEqq9iCq25ctKuLeZ9dn91x4SeI7rRgQAME/jDy/ja
         OnX2Iu/3fNCSEHrIHE8YfZMgmxuQk/SIrYTdLIFPs+eMFBZHGIhGs9+6syvzPlqNa+Xm
         reUPyuTICDU8yfcV5MtB5YyMRicsK5n/3slsj0yL40bL/LAFgpUI4KaPV7Lo1fAxdpAS
         LwTqvAr36iBm7UOvyhUmySYY4SLZoQ6w828n4tm0pNbfEd4BuANaxrSn9zqLoTuuS4in
         AYnyBmsmwjV/GhGrppnQvAWelW3bQ6t7UivZbirTrdOPYfaau552llqUx4A2vnZDxcuW
         t7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910720; x=1794515520;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=naL9ZYlGHpjK154MUN/eO3m7g6+A6qo1lAhYSkBJyWI=;
        b=Vb2crxgRvvJ9OdCrr3NTQK7X6IErJ6igZKDVTH606hzIbXTXyC5/OTahXH4QvyeMpf
         lphXmTcJIxv4Y54j7sAKGrwpEUz1KuZ3R3pj5Zr/2mQ0sRiHSzQ63cuUKVWW0TcwkXNd
         Tz/aDuaRqV3sitBZAE1As7FWFslzKzhbt/A0VSi19L1TE4azKMVy6XuFoV6rP29LTok1
         DddeB/JjynKSuqIwssbtZAcutY+U7lPf+GVDMMClPYogpQz/F+HP3F20/Sfqe5OVv/D6
         a28b5VnxF4+OQSHRaUtrUHAU25snY5rnc7oevq5/Qo7dUVMwoJirxIIfLF82tgdXj0c+
         LT0w==
X-Gm-Message-State: APuU4Z+a9CIof5cY+wjwejxoQb3s2sOSTUMPrkBp6PFP0v40H3VWtTKt
	eHQdPn3Y6uPv+37mmeRzkzLlz/C3Sw9tKGMjjrX0edIR9tQKlJ4MiYwu7M6BzA/r2g==
X-Gm-Gg: AYBFou25vJILY3XDmeC1Tlcjz5cNitQEgl3tNEmlHe69Nrr2CeTKHPG2Rp1NymFu5v8
	iXaeZkvoym441hVI6w5cdfOpDISsFayilXRVuM8vJiyBQ/Wgj1v1Btp/e67ptgKfWsE/+pnJO/u
	IjE0fzkGOWWIVFmbyYkR35zooA5ozr+LK6JF2hSULgWk0zFbsblg40rrWyncxFC4YPQYzRsCK8Y
	is4SDo2QH/vxXpxobfVEZgMq8ZGWDWwtmawdEipgenj9Re8JdmC8K+iwZTG5fEv4+Zx2QoWsDQH
	gd+6G9Da8rmQtD7OWZ7BbcDnnKIxEKHIbkSN6hIkrq1tMSymN7G1DRPQYXANA5zdocdPur0ZIYS
	Oz/42MpHeEHuP0IZeVNTEn4x21ii8sw8Gp9EqV5ALAxkBFFZSmdUJdcfYh/LKQaC9+jul5NXGhd
	61PBOlDUG6KR5BLQj8SawDjrBh2vqDIYny0s5zFlxtBUXss4SSvcwtV8OyREh1pacA2Sk41pJcE
	ALZGHoTYn3AfLer6zVoi8tPnEm/FR2ZehgvE9il1K1SaeVjWYPdk5dtslNXgz91nT9qpGIxc9Yv
	cYFA9BoGlfjEo6tFgYr3safn106E
X-Received: by 2002:a05:622a:5a18:b0:535:85c0:fda2 with SMTP id d75a77b69052e-54e100e5826mr8821511cf.11.1793910719615;
        Thu, 05 Nov 2026 12:31:59 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a870dcsm3921886d6.30.2026.11.05.12.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:31:58 -0800 (PST)
Date: Thu, 5 Nov 2026 15:31:56 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: James Clark <jjc@jclark.com>
Cc: sashiko-reviews@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3 2/2] usb: core: add a pre_probe callback for device
 drivers that may defer
Message-ID: <a0918852-57e6-42b3-9321-38d766a20025@rowland.harvard.edu>
References: <cover.1793669297.git.jjc@jclark.com>
 <e96b91c85945237ca455869bf4d5a1e177358b54.1793669297.git.jjc@jclark.com>
 <sashiko-outbox-194542@kernel.org>
 <20261103053952.1138398-1-jjc@jclark.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103053952.1138398-1-jjc@jclark.com>

On Tue, Nov 03, 2026 at 12:39:52PM +0700, James Clark wrote:
> On Tue, 03 Nov 2026 03:51:41 +0000, sashiko-bot@kernel.org wrote:
> > First, when udriver->pre_probe(udev) returns -ENODEV (for example from
> > onboard_dev_usbdev_pre_probe() -> _find_onboard_dev()), usb_probe_device()
> > still calls usb_autoresume_device(udev) and usb_generic_driver_probe(udev)
> > to configure the device, bind all child interface drivers (triggering
> > deferred probing), and emit USB_DEVICE_ADD, only to immediately tear them
> > all down a few lines later in the error == -ENODEV block via
> > usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev).
> 
> This is deliberate, and documented in the @pre_probe kerneldoc. An
> error from pre_probe() other than -EPROBE_DEFER is handled as if
> probe() had returned it, after the generic probe has run. This keeps
> the -ENODEV fallback to the generic driver working as it does for
> probe(). For onboard_usb_dev nothing changes: its -ENODEV used to come
> from probe().
> 
> > Second, if udriver->pre_probe(udev) or udriver->probe(udev) fails with any
> > other error (such as -EINVAL or -ENOMEM), usb_probe_device() jumps to
> > err_pre_probe, which only calls udriver->disconnect(udev) and does not call
> > usb_generic_driver_disconnect(udev) or usb_autosuspend_device(udev) to
> > unwind the generic probe and runtime PM state. Because really_probe()
> > clears udev->dev.driver to NULL when usb_probe_device() fails:
> >
> > - When udev is later unplugged, usb_disconnect() -> device_del() skips
> >   usb_unbind_device() because udev->dev.driver is NULL, so
> >   usb_notify_remove_device() (USB_DEVICE_REMOVE) is never sent. Subscribers
> >   such as usbport_trig_notify() in drivers/usb/core/ledtrig-usbport.c never
> >   remove the port entries added on USB_DEVICE_ADD, leaking struct
> >   usbport_trig_port objects and sysfs attributes with a dangling port->hub
> >   pointer to the freed struct usb_device, and usbdev_notify() in
> >   drivers/usb/core/devio.c never runs usbdev_remove().
> 
> This was raised in Sashiko's review of v2. I missed that it can be fixed
> when the device is unplugged. I will attempt to fix this in v4. I think
> it can be fixed by recording in struct usb_device that USB_DEVICE_ADD
> has been sent, and having usb_disconnect() send USB_DEVICE_REMOVE for a
> device that has no driver.
> 
> > - For drivers with supports_autosuspend = 1 (such as
> >   onboard_dev_usbdev_driver), usb_probe_device() does not take a runtime PM
> >   reference, and hub_configure() enables autosuspend on hub devices; once
> >   the device suspends, usb_resume_device() fails with -ENOTCONN because
> >   udev->dev.driver is NULL.
> 
> This is a pre-existing bug that is new in this review.
> usb_suspend_device() does a generic suspend for a device without a
> driver, but usb_resume_device() refuses to resume one. I don't know
> why resume is refused. If a generic resume is safe there, that would
> fix it.
> 
> > Third, if udriver->pre_probe(udev) succeeds and udriver->probe(udev) then
> > returns -ENODEV, the error == -ENODEV block runs
> > usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev) before
> > err_pre_probe calls udriver->disconnect(udev), reversing the teardown order
> > used in usb_unbind_device():
> 
> I will fix this in v4.

This is all starting to sound very complicated and fragile.  Isn't there 
any way to simplify it?

Alan Stern
