Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D272331E82A
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 03:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780023807; cv=none; b=GG9iV4aM125Y3GAJw2GaOvfv644WWZ/XPzUyRFscXpIagbArnvoMnoeRm8A4auo9QKxSnGamByGDmMLBf3Rgt8KuwipEdxjmBOfP1CqKgOMuEtYG3LorI9ObLqUIv3ASqHk+OpDhnmrc7v4RJwSgpZVT3qOxoR0d+Q13v28+kX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780023807; c=relaxed/simple;
	bh=ZyG3iarvfxDi19gDrVOpHiiV16WRr+S7b+solJm1jXc=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=kSBLoR71mamxZCWURBWHhS6H3PKe7R+KR1ex5Hg4006vG8pJA1G0kUMY2bb+/XmKIkqfNU/PRuBIBwG40Zai7cykndf+/iC3fTX2AZiwwaGwvGD2FAZN+Cdsh0W+TLELvIw2wRN6i2mvBKadjl9IXcOIRENGzrFGv5B97QfGql4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ohF37VDP; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ohF37VDP"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780023803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stXZw48zHRacyCnzcy8bp2JWC73MTFpkHjGYRFxJNjE=;
	b=ohF37VDPSdfYzpR5uGiEvBMID+9imjxTh1zyu1cfJl24RB8TDl+t4E/GrSX/hGNcR/8lRt
	RchVXf85mmI4oYVCZEcfv6vgf1BHuaaQKqrPa/Qi6wtUEPRsFFfocUJyUNehNfYyg6XJ43
	bcWPEp7qmDyKtZwlpyFdV/5igJ104Uc=
Date: Fri, 29 May 2026 03:03:21 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <bae676bd29a955ceb6b224190904bbbab8a23a3a@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] crypto: sun4i-ss: restrict PRNG seed length to prevent
 heap overflow
To: sashiko-reviews@lists.linux.dev
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260528152939.0C45B1F000E9@smtp.kernel.org>
References: <af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev>
 <20260528152939.0C45B1F000E9@smtp.kernel.org>
X-Migadu-Flow: FLOW_OUT

May 28, 2026 at 11:29 PM, sashiko-bot@kernel.org mailto:sashiko-bot@kerne=
l.org  wrote:


>=20
>=20Thank you for your contribution! Sashiko AI review found 5 potential =
issue(s) to consider:
>=20
>=20New issues:
> - [Critical] The newly added bounds check unconditionally rejects valid=
 seeds and completely breaks PRNG initialization on 64-bit architectures.
>=20
>=20Pre-existing issues:
> - [Critical] This problem wasn't introduced by this patch, but the PRNG=
 generation function silently truncates unaligned requested lengths, fail=
ing to generate random bytes for the remainder of the buffer while still =
returning success.
> - [High] This problem wasn't introduced by this patch, but the patch si=
lently permits undersized seeds, leading to partial seed updates.
> - [High] This problem wasn't introduced by this patch, but the PRNG see=
d is copied into the shared device state without any locking, creating a =
data race with concurrent PRNG generations.
> - [High] This problem wasn't introduced by this patch, but there is a b=
lind read from TXFIFO in PRNG generation without checking if data is avai=
lable.
> --
>=20
>=20commit ce68b95827dcfbd778d1a5a3d2de5fd10e821954
> Author: Tianchu Chen <flynnnchen@tencent.com>
> crypto: sun4i-ss: restrict PRNG seed length to prevent heap overflow
>=20
>=20This commit restricts the PRNG seed length in sun4i_ss_prng_seed() to=
 prevent
> a heap overflow. Without bounds checking, user-supplied seeds via AF_AL=
G could
> exceed the fixed-size buffer and corrupt adjacent memory.
>=20
>=20Fixes: 6298e948215f ("crypto: sunxi-ss - Add Allwinner Security Syste=
m crypto accelerator")
> Cc: stable@vger.kernel.org
>=20
>=20>=20
>=20> diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c b/dr=
ivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> >  index 491fcb7b81b40..010fa891c1056 100644
> >  --- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> >  +++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> >  @@ -8,6 +8,8 @@ int sun4i_ss_prng_seed(struct crypto_rng *tfm, const=
 u8 *seed,
> >  struct rng_alg *alg =3D crypto_rng_alg(tfm);
> >=20=20
>=20>  algt =3D container_of(alg, struct sun4i_ss_alg_template, alg.rng);
> >  + if (slen > sizeof(algt->ss->seed))
> >  + return -EINVAL;
> >=20
>=20[Severity: Critical]
> Does sizeof(algt->ss->seed) unconditionally reject valid seeds?
>=20
>=20On 64-bit architectures, BITS_PER_LONG is 64, which makes the evaluat=
ion of
> SS_SEED_LEN / BITS_PER_LONG result in 3. The seed array becomes u32 see=
d[3],
> yielding a total size of 12 bytes. This would trigger the EINVAL branch=
 for
> standard 24-byte seeds and completely break PRNG initialization.
>=20


sun4i-ss=20is designed for 32-bit ARM only (A10/A13/A20/A33). It's behind
ARCH_SUNXI in Kconfig so it never builds on 64-bit. On the real hardware
sizeof(ss->seed) is always 24, same as .seedsize.
