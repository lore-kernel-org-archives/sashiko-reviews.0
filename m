Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0F630C359
	for <sashiko-reviews@lists.linux.dev>; Sat,  1 Aug 2026 18:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785610106; cv=none; b=DgTJXDejLsPODPCZNiDQkSAeZb+zg08s2xO3CzmFZYrGQAwSpYFqMVSl/04UntCyzPyqRsG9DUNgpijVlBr+Ifc7WITXJ9E+cG7cCfX7Q2uZlfZFVCvVICVh76tjQTWM6JZ3geBpQV1L0/p2Gh8fkMlBt9oYe2/Sn9wJI80RCUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785610106; c=relaxed/simple;
	bh=ufZjQYNYwRJe0vDxy82luZFUAE33wwScHtnNQlI42rg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hEu+4Pl7MRZDkNlQIVdXdGxuNX2uiIhP3FR6AIncjtObbaVZFf9Zs0WA7US4lBi1f/lzd2dda4KhwrriyMEa0/Ry+4yDb0CWGiVfedo/O5pOm6tWVLMIxt1ujJLozuziCug/yg2Wy9GXpKDvaf0da2Q9YD6FDMvmxa6Rp7WjdpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=11NXZxy9; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="11NXZxy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1785610091; x=1785869291;
	bh=CvZbYjbSQa8kn64KiuOuulQLZHC116MoEncgBbB6c0M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=11NXZxy9N52kwgv3uH0VfAU9pkkB51FOm3VhYdVkhCz8UNczk3EDfXgWsOsUFgf+F
	 pNBmYKWiekQr23ZxWZQpn4dNGNHYdPcUPCWxgTCIHuILodohkBBMZdH3Zink8Sjzy7
	 Dy5WyJW2eJQtqaxksW86txo22GpEyzRVxEi8SoXUrWN5oSUOvuC+KTxtzExZ2KK8c8
	 piyDkUvzVr7jbvZhAKLWNA9up5Kp6AZQU6t5yJt/pyP8n45+4hr/UoQYzdZgC9sxq/
	 FE/bNlDNwhU0KE6MSYlTLUoybpvYzmmQiROKkQ7eqR7uLY1DpaMXE28Q5r9MdJnZfY
	 6b4rwnexo5JGg==
Date: Sat, 01 Aug 2026 18:48:05 +0000
To: sashiko-reviews@lists.linux.dev
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: platform: introduce EC for Dell XPS 13 9345
Message-ID: <iUJeQnFq6lw9U9ipvL82EYRy70lZOcypNHSiLnyV8L05dlm2QcfoviWgR8Z5ag6phb_fy8Fi5b7SY-rsPT9WXLumJP8zciDDFP3fHLYnrM0=@vinarskis.com>
In-Reply-To: <20260801183218.EFE6D1F00AC4@smtp.kernel.org>
References: <20260801-dell-xps-9345-ec-v3-0-9f4bdb5a5dad@vinarskis.com> <20260801-dell-xps-9345-ec-v3-1-9f4bdb5a5dad@vinarskis.com> <20260801183218.EFE6D1F00AC4@smtp.kernel.org>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 111ccd7faf581cfd21ea95c4db89ff2e2f6fbf00
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable





On Saturday, August 1st, 2026 at 20:32, sashiko-bot@kernel.org <sashiko-bot=
@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The device tree binding example includes a nonexistent header and=
 uses undefined parameterized macros, breaking schema validation.
> --
>=20
> --- Patch [1]: [PATCH v3 1/3] dt-bindings: platform: introduce EC for Del=
l XPS 13 9345 ---
> commit 260bc940f745039b1b740f5fca09f58549473355
> Author: Aleksandrs Vinarskis <alex@vinarskis.com>
>=20
> dt-bindings: platform: introduce EC for Dell XPS 13 9345
>=20
> Add bindings for Embedded Controller (EC) in Dell XPS 13 9345 (platform
> codename 'tributo'). It may be partially or fully compatible with EC
> found in Snapdragon-based Dell Latitude, Inspiron ('thena').
>=20
> > diff --git a/Documentation/devicetree/bindings/embedded-controller/dell=
,xps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controller=
/dell,xps13-9345-ec.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-=
9345-ec.yaml
>=20
> [ ... ]
>=20
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <arm64/qcom/qcom-adc5-gen3.h>
>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

It exist in linux-next, namely next-2026031, as per series dependency.

>=20
> [Severity: Low]
> Does this header exist in the source tree? It appears to be missing, whic=
h
> would cause a fatal preprocessor error during schema validation when runn=
ing
> make dt_binding_check.
>=20
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        embedded-controller@3b {
> > +            compatible =3D "dell,xps13-9345-ec";
> > +            reg =3D <0x3b>;
> > +            interrupts-extended =3D <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +            io-channels =3D <&pmk8550_vadc ADC5_GEN3_AMUX3_GPIO_100K_P=
U(1)>,
>                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^
>=20
> [Severity: Low]
> Are these macros defined anywhere? They appear to be undefined and used
> incorrectly as parameterized macros, which would further contribute to
> preprocessor and schema check errors.

Exists in the import above. Confirmed to pass with:
`make dt_binding_check DT_SCHEMA_FILES=3Ddell,xps13-9345-ec.yaml`

Alex

>=20
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-dell-xps=
-9345-ec-v3-0-9f4bdb5a5dad@vinarskis.com?part=3D1
> 
