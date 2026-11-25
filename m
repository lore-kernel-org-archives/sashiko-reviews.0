Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607217;
	b=hWIhC8k+B06aQ187JPePTQEbKewSb5aSqSCKzkhM5nP65AVyqRYulrm9Mt4JGY18k++9
	 btUKbqjBrqMdUz4jzrujTU6mhL/TD5OtqqlM+Q4IeDweKgXqwvFFoPHGSpmz1J1231o5g
	 OGygOGUJMPrrjDlZSdz772IaZNCVmfF1SAruioN5IZDObHoh26UXvm3d/uyONvef1EKRo
	 N6R2shh6Fd3P5HIro8mRxgE3VdqSdaGEmYXxiC4HiIcayAJlBS3A1v6sGKgRHRjy0KMhn
	 V5Rio2Pn6mHDvy3YU57LuikKVQ0IsYgIhNPlD+GwmGORxA7wjypW9HsNvGvWZuah2YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8d9il6UmYnHuFTObnPSAKSL1Qx/DkpeI4Exm7zghUTA=;
	b=lm24tKfEN6R2CE1GVekLSRYNywluc7ENyaB4ogvR3lfokTAjH0Kq0QTE9X8ACyPSGBAt
	 viUWkgSSyeI8waVR5IfU2gagZVym3RJP3rj3rwV7Ua90hjZpZ0swHbzzBre5JC3Bvlcjo
	 eUbKJDRMuMZZO0PLIHCsE+uM+cimuly4v3ijKpXGVN5CNpi8SQZJB5arybZ+zF6qXXgPm
	 yj8rfs6NgnDbMTmSP2oC7r3Jk6KYSshdFnTkFUfVSqTma41CgWHIb8VqC+75a/DmFxJop
	 wQ2KcAm/c3FlmTpFBZ/N9HA8hK/2ruEG4lgUC4jLcQ1bj9tC0z8pV3Pou2jivj1izzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BNgmptiF;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2470F606A31E
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 11:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2470F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BNgmptiF
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e09aa5264so3256209f8f.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 03:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795607215; x=1796212015; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8d9il6UmYnHuFTObnPSAKSL1Qx/DkpeI4Exm7zghUTA=;
        b=BNgmptiFLIx8MXEblNwUxBF7an3q4V5J9KErWCdEwNtRqhJCn0sd2UHmJJHXkn7chL
         dt2Sk3D/6POZ3KBRcscIFRD5pk/8H+fuQljDSF6fIY7MRmTHgt6PIYzn3b/5SOuYOjP5
         njUArmvofVHwg8FLGLd2h3VSvGBtDJJrs0DKffS1ny83szEQhT0WrrDJkEqRlNEI6AKP
         G863vRf6m8Xe6M2uleH12mh66rIy35tgEg/5U0B1tB1DFuORXauieieybukiDeFbmqT1
         ysDfag+3vyq+b94Mtaeh/f+EdR8pxocn+nmZP8+3wyjt+BSEPE+alBWyKt3mOuxjAmZx
         EpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607215; x=1796212015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8d9il6UmYnHuFTObnPSAKSL1Qx/DkpeI4Exm7zghUTA=;
        b=ayf+gJq6iGVvTwAkGi6tfNP0f4M2B+kcNretjeDyndmOvXXX7Hbf19VDsgSnPbKs2O
         oHwAYmPrejonXGLyLJHIrm5SvyMLjXe7ybqeKJXCiF2B8SVIO7w3Yy7OPDDQ4zSrf+A8
         IBF/Vlq9SSfHQIc4+c17v7CLKOhZuctpmcW7YXJ6W8BQzW+Ki2Ex1YRks4D1K5SksIHh
         4ON/dJ8cj0asCO28s+++EBVa4z+DD3dFvf1k99r0ytsu/DypEzVkjNzxYdFuQ7wseCPj
         KPDqlp6EA5iabk3jMkn5F1pIjFSf8xJC6FxE1oNXO6YhEVyUsN8ywhzrlkhQA3QS2wkF
         kATQ==
X-Gm-Message-State: APuU4Z/ANC4IorO98WhL2qzmNfvV2EUD9IWtMpmvOd6Euj8s+4onMnKV
	TuG7j4nO0uXTP1IQ8gk4zUTLey3gO4Poom/xLv0zRFG6RopBFpNitqsOc61sYg4uHGKldruSriM
	e/pry
X-Gm-Gg: AZFdTZc4WSCemNElXCoxWDOHDhXw0MLakG/WlqXr0+yuhVGAvVZydnzniUN3AJAfGr8
	KJ/a1nWfxzMYQVyLypgINi+ZC6ufXvp6Nl8XWcYAh46MRu49qM5I+au7aX0KdzWqs6Lf/TsFfuE
	FYIwW0dzINGH5NZO/R/vN9sBQT5P/JpaAJg14W3OuNK9V+qTznIaWdHpAUFCwrJxiX1z4qThaA/
	sio5Wp80z8hJZm3mdZPXyY5vpLoGVfMbocH5K0VjRradJwsG2OWZH8ezsRmJhuPMupZCSC5qn8a
	Lkis8/6W6X/wF9tARAgPJ5LFfnudlh4+UPN+BCxCZZYQpCQYWvMLmXSY9qfRFFv1ZtZYBmW7fqu
	LP+oeYpF7lUOuCeZNBIpczjcqlwmJZdf6276cIpMLS7Jz+1n16MKG7BEt2AtVeTDz2C67kzF3Yc
	s04B9yl0QrFHMZXfP3syGzowZPF1wZcetNjQi3+A/jfeoDyzhi8XByJL/29tyn2yw5KcZtroE/3
	smsQ+Gk7cHG58a2JFmUB5yY4YSot2yrmSi2NT/nGvM4BSz5NR2d9LVtXyACXK7n6XlksTXvv9G0
	VSs1/BuoUSdSMRQQwpgBYKdTtMsuEmaqihR4YMQ2zr4TiNBsNvmH09j54pDc8U3PHIIECcoIz3A
	8lPcNAV/i8tSRb364
X-Received: by 2002:a05:6000:4382:b0:4ac:a772:6485 with SMTP id ffacd0b85a97d-4aca77265d4mr33622420f8f.31.1795607215378;
        Wed, 25 Nov 2026 03:46:55 -0800 (PST)
Received: from localhost (p200300f65f19a9043ef7230869dfba63.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3ef7:2308:69df:ba63])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6ae2dd55sm32783826f8f.30.2026.11.25.03.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:46:54 -0800 (PST)
Date: Wed, 25 Nov 2026 12:46:53 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH v1 8/9] HID: wacom: Benefit from pointer typed
 driver_data in hid_device_id
Message-ID: <awbKcWrqDeLYFIrw@monoceros>
References: <cover.1795589119.git.u.kleine-koenig@baylibre.com>
 <23d19d751aea2d855bf1360fd4e84cc30d0fc8ca.1795589119.git.u.kleine-koenig@baylibre.com>
 <sashiko-outbox-232815@kernel.org>
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
	protocol="application/pgp-signature"; boundary="ksyro2nhrrdsx2fd"
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-232815@kernel.org>


--ksyro2nhrrdsx2fd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 8/9] HID: wacom: Benefit from pointer typed
 driver_data in hid_device_id
MIME-Version: 1.0

Hello,

On Wed, Nov 25, 2026 at 07:34:34AM +0000, sashiko-bot@kernel.org wrote:
> > @@ -2670,7 +2670,7 @@ static void wacom_wireless_work(struct work_struc=
t *work)
> >  		    (wacom_wac1->features.type >=3D INTUOSHT &&
> >  		    wacom_wac1->features.type <=3D BAMBOO_PT)) {
> >  			wacom_wac2->features =3D
> > -				*((struct wacom_features *)id->driver_data);
> > +				*(const struct wacom_features *)id->driver_data;
>=20
> [Severity: Low]
> Should this touch interface assignment also use id->driver_data_ptr inste=
ad
> of id->driver_data, matching the stylus interface assignment above?

Yes it should. Will fix in v2, but I'll wait a bit for further feedback
first.

Best regards
Uwe

--ksyro2nhrrdsx2fd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsGyqsACgkQj4D7WH0S
/k55Vwf/RZOAJuFnrv4bBC3fA7lNgaPPekk+ddBeqjs3p/0hHMG7pfqk6org8XG5
O/kXx3VdMYpSu64A7oENJ6E24VRYDolB1XfDfJaawGGvruR9nP7GTXMz9h8907J/
8WnDVYNzn9IcjAjy5nn9BY7OMzWkpgzVL7A6EIxRRhUIFkTCAYONzCHYkN6JKnaO
zU769vpcwkw5AK9P/pvSl42WBM9d5nI04ZuGnwScAiBvgXsFl64H3lD+RfQuGyxW
HCuvaLAu14F8ovmzhex+rr93339MoQyLHogK2faINu7P5x7W798SW1ux4rmIxxuq
30DEE0k8narZX6aQOMI/Psmf3D60HQ==
=7dAp
-----END PGP SIGNATURE-----

--ksyro2nhrrdsx2fd--
