Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16320397E8A
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 08:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558687; cv=none; b=SpRZYXMtzw1AaJ1gitGCMoCre9DsYg1f3xB7j870pj7nW3Njg0ngR3gIm8vw0YRPbCGAwHDQWst6EA03DXoSb0LrdCoRIGfEwQ0YitB3DE1mVj8ESkLYAzNsbSrBQ5qV9haraoLA2kZ2K7oWTZwaCZcEZgTmG28NPf99aDNhAsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558687; c=relaxed/simple;
	bh=XDNP9sGNVSgP4Ks+3cqzP4wb+3fLYzkvYqb7oZQQZuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DicVgadoc6ynx857sxt/gKlWZn3QU1sfx83IKbMe/KCgMddmBBgF0WgwHIK77TDdixU1MOMSZB+KrOJACusMQwdKi9P9U/ET8OsLLf7NEErS1ESKhuuUt2qesusr6IS2BmYeEFWgneMSnfy+hnESiLtoMpS3FATN6CxCXvUmtMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SNIF2bOc; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SNIF2bOc"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so353698666b.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787558684; x=1788163484; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XDNP9sGNVSgP4Ks+3cqzP4wb+3fLYzkvYqb7oZQQZuU=;
        b=SNIF2bOcQEZq+s/Yuh45WWgeHwGhRDIqZOLCmLlMvfsxcHW1522A7SMBXCbqZ+b0ar
         dqZlbZAfHytcnmqraIkuKLP5A6CCfEvewzWnaJkywDfVgGvzEn1swvZR2Fqh09h999Bx
         YlA7rl4HM/H7Pa5y90L01XRLw40Mq5VACEpEBqWLi/Ui5WH5/C2fCHcyYHcg3UcvYGh7
         CzttsYQezfiTQWzDYf9HHJCoaZK5w7Kid3mVxoad04bhezALvjHZve3dM9XZP1ZgWQY0
         3g4k+YBZVf7EHhhtapANoBwZvvS18s6keRZXBMOd+pb89r+fyJi2NaZwrl4qwIGcahfb
         NOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558684; x=1788163484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDNP9sGNVSgP4Ks+3cqzP4wb+3fLYzkvYqb7oZQQZuU=;
        b=SD3KX9KYXxjt+dZf30KOoSPRL0jV6xEXPnuBIFxC63d46l4YmKQEd1+R7qmcHemBjd
         ApklgNOY2gfKW+zQQLN4L9hQjLQs5iqOcpqU9kQ3XyFKd4JIN9w7IgsY6X1VmWQwmZnl
         zXYAtsccJFH4Es8dSfJ+Vy1AafIB+v1+jHRCjg6GsMMklPfSFusgmeE0lrehDooCpkd6
         Z/ZhWK0cp9PNVjxJjcTPT+Ml+Bj98QvKMY3Wcp8YfwbhTYh2Rjozooj20AKgwdsJP0Sl
         n7CbyoFN7iyOshjxjRHpP11TT7L3grX+BG/vhbnpDMHWBuII449GqNDtrfehL9QS/4BO
         3X9g==
X-Forwarded-Encrypted: i=1; AHgh+Rp4vrpnvSa/s38NuwATJiUpoCbZ8Mn5lmpew7htM037IlkUWkc37nMxc32z7BXi0GnhxSdJqqg7uL1qbAPkMsQ=@lists.linux.dev
X-Gm-Message-State: AFuF++nLGybwpGmiARn3SoSe0HkLqatKUnZXbeijOOfeKCpnN5vIO3gX
	94Z7S77YME6uzPVfirxmZpuU3eV6q9dM5nvB7KU0uXymDOnTZq56XlfU8OI//dTkFLk=
X-Gm-Gg: AR+sD13CVcy7os6+xW/Y5/Po5SzdG8/8wUYzA79VaMOOzsXabioUZIMcxR734EKxFsv
	4OFmUr/xuhxWtfbESo/p9maa94MQ07mTAhCnPvTZhPE5HgX8pcnRSpylPvZPBLPRX/N4TyaZ1eb
	7WAzl2m9ppkxPgZBIniUC3TKI98f3V8diAdAy2nM7+e0IMRBjHUzM/QlWTkhQ+oQaWyLIMEQucn
	HftFDy9fXY6GofmmNebgDC28LtCcE33PFdAcU3kZ9tPs8Q7951K0qwyVa+jEHBNqTnO/9dzf8wh
	X2/QPGla0L2aIp5eR2dn67rWNwFnY8oL9PE7Ov67KsEOqKgorxxtkzG8MKGm2VSUIQTs6s+2wjP
	iWlYBk0UgGkPYdf4nFiaDlQAWVjrJi2QQk+KdD8H1tX/Ozq0zG1yzthn6GPUghMfQPW8L1Li3jq
	6Jo/k1TshEyWUVnolIjQIj1yOL9PzVOAUS4AHNlore1YaC/dXy/M645jw0bNYxg4gUAtXswprPo
	Jh1jX7ealx/oTh/W0QyEFo6dhG9+77Q1oE5xuJ8+vLzYYr2HX9d
X-Received: by 2002:a17:907:6d15:b0:c24:4128:c19d with SMTP id a640c23a62f3a-c246a2e9378mr2551285366b.4.1787558684110;
        Mon, 24 Aug 2026 01:04:44 -0700 (PDT)
Received: from localhost (p200300f65f19a904efa8a94b704adaa2.dip0.t-ipconnect.de. [2003:f6:5f19:a904:efa8:a94b:704a:daa2])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c249606b683sm1251855166b.5.2026.08.24.01.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:04:43 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:04:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, 
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, "robh@kernel.org" <robh@kernel.org>, 
	wsa+renesas <wsa+renesas@sang-engineering.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v6 02/11] dt-bindings: pwm: rzg2l-gpt: Document
 renesas,poegs property
Message-ID: <aov6v5dObK-zJfRj@monoceros>
References: <20260604095647.108654-3-biju.das.jz@bp.renesas.com>
 <20260604100619.75EC51F00893@smtp.kernel.org>
 <aliM3iVA1LY7tW38@monoceros>
 <CADT+UeB-gV8QnuwpTUrHV-GvYPwebYg=RE68PcApZkACO4ENDw@mail.gmail.com>
 <TY3PR01MB11346EDD83D9CA3F3252D48F586A22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yhelts2hapldhig7"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346EDD83D9CA3F3252D48F586A22@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--yhelts2hapldhig7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 02/11] dt-bindings: pwm: rzg2l-gpt: Document
 renesas,poegs property
MIME-Version: 1.0

Hello Biju,

On Sat, Aug 22, 2026 at 07:54:26AM +0000, Biju Das wrote:
> > -----Original Message-----
> > From: Biju Das <biju.das.au@gmail.com>
> > Sent: 10 August 2026 09:43
> > Subject: Re: [PATCH v6 02/11] dt-bindings: pwm: rzg2l-gpt: Document ren=
esas,poegs property
> >=20
> > Hi Uwe,
> >=20
> > I have clarified the use case with Rob on [1], and he acked on [2] .
> > See the details below
> >=20
> > [1]
> > https://lore.kernel.org/all/OS0PR01MB5922756F1836AAABFF62C04786049@OS0P=
R01MB5922.jpnprd01.prod.outlook.co
> > m/
> > [2] https://lore.kernel.org/all/20221215205843.4074504-3-biju.das.jz@bp=
=2Erenesas.com/
>=20
> Is it ok, if I drop the POEG support as few SoCs such as RZ/T2H and RZ/G3=
L needs PWM
> and this patch series is blocking them. Later I will send patch for POEG.
> Please let me know.

You can also reorder to have the important bits first in the series. I
can also apply partially then if I'm happy with the base support and
there are still questions for POEG.

Best regards
Uwe

--yhelts2hapldhig7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqL+xcACgkQj4D7WH0S
/k5q7gf9EXjSbZmnkiK66pzWl5IRYULgilZsieiRyqDExXbIofVEhxYmfRjlv8Qk
SNFUgIMRCOAK2BE+7iwPlJvCP3gMCnx/47ZEZmz3sykbgdgjyW96YPL12tsHpAC9
wgtHAEdKLvn1WrkVQB4N0LCsnbs5zXoc1BdR+w5vOZLzW4RgdNRQuizJ80czjdQ7
dV6vq981FKkyftinsY+e4bLH6Jlk+QaLLSc8gQ3CW4Zf2J1V1N4OFvAPryGKQ388
TvYs6OWt5RRFAfUTYYomIvwA9H30Olp9uh8weGokQ+/wvCHFqQm7bddVNQIwq7YM
x26KbVqXuLL5WSvfqVs02DuzCdv5yA==
=b9qz
-----END PGP SIGNATURE-----

--yhelts2hapldhig7--
