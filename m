Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940934;
	b=5NJ/orK4KjU0He8S6pGvoD5IldutYygaCCjzM9LRF0DseXcsTo/J+YdvtxKOZiDjDbd+
	 NPvNoeTElUE+81VC/Xj/QMkw+UKNS1rWWAZ1vi4bv8OXx48GXdwH28/LZZkz3vHl4RrLd
	 sAH7r+PIKLZETgoXohyXborGykD/segh+A93GSWmepc/NyaNCvlCd+TPdN4hUURYLVicl
	 Tk6bg6GSzUrCVrgLWQ/1LFhsTs0uPGjpwLVvO3b6ACO35ehkEg0fSQZwDSlsizY7uogfW
	 GBmp+LCuTT/vdh1rria+LyLpdQNmQ6nynxzvsnMpPIh2bLk+97xA1VbOuqjClKiqXDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940934;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=oMSOkMJ2ZXC9l3P9pMKrtpE95z4l6icde5TxpIpV/go=;
	b=CzWc/wmDFc3B7CoJAFrCwh3p6vOTQ/EJaMPNLvB/n/jsrThesNf6KTtcoSYpU1m+7Ph5
	 kFTo9t8youJWUf8OKyiQ0vlYoSqz0cAmI5ZloWT30g/+RLu7Txn3jGAG35fXKBbETyQCI
	 lm2G+poijMrfkVVYsekG8AHWHAKcEXfxik6DtfxaHczBeS++rmh9URm122XS/CUuanHlM
	 rqaFt0JQreFNzlh4m60Q0k8INmHTMmY3Y6EwBWVBKnNBOnRiHSBdbyMkcOi1Nxln6UlzK
	 71P5OQVUftUZswHGUcQK+5fkkLD4dEUBUQVSHSXi4Aa+fKsCgB0LaBtWaeRLLcm/Vtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zl4oOLSW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171D5606A33A
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 18:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zl4oOLSW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BDE1F000C4
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 18:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940933;
	bh=oMSOkMJ2ZXC9l3P9pMKrtpE95z4l6icde5TxpIpV/go=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zl4oOLSWhNEPLEv2i/jHIVD3KFF8K1meFM+xphCXy2Y17lis9EQV1sqngvaCefbbE
	 DF/LGKmYxMXRy/FpCeKb7Rmr1dgldhzjNqQSkZwSMr8zYwHDUKzj3o/diYZqtQ6mnb
	 sE/+SuwYWE0YAMnG9UVhaayOUiERieJWDbZ2HuuZyFWMOERgqEB4HHUZOv8UYVmQx0
	 5Oe1ldbBzGodDOeoQMldU8Vm1HcgiLSkLwlWEBsN91W41rBBr+BJyU05/G0K/vyNEB
	 SxSqPS+VlWTGwVhmiTVnu3r2Z9MHp6vFs4HAPlqmd/7MkGf0z1IaIfpAW4qGoTcvCD
	 cqhk2Jw0s1qMQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c08539c827so57428e87.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 10:42:13 -0800 (PST)
X-Gm-Message-State: APuU4Z8FDw294jZWcTaO+Ij770YKCX2NxZy3lD+hAVj8ijI1bj/3O8ps
	avMYQmpMJ5QgbcftDpRQzeYWnohQXOlf7z+mYTzyxmQCrA/H9CpnSDmG5riZludIhMYc1uHlN2X
	2imvyCSMMBCcDv0rNO31KyEtSfXaE+Ps=
X-Received: by 2002:a05:6512:2313:b0:5bf:e643:cb75 with SMTP id
 2adb3069b0e04-5c1a9f266f8mr5018e87.48.1794940932746; Tue, 17 Nov 2026
 10:42:12 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-ux500-powerdomain-dts-v1-0-e0f4459c3ab1@kernel.org>
 <20261116-ux500-powerdomain-dts-v1-2-e0f4459c3ab1@kernel.org> <sashiko-outbox-216799@kernel.org>
In-Reply-To: <sashiko-outbox-216799@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 19:41:59 +0100
X-Gmail-Original-Message-ID: <CAD++jL=XdOR_C2tcn_JdPejgaKvZCrxenK2-=ZNfBpamq7t=Ow@mail.gmail.com>
X-Gm-Features: Aa3M54oixxB7T_iuZTnK_d9bvHPJ1M2WAn4YxfICmRbWj9MkimT-s4sSgTmvMv4
Message-ID: <CAD++jL=XdOR_C2tcn_JdPejgaKvZCrxenK2-=ZNfBpamq7t=Ow@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: ux500: Add power domains
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:55=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: Low]
> Do the DT binding schemas for these nodes allow the power-domains
> property?

Yes.

Submitted in parallel.

Yours,
Linus Walleij
