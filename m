Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794898;
	b=NqDRoJ1SLa3JMCzd40yMWJVJnezbtQREz2kNRlzLQ+V4m6rHNSOyKBwgz1J2L0yp5EAF
	 hd5/XwbxykjoGuPCbNZheQzqagkB8nY7MuaFODyT1U92gLM0lbhdn6hymFb86jvebYm4y
	 jPNfmH4BULCQHzQ9WMHgzkdvHNqaCnPVHR4uIuoo2AfBqVI5mcLmMbgR7XZ6BOHSkanV4
	 wvhVSt0nJkK2fJOYaqTuPwWdRoLYVARfaahkKvGB6hqOMBltCGoJh1IeI2TMLUXvvqMcj
	 IU/8qdj/BajDOo6Z7SvXj3Y5zCVYNxWbJrKd4xY1x1WZpucD5WUccz9npl1rybeCfgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794898;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=IPU5n/aemWK5Zk7I9aXIvcUrWcHVqx43/uwXdnAxPsg=;
	b=uWa8fh8meffw/l+JNfCtrsvd4xJSjfajN1ju3CpDkK5p/L8FpnbKT7BOm+aB6BIHuJyK
	 14DeihA2SCy6pc8juXCM/wkuNhlFxQAk5mLd1jGy82tgpijUQNVuOql7e5hxKkKr4lTWW
	 2Nh12iLOAcpKJBbG7cFaF0aqbIcDkWQqKA/abPlZ2QlM32essb47IgpLfP6R3zN7arYhz
	 KQ5Qt80+wIDpLtlVybWGa7Yy9M9DsgCAFgIrSLJjEPJzmotRYuhc+nxnFe0qhMiHx9jdp
	 efM4juangytXprcS67WXXhEJyjI5yYGQHh9kW7dg7VtEhrR525W/2EBIUVeqpraCCxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=Ew9Zslwo;
	arc=none smtp.remote-ip=79.135.106.31
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C98C606A328
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 12:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C98C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=Ew9Zslwo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793794895; x=1794054095;
	bh=IPU5n/aemWK5Zk7I9aXIvcUrWcHVqx43/uwXdnAxPsg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ew9ZslwoIeY0PA8jvTySLrCngTMq/FkujYp2l62DsZLvNMtkNcp9ddn+1LckxYJuX
	 Ur7YDfkS9XFUjYLEK/IdsJaXtOZi88vM4mHSnEhj2GMwBrjavnUjZ4x6PLJmnAhgkl
	 sA48tBXYClAR/6dBdRCp4EpJa/10obUbLTIBnJtv58Fucwiq3Nkz20WDVdyl4J5GDo
	 kDGDbZ6JW8/w2xDxy9Gq29xip+rE0DwE0XoDaBBo1yWT08hr1AVR+cyc6OV3uOVRdm
	 WhMx+yHzySYHt3B1OHthJdmxiqcobelKdoE1mE+ZFz/LdlVFhIvSc8hzs0TRfNJTtb
	 eJqValDSrt5sw==
Date: Wed, 04 Nov 2026 12:21:31 +0000
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
From: Sinan Turunc <enscrpt@pm.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v3 2/2] ALSA: usx2y: Guard the playback copy
Message-ID: <20261104122103.1493-1-enscrpt@pm.me>
In-Reply-To: <sashiko-outbox-197138@kernel.org>
References: <20261104105228.1124-1-enscrpt@pm.me> <20261104105228.1124-3-enscrpt@pm.me> <sashiko-outbox-197138@kernel.org>
Feedback-ID: 48393780:user:proton
X-Pm-Message-ID: 3c0c087de62a64768cd35af5b7c00875d40a00b0
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> If actual_length has a non-zero remainder modulo usx2y->stride, can this
> still read past the end of subs->tmpbuf or runtime->dma_area?

Example 1 (a descriptor of 203 bytes on a 200-byte endpoint) does not
reach the host controller: usb_submit_urb() compares every ISO
descriptor length with the endpoint maximum and returns -EMSGSIZE
(drivers/usb/core/urb.c, the number_of_packets loop), and for the
full-speed devices this driver serves that maximum is maxpacksize. The
driver then stops the streams on the submit error.

Example 2 is valid and pre-existing. The descriptors are filled from the
raw actual_length while transfer_buffer_length and both copies use
count * stride, so a capture packet that is not a whole number of frames
makes the descriptors add up to more than the buffer, by at most
stride - 1 bytes per packet. The excess is read by the host controller
and sent to the device; the driver itself copies only whole frames.

v4 sizes each descriptor as counts * stride, so the descriptors add up
to transfer_buffer_length and, with the maxpacksize check, each stays
within the endpoint maximum, which also removes example 1 without
relying on the core check.

I went through every value in this file's data paths that the device
controls (packet status, capture and playback actual_length, start_frame
and wMaxPacketSize) and where each is bounded. The descriptor length
was the only one left unchecked after v3. With an emulated device
sending 195-byte capture packets, the v3 descriptors add up to 780
bytes for 768 bytes of data and USB/IP's completion check refuses the
URB; with v4 every descriptor is 192 bytes and the stream runs.

Thanks,
Sinan

