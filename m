Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953183;
	b=Lmxsea9QJicHuvOUjAxn+JyNiXHxqytMHbdQ+s++FoN8IyM14+JhJFrHCbdApCMdBZIU
	 kG6ox/IY0gX9tnN4X5B/x+4tL2eRz5n7DoImc9yVoJYjGMbrbjk+qXSbIdygrOHPuayzv
	 iKBlEZfZAHBSehTpHCs6q0DkoFtDLIKZqgPQ4yEn6LsjSSIILPeNshy+PjZzsU2ZrFPYN
	 IH1ZabPXrG8N5i9TVk3uWjkh4Hh++zAC3RFqBXkh33VUC8J9Blxn7L2GqGR9y+fXvUoXX
	 6e43qGiZ1RoxvUlWtbD/AKmztf+l134ZasRWVC2kT5IiLi5AaX7JWPJ6FHnGNwPOaOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eqCIGCTJqZ7BbtWczIXWFrh7eN/wsUXhmj0FDZDRfj0=;
	b=Bozn6OJezsRJalXiRkwaHlYZDH2f3N+auklv1t5E+WsylTTRsBlMwPDkpPpigztE3yJq
	 VVjuPWkN5i9VauhtftOcTF45pqoWXrvO6YPij6cl3wsDIy4u9AfV7dhlvyEMXffAMqVmz
	 iXMXvLhOsBXen/4vr7cyOnBmBn6iR4lcaIEauNgtiHeoouyXCfND8TZS0NUeMfO8gA70t
	 4dlguXZvfRCa6n6METNKSqmvPbCB/2IBkvmX96gTLEDxPl9j0VJfCWS3nTSKILLNoDdT2
	 A11oQF/MiQBrqXUYg/WeY0TJhHqmPvrTliMCAw0dDe0ekp9q9yk1d6qXil1bkOsY8Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ce7Z2f+O;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855C2606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 22:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ce7Z2f+O
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so157134f8f.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 14:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953182; x=1795557982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqCIGCTJqZ7BbtWczIXWFrh7eN/wsUXhmj0FDZDRfj0=;
        b=ce7Z2f+O/oE6b0p6TiZlw9wFXu0rLAKLrUJv9JIjNs87/1B3UJ8eCx+iLGuAsrIp+0
         mnydagtZTxLkWjHdF6bnQwR1FrvEk4MxcJTeBxmSfWfPEUtFzNIt+MZSmbs5Hmfha+H8
         BSLf+ipiAnp65dtk/+G9fZ3HNZgUK84rkacc7pXieQvKakIrThtFmupbqBFMTexcbOhh
         CfX1zU4HQ1q8jS3zLL9wetA523g4PYWRzGb3BukajpljRvh2dGqW40hjzQpFkwZzqogw
         H48r+OXa7w5RuclTTwkGdW9MwoXmHpOcB38Sjcwb8igya8nTk29u5rQ2Zrq/HYeIR/M7
         t+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953182; x=1795557982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqCIGCTJqZ7BbtWczIXWFrh7eN/wsUXhmj0FDZDRfj0=;
        b=RdTxekGcnR9eU3rqHo0GNsg/iUnO2WChGOQyDGraUobK+PJzJdkyPMsKlZGHfwFIdJ
         HV3Y/cqULAQvQhEsbTx6Up1k7k5ktkvyLPekdNrIpGaJ8DVfmiDTwUWzhpMzoKFSDTQX
         OWuMjhsbPr/JBXRsPX5puuelosta4LH2v7fmjMB2J3kVqJNFFsoBfkTIse9rPXA9HIoF
         0AP1w+/7KyZRDhn5ImdTX0Ck2oIZDvmRJU+PqKu/d1OieHSlINrLot7MHJbECpkbyhLB
         vmYgH0trjy3bYImTqRGOKkw5agfhFawv/+4jr3/0r63K3AWkbSda5a+h32Mz2ZkAegQs
         Z1Ig==
X-Gm-Message-State: APuU4Z91C///ptYmT18pRKphUZEU3djrATmtG6W88Dh0CSQA9WEFm0Sk
	ejtl1N4fMo+/KExexwWr25xsxAoLTTIULl6ttpfimI5gRwYFesO6I/zdccoMUrKrnkA=
X-Gm-Gg: AZFdTZfAJw7Tw//NrLRFhk+LYv44ck2/M0A6OLtAQM29/B/VHgQ6M0aErqeUg9QGUJI
	TDVIKijD5PpXJ62hxU2RekecLZEpt+Wm8JPYW+Zjh8imvwrIsxtYZeb6+60S4xxiT5/GG60Hcv1
	OJL9F3Q7xOmhyqHOuD8FR5cFGRBU1iNwTvvy4YCOgHYUv4EBsbALB9PVxUi71nwQ2MW0OnY9rGC
	QmeHGCfi8Jn61PAxOxSQtgvRsPEgVlmzh645QHIDC6yxLsmip7rpwc+2FTmhLzn91Hm6f/lktex
	F1Vz8pwnEytfIpSxn0LFO/zDJqPzzEyOiNX/JFxliDprUmDP5J/oPt+qzCrf3uE65+WMlTaGbNE
	mSyh5I99rhDRuxYzfrvi16lswZceTadxaTckBR450oTS1DrmJrb7brKsW0NSErrt0/MwpxDLGTf
	brd8tKBmmpgbZui7i1bf9uA6/7MsiAMWYVWHjDyV87yY/I+QhtfF7LiXooQ71G66qJNkNSAO6zt
	Fp9EUWWHvEZw6dJHg2cp8ft7wWjNgWPgUdi8jBiT7fQ41uYApdjRhCowDOX2nxt2Esrxma4scBo
	xc56GJ/oKBN96R28QvyEuvs9pzOkByR1PAuRHNpHcVVYkCbxA3Mdca7FX3u6P6k0bVlTPK7nJN8
	UKy0ePjoNNf+ZPkGxVwWCYSgNKjlt9ikV/vStx4OJ83mR16k=
X-Received: by 2002:a05:6000:41c2:b0:490:71a7:6f3c with SMTP id ffacd0b85a97d-4a63fa2615bmr1519890f8f.55.1794953181671;
        Tue, 17 Nov 2026 14:06:21 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655f9f4a7sm1091018f8f.34.2026.11.17.14.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:06:21 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de,
	linux-mtd@lists.infradead.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net
Subject: Re: [PATCH v4 2/4] mtd: cfi_cmdset_0002: implement point() for simple linear maps
Date: Tue, 17 Nov 2026 22:06:19 +0000
Message-ID: <20261117220620.3834899-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-219722@kernel.org>
References: <20261117214141.3826637-1-orgads@gmail.com> <20261117214141.3826637-3-orgads@gmail.com> <sashiko-outbox-219722@kernel.org>
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

> Does cfi_amdstd_point() leave *virt set to a non-NULL address when
> do_point_onechip() fails on the first chip?

It does, and jffs2 would then scan through it. v5 clears *virt and
*phys when nothing was pointed. I'll wait for review of the rest
before posting it.
