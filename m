Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4448235836B
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 07:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784188212; cv=none; b=kBgPMpW9TcTBLO1VYPQ9B5G8ckyZu/Pk9nMhywUct1dMFBvWp7gKnvBhEpz+mevAG6MKECoww/BjFKH4vuornAE4ZNJ45Mi2qOY2zo8Tom3e3JqaEEnsl0oHi3UtGuWaTThwGGMFGOMluwg+4KWJGEcP3zF24CCDOIqTKN2CNz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784188212; c=relaxed/simple;
	bh=WSm5DvyF8kAHJUVbVgOYyfVr+aqNLZrjwo3Xgdhidzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0eI8cUf6KRyoZYnAxSH6nxqeyxm6lGSH8aEUOiURhfucsgHGTy/oDc+MnEhr1TBQuNSk+bG3ZYZRmHW6gIf08hTzEo1WodoX9/lejcvrP2CvHRWfLt0SDltBerbX1RGzTHlVj93u8Dznk5imu+tWC1Wtf8XU5d9ZvuupR01kTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Mtsdp8Le; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Mtsdp8Le"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so22508045e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 00:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784188207; x=1784793007; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZHFPco7TSnfWS2raS1ySQoxI4o7bq53nli6SfJ3sWqE=;
        b=Mtsdp8Le5v1nEVbnKEnARuBun0o2iQR81lk3fMfDInQXOhOCmTuhHgBB1WYMPU2+23
         MDs97lq90R10ugznShYEmK+J/0OAe6gVzKUEVL8LPUKvmM51hTfQbxeejeAUfsnmgr8J
         RVvHI31FCbML7Djc7d0tT5kl7Us1Tsrh1JJI3TFEJNT/Usmp9Z12UNaHv35b30qI2AnU
         JhEPWyQj/neBKEBROOM4yGw3dbExhFFJ/v2UeEMdJZSl8rcn6yf5ncf49EaQBKb6R1i1
         PIX96JnEuABqVgXr+88Ak0fyaYqMchQ5ZlGsSCCK/73yOSmKglQpBvAET3D1EWJBjG9N
         N6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784188207; x=1784793007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZHFPco7TSnfWS2raS1ySQoxI4o7bq53nli6SfJ3sWqE=;
        b=Fam2FPtNEalM6Slb/3R9lgb1BmqR0XtBmn5ZxCMI0qaG4QntSg8G8N3atrYxpjaQWo
         zwDxn99aXZLtoJQhzGNWh1ciEgamw5FNb5IRocMGiHO7B6w4xRT6EE2231Y1DO+N+EcR
         uCDG5rx6afoZvRy4YDT8vBL2mf0zinV1Pz/kd9huxmC6dOf28jIvApm5cXIxy50yJ568
         kmdPQ84plwGwkZXIP9LVBgPRiUVoXVg7WdAcw19OjJB9ZFesCdb1oUhuPBpaVMWFAQVa
         K1aHG2nkoCT65/lIyJj2nDAV9LBDW6i/XcXWlIHXnWubpcvNzaUG/7WUrLzhfkO6Iquv
         yV5w==
X-Gm-Message-State: AOJu0YxPjE6BKQWLS4heD5dbGHDIuwBAcloCYQEf1E0Bo2qHUrI5Trwj
	Agv9QQFJsJdEE27Fqho9xbgPyfgH5QRDSZXzjL1KJwJgNwAl43R8bzmww1YStL6sY3xNLNPmx/u
	wlgn+
X-Gm-Gg: AfdE7clEgL8V/jLbbCfWnsf39Sr+aC38DxNDZ4eQOZ1QArTlAOJv3w5GnhVycUUs1D5
	RXuepSEPOiAAXpBQQHLF/Cb4Dgv7QuJFGLwaiVurzLLrZLxJdrQHsRH9yUcmsvkKO9Qp+aGN903
	eI8c+NlCvBIeHpWr7jBqw6h4aP4vWTGhjCAD8s6BaaMRlRfF/LQI/2OFcr5+VPSWIAroJVXc4e5
	Eds5O1r4otDXptFhjXsOwT83c67z3LHfO9bIR+5UjnwzQqBeVsbv4jiZIJmS9Q8GBlwIn5fEWED
	qsbyxEuLtVhc8md6ZFkx+akD+VhE3HH4wZWIvbmLSqNJsGyK/yLPo5e5+8RnoH93FTdd22rrMWv
	YSvCXJ4R4Z/W5I/f8ULdqT2DSQT6tjrxNF0paN5Cb1zS6B9LRWY4ZebZnJp3U2K7WYZ94MqTclF
	IAajjUkflJ7lPHr58JIRRE7VXY5GKdAxLFyh8gluTkZX2cVozBQCt8zDLfr/aM/4ca7g==
X-Received: by 2002:a05:600c:a03:b0:495:4572:21af with SMTP id 5b1f17b1804b1-4954572224dmr31265e9.9.1784188207461;
        Thu, 16 Jul 2026 00:50:07 -0700 (PDT)
Received: from localhost (p200300f65f47db046a548a0537ec1e67.dip0.t-ipconnect.de. [2003:f6:5f47:db04:6a54:8a05:37ec:1e67])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49541e53680sm35386345e9.0.2026.07.16.00.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 00:50:06 -0700 (PDT)
Date: Thu, 16 Jul 2026 09:50:05 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev, robh@kernel.org
Cc: Biju <biju.das.au@gmail.com>, wsa+renesas@sang-engineering.com, 
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v6 02/11] dt-bindings: pwm: rzg2l-gpt: Document
 renesas,poegs property
Message-ID: <aliM3iVA1LY7tW38@monoceros>
References: <20260604095647.108654-3-biju.das.jz@bp.renesas.com>
 <20260604100619.75EC51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dlfpmfyr2hw5fshj"
Content-Disposition: inline
In-Reply-To: <20260604100619.75EC51F00893@smtp.kernel.org>


--dlfpmfyr2hw5fshj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 02/11] dt-bindings: pwm: rzg2l-gpt: Document
 renesas,poegs property
MIME-Version: 1.0

Hello Rob,

On Thu, Jun 04, 2026 at 10:06:19AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The `renesas,poegs` property improperly encodes the consumer's=
 channel index as a phandle specifier, which is a Devicetree anti-pattern a=
nd breaks standard phandle-array parsing semantics.
> --
>=20
> commit 9d7f9847d3f320fb715022b6159c9c7e869aeedd
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
>=20
> RZ/G2L GPT IP supports output pin disable function by dead time
> error and detecting short-circuits between output pins.
> Add documentation for the optional property renesas,poegs to
> link a pair of GPT IOs with POEG.
>=20
> > diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.ya=
ml b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
> > --- a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
> > +++ b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
>=20
> [ ... ]
>=20
> > @@ -245,6 +245,28 @@ properties:
> >    resets:
> >      maxItems: 1
> > =20
> > +  renesas,poegs:
> > +    minItems: 1
> > +    maxItems: 8
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      items:
> > +        - description: phandle to POEG instance that serves the output=
 disable
> > +        - enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
> > +          description: |
> > +            An index identifying pair of GPT channels.
>=20
> [Severity: Medium]
> Does this property correctly follow standard Devicetree phandle semantics?
>=20
> By Devicetree specification, phandle arguments in a phandle-array are
> defined and interpreted by the target provider node, with their length
> dictated by a cell-count property on the provider.
>=20
> This definition appears to invert that model by using the specifier to en=
code
> the consumer's (GPT) own channel index rather than a provider argument.
>=20
> Additionally, standard OS-agnostic DT parsers might fail to resolve this
> because the referenced provider binding (renesas,rzg2l-poeg.yaml) enforces
> additionalProperties: false and natively lacks a #poeg-cells property to
> dictate the specifier length.
>=20
> Is it possible to redesign this binding so it doesn't encode the consumer=
's
> index into the provider's phandle argument, or at least ensure the POEG
> provider specifies a #poeg-cells property?

You acked the patch. Is that review concern by Sashiko valid?

Best regards
Uwe

--dlfpmfyr2hw5fshj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpYjSoACgkQj4D7WH0S
/k6tuwgAoYXQ694Z1W43wtbN4Q8kTFE8ndqpCfHlpuCbB0NRKCtNaHfMKk1OPa4/
0gPb9j+93rmTvlexpk6MtwSdwO+elEB7SbAsXmIFnybR+b3ciwZr+5LmGMRKBsw2
xorhAlS2ouIZjnTYBDcmaXZB1mpodWWYzDvRdimGK9+eX+DH2lPtNCJ6g9wRtOvl
F+YM1zXNuwWAxLoB6s2pfw83iG2CMLowNj4/q4rfmgFUHlWk0wOR2iDHDJDQbusJ
e/rANSqVjpOz2hIl/Dz/+gJpUPQKph6siwen5swjqmVtIkTBW8L3YYc7RIhBkVA+
J7364EUYQSEfnSx+nNBE/CnQWmhMgQ==
=SEOL
-----END PGP SIGNATURE-----

--dlfpmfyr2hw5fshj--
