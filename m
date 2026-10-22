Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693054;
	b=Z4+liCrpZ0J3dCVCUiBvabC/AaKC1m0BoZdmKcbCsaitLWnbgPxsxgRgQyG1d9NowKVQ
	 DF1s5XWTfw6std/WrJtCFMXajU1lTv9bnJuwzLevpNdjVDtr8659iq6A9srvZTQA1iSYB
	 0tE+mk9AItyvsZ9NOES/tR1cBkStIHP6nxPH0FzJshK2u8zz5oOSjTfgbclT8BJr16yje
	 jiY3z6eOnTyAePK38ouFplsRjwzFw0cTmyraclj28MLnyMAXesqihCUDD3XI0fpmzFkBL
	 IaE2rcr6kkwDH+ZqKp3iToY9ByEfFfCzvWx7GfXOvHQSn0MXr+SpRYDC1YQI9B/5fpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693054;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=JfYuGkKiundK6sq/58f2tx3DomPHPmn9OTCr7OSTgaY=;
	b=5WgM3F8Ats0hE1rRFWGY/MACKVXDJKVsklaNnbfkEhYwVcEqZA8sMZfh30Uvk3mQ8+WK
	 ZXIjyTtLqqxaojLsqh0VzL1wsmg0a0jrQti0F//0EDmMeUjHr2oxfPFY+Q7j4jGZus1a2
	 FUJMdpv5Alq6hXathsJLJeUQYCd/g7kDJsbkpU3bfsKmXck+xeY4EjntOBk0nIF+1h0IS
	 1ew7OqrpOBVt07xpR0HZKG42JYP1yTHGLwVw+cnAADdyCuvnKZPABufOcClMDaxgvoLqP
	 OlafAns/kvoAiH6R/XexXfl07pO5LgW/eQRHIYDJoi/wZqrcubCAIzqHqcoxjQ7Dung==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HpkBUb/t";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DE4606A31B;
	Thu, 22 Oct 2026 18:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HpkBUb/t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CBC1F01825;
	Thu, 22 Oct 2026 18:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693053;
	bh=JfYuGkKiundK6sq/58f2tx3DomPHPmn9OTCr7OSTgaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HpkBUb/tiIUUTPc6tYRNejcN3x5B65mB+I1hTmIl19HTWVJ0SQdoTtlDQKgpvqT3c
	 qybA6CjKrVg+1fMtHubR8Bmy4ARD8fPZ2fcKCDkIqgrq0u2wmJOTMoYTeQFkQktqRN
	 OVKG2l49wCsPbxbN+y1xo+6/SAZzHTB/epJKsBZtkdprSm0ZyMT5ypy4JVaGMSFC9O
	 bpwNV0oQlgCRNRoTunbuRVx6Tal0XCp3+dQTY3ZMaNGy5QmTKsvRyxo24jZpAP9Bi+
	 IFarpI22uvTLkicmhpBTozngp2R/58Sv5j0mMlsyP63FeAR/bHFFbJSUihXHO2C6z5
	 gldczFU8MTvZw==
Date: Thu, 22 Oct 2026 19:17:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Xincheng Ji <jixincheng@ultrarisc.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 7/7] riscv: dts: ultrarisc: Add Milk-V Titan board
 device tree
Message-ID: <20261022-viewer-calzone-06a380c1c377@spud>
References: <20261019-ultrarisc-dts-v4-0-3979747cda2e@ultrarisc.com>
 <20261019-ultrarisc-dts-v4-7-3979747cda2e@ultrarisc.com>
 <sashiko-outbox-176776@kernel.org>
 <179246063943.3442927.10941907832509473109.b4-reply@b4>
 <20261021-badly-issuing-847ac366c9b9@spud>
 <179263206397.701068.17555028009758516675.b4-reply@b4>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sNz75mFAs8F+NaGx"
Content-Disposition: inline
In-Reply-To: <179263206397.701068.17555028009758516675.b4-reply@b4>

--sNz75mFAs8F+NaGx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 09:21:03AM +0800, Xincheng Ji wrote:
> Hi Conor,
> On 2026-10-21 17:51 +0100, Conor Dooley wrote:
> > > >=20
> > > > Because led_parse_fwnode_props() returns early when label is presen=
t, the
> > > > color and function properties on led@1 and led@2 are never parsed a=
nd are
> > > > completely ignored at runtime.
> > > >=20
> > > > In addition, Documentation/devicetree/bindings/leds/common.yaml dep=
recates
> > > > label for new bindings in favor of color and function.
> > > >=20
> > > > Would it make sense to remove label from both nodes so that the LED=
 core
> > > > uses color and function to compose the standard LED names?
> > You're asking a bot that will never reply to you.
> >=20
> > I'd say that if the analysis provided is correct, then yes you should
> > since the deprecated property overrides the replacement properties.
>=20
> Thanks for the clarification and for reviewing the patch. Sorry for
> addressing my previous question to the bot; I hadn't realised it would
> not respond to follow-up questions.

It's not your fault that you didn't know, I was just pointing it out ;)

> I'll remove the two LED label properties in the next revision so that
> color and function are used for naming.

Cool. You're too late for 7.4, so I figure what you've got here will be
7.5 material?

Thanks,
Conor.

--sNz75mFAs8F+NaGx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatpTOgAKCRB4tDGHoIJi
0tGGAP9lPCJnqeoQ9B1G6bmTq3uvewTCC9HWjZ0FOZBQZA5YTgD+Lg2/ebt85aCb
36IK3w6WM/RiA+q+WxLD97CvE/4jvQA=
=clv5
-----END PGP SIGNATURE-----

--sNz75mFAs8F+NaGx--
