Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053AD388382
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 20:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780692721; cv=none; b=lsRuTpkpuQZRM7065euC7yxTDvLBhXKl+ur3ge3T+VYxGpxtpN9r5T+tw4+dpuHISkvAfI09WSJ6AUorbGR6fYviYRGQal0EF+uJReWqOkRBmbU/dEd12u/OjXcwF2wXAZTVXHwD2hnSdWUqcaGVKkroWWzsiI+WZRemSi9tyT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780692721; c=relaxed/simple;
	bh=cwXikz+lLbmRr5N7JJ078/Uw2Dp9IDZdcO75SW0+G4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdL3M7B2C/X7+kKq2exQ2g7Iwb/u6eij+ZkspBeBHgxACS946J1s2cNRHYnaw+hTed7vY8UZLszk5jQD7yNp6s8tkw/QYLN1/x9IE9OqjsgBCHqNyYEOA+NBXFVpiyKiTUzDWhds7GmGdQ3hNfaOW4EfRb3nc2TYsicRYg36XlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Hvga8Eh3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Hvga8Eh3"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45eee266c6cso1858394f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 05 Jun 2026 13:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780692718; x=1781297518; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4752DjrAFfM455Jumpwe99BPH46nw67ZETlya+2HAFs=;
        b=Hvga8Eh3xtnQBnAsKF90LRAItMfjODEvvysL6I+Wy2F5c+TWCq6YSy0CPJZ+YT/XO/
         QKMWYIRrtfzwi/rVZS1GuvdJVvtXNRhYothGJlYWmaYuTQpih9U5lMtAqPhz4YXV694D
         3kh9yyiXA4YpjmRp65zkQ+TqcQ7osAs913i2eqrj3NH2N6+UNrBP1k6cXLKzI850zlAx
         /utkq07TtdqS1LcTbDkVnWE1dZl8Ec6Oem7kngfvpzJUviHQv0OuV7rbgLqCEOG6bq0o
         DiveQ9gmlaoHJDi15nsPEhkxKMdC3v4qBBvkwXw1OUP+QYzhpi0jlhrQOBPnNbaGACx3
         /4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780692718; x=1781297518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4752DjrAFfM455Jumpwe99BPH46nw67ZETlya+2HAFs=;
        b=iR9UO1Z7u6AD4IPPXmbN5/gVppd2Ughq9MXObCQsykreu/aJ4coWvUF6jNbEkiXYW7
         KIxmcU40CsLY8Ie1FzQGvYILf2qTCsPbh5+0l9vrKQvAN9JGFRwc/7Ducn4+aOu1w1SW
         cY8Gzi9YfsDNntkZKSGKlcMtezZBLIcgTK6RykGxvSuEIirbXy3hq/5VngPbNw7Nkw1Q
         a+1rQJjBBGgq9aO0njq6u1UW5cn9EeYkenkHNE3pbPQSBdx72RXF0OIjYAV25z+nWbfV
         +sEP6/nSyWEESvbGhiQI+RSnoLvgJtrRm3BU4H3dbQWBk9ZTpXyZYLijXyUV+zX02px9
         CZGQ==
X-Gm-Message-State: AOJu0YxTFEST+YhOli3u7v/8S94+CrS6AzPBFneEuE/8WVKWQFGGpWGm
	ACJxbjJTJlNWnSkGPgOghjLbvHyHC6qYRrNLnJvAEm5oElxon5JktwgWZ287bmcGrcc=
X-Gm-Gg: Acq92OEf+1r/47s4l0GA4Zn2Q8cLu7ELp5b2dTZKlnst/cm7P4QyuB77Eie36QZm/4X
	qJIUal8RIP39lLgnThQ9yQhwbLnA9zT76YXJBMLQgDEQTl5bw6H9XnvDthYFfYvm3kartv5MB8Y
	0CtjaCL8gQt+1X3R2pObcPi2DgtzuL5J0ZvdfGEww6Dm3jINjHRIpQnxPc/ldT9wRzpe3/0qmod
	WwJYowGy990jc8nc3FGmrKySL7nCTOWr25zaRbLKWWehmmFMjsS6cKt7b1OIh5MZXtBejlrZbeT
	Y/zjrsl2yqwg/3jOyjZRHseMsfJXgJV1LfWca6hdaKXAw8KIo4NLi6utgUSctEsbeotV4CZevRm
	HzswgejNC+o5FdWQ5m0CGlLoftZV5fjR94PL1LYjZUPzmXmm/VJD0t0mKRBdLNd6bKrWQc0vEIA
	5QP/pf5NSvDdU/OuPNuLiq44Dy0K9K4QyDu2g24Zlo7DL7DW526Q==
X-Received: by 2002:a05:6000:4697:b0:45e:739b:3e43 with SMTP id ffacd0b85a97d-46030186d90mr6010770f8f.0.1780692718359;
        Fri, 05 Jun 2026 13:51:58 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f35133csm28128682f8f.25.2026.06.05.13.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 13:51:57 -0700 (PDT)
Date: Fri, 5 Jun 2026 22:51:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v4 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <aiM0VlVXAWs54v-G@monoceros>
References: <8eef956a5eb473f051bbda89ec4c9991c1b47de2.1780498640.git.andrea.porta@suse.com>
 <20260603154716.1B5C41F00893@smtp.kernel.org>
 <aiGAINsTG8VZLn28@apocalypse>
 <aiHn5-gQMbjttrR6@monoceros>
 <aiL-DWqU5bnIPL8B@apocalypse>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tyzbnupcwsiwxiir"
Content-Disposition: inline
In-Reply-To: <aiL-DWqU5bnIPL8B@apocalypse>


--tyzbnupcwsiwxiir
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/3] pwm: rp1: Add RP1 PWM controller driver
MIME-Version: 1.0

Hello Andrea,

On Fri, Jun 05, 2026 at 06:49:17PM +0200, Andrea della Porta wrote:
> On 23:28 Thu 04 Jun     , Uwe Kleine-K=F6nig wrote:
> > Thinking again, the tohw() callback could be a bit more clever and also
> > use period_ticks =3D 0xffffffff, as this fine if duty_ticks is less than
> > this value and if duty_ticks =3D period_ticks =3D 0xffffffff you can st=
ill
> > configure the hardware using period_ticks =3D 0xfffffffe to achieve the
> > 100% relative dutycycle. (But keeping the current behaviour is fine for
> > me, too.)
>=20
> I think this is what it's currently doing in this patch iteration. I stand
> corrected here when I said that period_ticks should be at max U32_MAX-1: =
logically
> it can be U32_MAX but it's getting 'translated' into U32_MAX-1 as the val=
ue which=20
> is fed to the register. So the period is still U32_MAX, accounting for th=
e extra
> tick at the end. So I guess we're on the same page.

Not sure you got what I wrote. You can use the maximal value possible in
hardware, because for all but 100% relative duty cycle it works as
expected. You only need to map 100% relative duty cycle with that
maximal period to a different 100% relative duty cycle setting. I think
PWM_DEBUG even doesn't yell at you for that. (And if it does, that needs
fixing.)

> > > I'm not sure whether an inverted polarity pin shoudl stay low when di=
sabled.
> > > After all, the inactive state for a reversed pin is high.
> >=20
> > Sashiko's concern is correctly stated, if you go from
> >=20
> > 	polarity =3D inversed, enabled
> >=20
> > to
> >=20
> > 	polarity =3D normal, disabled
> >=20
> > the output stays high, which is active for polarity =3D normal.
>=20
> Ack. I'll set the polarity first so there will be no uncovered corner
> case.

You can, but as I wrote below, being lazy is also fine.
=20
> > However the behaviour of a disabled PWM isn't specified, so any
> > behaviour is fine, the only objective is to save power. And if the
> > consumer relies on a constant inactive output, it's supposed to not
> > disable it.
> >=20
> > For me both behaviours are fine. Making the hardware emit the inactive
> > level might prevent a surprise if the consumer isn't aware of the
> > missing guarantee, but being lazy and so surprise the consumer is also
> > fine as this might uncover that wrong assumption and allow the consumer
> > to be fixed.
> >=20
> > (And not all PWM implementations allow to configure the output level, so
> > a guarantee cannot be given. Some go to 0 irrespective of the configured
> > polarity, some go to High-Z.)
>=20
> I was just curious about sashiko saying it's violating the pwm framework
> expectations, while according to your words it seems there's no constrain=
ts.

In doubt trust me :-)

> BTW, I've tried to install sashiko and use it on my patches but it's obvi=
ous
> that some custom settings are in order, since all I can get is some error
> aborting the review after 3 attempts. Any chance you can share your Setti=
ngs.toml
> or any customization so I can test it in advance before submitting the ne=
w patchset
> or do you recommend just throwing the new V5 at your script?

Note that sashiko is not "my script", it was setup by Google engineers
and I have nothing to do with it (apart from benefitting from its review
feedback). Kevin (added to Cc) tried to setup a local instance with his
Claude plan, but (IIUC) it quickly ate his day's amount of tokens before
completing review of a series of only 4 patches.

So without knowing the size of Kevin's or your AI plan, probably it's
easier to just rely on the public instance. (And IMHO that's nothing to
be afraid of, just handle it like a human reviewer. For these you also
don't know what they will reply for your next revision.)

Best regards
Uwe

--tyzbnupcwsiwxiir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmojNukACgkQj4D7WH0S
/k7yIAgAuG/1LknG+8WFsQWqsfZx2XFKVf2uKi1Dn3FMvb2WbA9LQRZl44B9eRgH
vhBZT+pohmM3Aiq+1QbBgbcs5W+EtAP8YzX4PJh16EYJzoeYr5f+SMJN3Vo5p7XK
EqFWKwsGTtE5TnZt+YyZsEE4ofpCEQkHLNWnu//EisOWGMLDLeGlmZ4hp74dQfFy
bezEPihHw78I/Bhzm6Y9bBoeufvYJh6uzkBkM88QwCbEhYGeZDrlGgMmbBtLB6fI
0JAEOB2cred6vUkvLhfPdVxAC0DEC1QTPtwgbGBV/bcWIfNWz1yz1H3B0Kx+Djre
QNy0bli78fy8sSZC/fXQ9mfEowYUxQ==
=zWWX
-----END PGP SIGNATURE-----

--tyzbnupcwsiwxiir--
