Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.245.196.96
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998706;
	b=n+cqDgZiT5QTxtme3aldPaWqF8+ER8edOSaGiQwVjfrh1o25HWcgNt8us669OfEg26df
	 qrOB5KoEdi2Q03s4ggZ3g8C7FDpD1Y/AI7WLPG4oEwRAEV6Qx6MVFU1wjQXs56GsGF3EJ
	 0GwlGZ/IlJ/WKfIkRBsXKZcvRTzd0KdS1OUvUzmebZEnIjjjn41d1pH/L8TS2oJVxB8ji
	 qF62vJ7kkUd0SLMNz9hv2LZ6UhpG9Oz1PpNqO7VNnixhDQIuv/OFyKq+MUh97EqdZkn/q
	 ER4yli9BadJMlBBxrjVbGWlKR0fY8p65Up7kNaqJcJ3SlNQZhlMWSMKi6SXcA5cDSGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998706;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PJynymlG3cwjTCUtbWU2VLC+dEMiT0uwRnlq30YDBBI=;
	b=URIm8f74sQiScaAz43NrKOumwqZ3nXTdO2ePJH8v5NrfhVQ+tzyzB+gpDJRVQvZOR6J4
	 iOt0nzSt3Fmv+C5khp7WR82p7QusRt8LFX79dVOfe2GnxCY7pMlsNYT12jky9JHk9Lx88
	 PnIYG7d+LsthFz7zi9VP0WTva7+l1lstMPuwiQ+Xc4JisePkFBwVoYkTtmhDvsgBEMF0C
	 tsPTYxbfCkLibXOyi89HhD/lRe2Z1T6Xq14aBMtT3tw+sTaa/vICdYT9a/EQ4bvKbV2qf
	 a9S/aFuM3V41b8v7v8J3MxPjazpyV19893NE6XQwKQ+aeM7Z5RxuSv1Kq7raTQC6pxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nod.at;
	spf=fail smtp.mailfrom=nod.at;
	dkim=pass header.d=nod.at header.i=@nod.at header.a=ed25519-sha256 header.s=v1-ed25519-20260901 header.b=fdQj63iR;
	dkim=pass header.d=nod.at header.i=@nod.at header.a=rsa-sha256 header.s=v1-rsa-20260901 header.b=MdRe7Szl;
	arc=none smtp.remote-ip=188.245.196.96
Received: from calculus.sigma-star.at (calculus.sigma-star.at [188.245.196.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C0F606A325
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 10:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C0F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=nod.at header.i=@nod.at header.a=ed25519-sha256 header.s=v1-ed25519-20260901 header.b=fdQj63iR;
	dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.a=rsa-sha256 header.s=v1-rsa-20260901 header.b=MdRe7Szl
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1794998592; bh=PJynymlG3cwjTCUtbWU2VLC
	+dEMiT0uwRnlq30YDBBI=; b=fdQj63iRkU1oWMWfBe0XDFdpP0BAnPMau5ZJaoU21EbLZnER6A
	vIhL4On2dwD/TzFjzc/72o30iw9dTvGXeyAw==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1794998592; bh=PJynymlG3cwjTCUtbWU2VLC
	+dEMiT0uwRnlq30YDBBI=; b=MdRe7Szl8T2ELeiYlByW4qh54ue1HSlfwmNAWubC+sKJOPgHUS
	/KhFc35/3ERfnqjmXE0/Kg3JC8fwSNiIjoMvB3HQpciomoefWzA+J+EXdbGrgmbgjuu9Ng5AmmK
	jc+x4ZJ1dlC2jujt9jUGNLIIKQ4ToISx1mB5o8o4t3Xy13a5HkdUFXkd4xfP59zUHS91dWezHEa
	iPLPcH3mv50PY/FB1xg6Oa6iokZUfxM/yvZeZoPAqhSCY+cJEaQ18uA7q0077weTCGLyDlGumgF
	6zW6sqZvSX84JH/KSQXDVRjjgPIS90GdxRFmkCeYrAQHw7pr4xbqu+85avTbJOaLBeA==;
From: "Richard Weinberger" <richard@nod.at>
To: <arnd@arndb.de>, <sashiko-reviews@lists.linux.dev>, <arnd@kernel.org>,
 <linux-mm@kvack.org>
Cc: <andreas@gaisler.com>, <akpm@linux-foundation.org>, <chleroy@kernel.org>,
 <dave.hansen@linux.intel.com>, <david@kernel.org>, <hpa@zytor.com>,
 <mingo@redhat.com>, <jgg@nvidia.com>, <linusw@kernel.org>, <ljs@kernel.org>,
 <l.stach@pengutronix.de>, <maddy@linux.ibm.com>, <malin.jonsson@est.tech>,
 <willy@infradead.org>, <mpe@ellerman.id.au>, <monstr@monstr.eu>,
 <rppt@kernel.org>, <npiggin@gmail.com>, <nm@ti.com>, <linux@armlinux.org.uk>,
 <tglx@linutronix.de>, <x86@kernel.org>, <bp@alien8.de>,
 <lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <vbabka@suse.cz>,
 <surenb@google.com>, <mhocko@suse.com>, <david.oberhollenzer@sigma-star.at>,
 <Julian.FRIEDRICH@frequentis.com>
Subject: AW: [PATCH v3 06/10] arch/*: increase lowmem size to avoid highmem
 use
Message-ID: <mwlztee3.a0fc160f-3d4a-41a1-880d-7b9f8ef19767@nod.at>
In-Reply-To: <0829a44d-fab9-439a-b80e-4791fc72ba0b@app.fastmail.com>
References: <20261116124832.662455-1-arnd@kernel.org>
 <20261116124832.662455-7-arnd@kernel.org> <sashiko-outbox-218801@kernel.org>
 <0829a44d-fab9-439a-b80e-4791fc72ba0b@app.fastmail.com>
Date: Wed, 18 Nov 2026 10:43:12 +0000
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Am Wed, Nov 18, 2026, 10:36 schrieb Arnd Bergmann <arnd@arndb.de>:
> > Because PAGE_OFFSET is now 0xb0000000 or 0x70000000 (an odd multiple of
> > 256MiB), calc_cam_sz() caps each CAM at 256MiB even on e500v2.  When
> > CONFIG_STRICT_KERNEL_RWX=3Dy and CONFIG_DATA_SHIFT is set below 24, map=
ping
> > 1GiB or 2GiB of RAM reaches index 15 and overwrites the active AS=3D1 e=
ntry in
> > TLB1[15] (and wraps the 4-bit MAS0[ESEL] field at index 16 onto TLB1[0]=
),
> > crashing during boot.
>=20
> Ah, this would explain why Richard was able to boot using my patch
> with 1.75GiB but not 2GiB, at least if he was using DATA_SHIFT=3D22.
> Hopefully this should still work as expected if we force DATA_SHIFT=3D24
> for larger lowmem sizes like.

Hmm, David and I have CONFIG_DATA_SHIFT=3D24 in our setup.

I'm currently fighting with a different problem in the board.
As soon as I have more input, I'll let you know!

Thanks,
//richard
