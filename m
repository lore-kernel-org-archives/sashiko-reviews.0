Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794410275;
	b=xbN6BV2OOWRbv31ICt4lioevZ4R4lhYHqE2DpeLW+pZJzmbKWXoX2rEdMM1Nc8M8vNIo
	 eWKNOvJKKy7AqMIS0do+8bsGmkNguOH3AVBZhTOqQ82ykKKERUUMj8IJ5FOgg3J7atFZ3
	 N9T41lRfAFUWeBsX+EK3hxEPbFPJTBN09OkHEuACQn2BSAH4j696h1Nm0uY0QnZNc65zD
	 d91TvJjqqotAk/GbDE62L68WIFF1syW+RgJD4BXqTtsuZgJMW8ep2Wb6q3UY0JBsZnJpu
	 uA6Qt1cPMnQqFwcVDeJbptWzNvMs/NGggI0lLqm2E4ZzgToqtHcZM2YMgpHRqVEo5hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410275;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Mi0v1lmmEqzU5bB2WTOYLc+GgpnTUYzvYcIj9//zMpM=;
	b=jH/df19Yq/uzbCRpll63m9Rz8GtW6h8qOe6iSVFKN2Yl9cyB3R0Y7VLvmfrSBDUBtKpV
	 1eiQeknL4WF14fC/iYwDOh3cm0TfehrvDywTTZh3zukQTM9Ljb2+iBKYOMELIrrQ6Pi4I
	 Rt+9RTQzPscNBDY4Do36gsGr8s/gsVXj6kN6zC8NQbTG3N6S7E3MWgugbH56IxxFEGlRq
	 1OZZXeefVjG0DtasGrhWyXs3es9uqBAZHtbrL2S4Yse+gbOQlQaX6lDqk3HXGtFFgGlx5
	 r8y96WhZ1xgSwWVQ/VRuUE9VZP8dL+RPxSn6snDRzHebP03FM7s3Gt8n3XiR4wOy1RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=y7D3424g;
	arc=none smtp.remote-ip=79.135.106.97
Received: from mail-10697.protonmail.ch (mail-10697.protonmail.ch [79.135.106.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5977F606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 15:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5977F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=y7D3424g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794410271; x=1794669471;
	bh=Mi0v1lmmEqzU5bB2WTOYLc+GgpnTUYzvYcIj9//zMpM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=y7D3424g3Z9N1Y8iLYWHFGw4KfoJ3ny7oKXZF8hLtvdBefL0KfXffzzwJ86lrTstj
	 oc8HS0T1sx92vU4vWe6YTjjcY95DjwaOpjHR+uV/iEGIYfIOiJdVneGOG59CiThOjo
	 E4YRZAtk/V0Q1bYUNdr55feAXdKIE01uyJw/3kEwyda4/J9pbJDwImPOhAhW4h0Ttz
	 hSSfVe463CAHtz9qlsPiTMT/vtyaxs+nmeFjkcbUJVIuZONF2sj0kfi542HL3qZ7oU
	 qGQYhuiORklpYLmBKasBtRO3IbPGlKI5zIg1kyYK7DDIkKhG2k6dbSu48MjHTSPUQY
	 qXOe8M/qf9fUw==
Date: Wed, 11 Nov 2026 15:17:49 +0000
To: sashiko-reviews@lists.linux.dev
From: Nordschamane <nordschamane1@proton.me>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC v2] ALSA: pci: add analog support for ESI MAYA44e
Message-ID: <UcT-nUWewZGHvjh7Ra2vOtMNCP8r2Ak9fGDeH47-EtQWRT0vC__sp2norUyN7cFUjOwnVM8t8k-_XNrDfYFV6jwxRP-TEWuUzP2gSYuryLo=@proton.me>
In-Reply-To: <sashiko-outbox-208724@kernel.org>
References: <20261111-codex-alsa-maya44e-v2-1-c5f94d722b54@proton.me> <sashiko-outbox-208724@kernel.org>
Feedback-ID: 234176850:user:proton
X-Pm-Message-ID: c77acffb4c6e53623573068f2ed3ed23b28806ef
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

Thanks for the follow-up.

> Pseudonymous Signed-off-by trailer and MODULE_AUTHOR

Nordschamane is my public identity for this project, and this address
is how to reach me. The current DCO instructions ask for a known
identity. The kernel documentation change explicitly confirms that
nicknames are accepted:
https://github.com/torvalds/linux/commit/d4563201f33a022fc0353033d9dfeb1606=
a88330

I kept MODULE_AUTHOR as the project name and moved the revision notes
about the review below the patch separator.

> Race between maya_prepare() and maya_pcm_reset()

In RFC v3, the reset that completes PREPARE clears both playback DMA
rings and the ALSA staging buffer. The clear and the pointer rebase
now run under the same PCM stream lock, so ACK cannot insert samples
between them. The prepare-time clear is skipped for explicit RESET of
a running stream, and START is rejected while prepare is in progress.

On a physical MAYA44e, I checked the kernel playback pointers after
repeated capture-initiated linked PREPARE, refreshed the ALSA-lib
playback handle, and completed three linked mmap playback and capture
cycles at 48 kHz. I also exercised explicit RESET while running and
verified both stereo outputs after S3. The capture inputs were undriven.

Thanks,
Nordschamane
