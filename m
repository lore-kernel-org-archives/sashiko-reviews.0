Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD06222565
	for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 01:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780103789; cv=pass; b=nytRJngHYHk5GZRb07a50plrmbHUdkK+rgsXk0uT4IABXW4hiFqZjzEEspR7fNxuUTGfJKN11l8nJ/bJY46CsTzUyp9RpXiupdp2bhPZwAHee92K+181a1zALOmitjAFryNOHKCAsjMuq3q5I17vYivhsOMhdMxGRnXCHfZUlk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780103789; c=relaxed/simple;
	bh=PVZJKq0QZpDBs29p42qzJsANdYgSGTjFMDU66TixMSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vih5yDRAHcCyVYIZbj+fGD5Hv/7qwALvJ34Nqf8qzhbArxgS+FKi9P00pDzYMzlL1AVtTnjlVhHHlsV360MllHlWOwj/8VeZIUXA35IgLZfUcpEEbhJ3DAjJyghMCXesI7EaVOkhnvYcVD8O1u7grxv2xdKvlwySKVTIdjyWAak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFXKqb3Q; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFXKqb3Q"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso125284705e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 18:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780103786; cv=none;
        d=google.com; s=arc-20240605;
        b=Cn52bNstcVq42sZmvz+akGo1MOzUEcdTGUT7fQ97TxOJvgLuzp0Ftbi65Hkhd0vEo8
         WIuIZgnZMPPp9O0blzpLRZ5X6GR6yHZ9XspfKi0lqCVbX4BPDLiZpHyBpTu7GMhGX0CF
         1jYrLEdCJSBEdU5SvwbGqLGAMokuWd7S6NMk2bFvsUlg7cOXT3A2zASyp5uVrnFv6uDy
         P/7ke76+6+ib9yowmHyGm5wK5Ffderf+tT2PUjnNvC/y6DKsusH0KKV5xeh6suZhEemK
         YpDuYL5PezdbUNjwF+8OLF+iZpVZnX7K3wvsh0fLbQy06GCw+7raMogB3kJnb7FLBGFD
         GAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uhtMF2ezlNaaALDfyaxkEF9+57T983SySMQAR7CATi4=;
        fh=vz3pN3PK/bu+NRXdfIvIk2p5+cHuimYs4qHOOK8kDks=;
        b=cPYChTEhz/PVijpI7K6EpBXNJHls682uKJ5RMBjRmHstLhRkrQABMYhyCFWPcGGkel
         FtJOsDAR3jG0PgIGqxZPGdv6zJ7W8zaIE2O9niUU30mSK71FlDi78/xODz3If0klab8q
         5EanSOfdPGu93Hwbrnrw2uwEsgUYw9JJPD45UK9kik925dGaMP+qI9F0iXIKk9pejpRq
         em/8wUXri9nP68AcZmSrb+irhjupyJ04D49WhuBEjUXa6sHMt2WCQY19+XFYDkS1rVJS
         46TPmV7OD8QOENT+MJaiuLkP5z1aKq7ZP61PkSLOPY8MU7hraDhMYiko+TDtukEzJlDe
         ajsQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780103786; x=1780708586; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhtMF2ezlNaaALDfyaxkEF9+57T983SySMQAR7CATi4=;
        b=DFXKqb3Qh3rXOxxDr7dZLW6mYnGC9lE7y4dC9L3Fw+hAjDzz05BAjulsaElFPyhDNH
         egEEqNi0WoQpOfE/jYc4UGaJVVaWR2gncwNBGbZGVKmJKqZ9r572YIQ85uUYYlBwi1yQ
         aHr1UgA8CbcTEIz7zMcmQlxNmWYRXRV3zhXSbXh11c+S9SrBh+zBwxg52d3SoBXchfN1
         K70hevLrFeuDBA1dw2XXSdrsFAZxozw5E2Rqwf7I1ehtm2Fn2yxxLVbYNm64W8jS+seU
         N1jOmDljW+VmPlS/FGJEvzvyYnIEzocq4CCRu12PU2e+e5S85tdbTMIEousf8aX8eLln
         t1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780103786; x=1780708586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uhtMF2ezlNaaALDfyaxkEF9+57T983SySMQAR7CATi4=;
        b=PCB0wp3mHP5CPKovspYyVzy2j1uKAQ0QylR0OwVj8Uh6oYTkfaltZQTVHdMdnJE1ai
         50OZmoK1sm9JbauDsDoNsPO/trJX+JrYcWl8+EYM6z6zL/w1lQGwuzOQ5HWt+03l/urJ
         vchFXgg6YiFtDmV9fQtK6FI8Dgf5sR45CPH7Yg3gbwUPZJ+TnDt+4eDLFW9sM5/tVW93
         iKv+lYLY6wNard0pPA1ggcR56Rw5CmDgsCAgyRiANEWZ3t14dYSWLv+PmmpYsDSfnqLt
         Vbz8rFLj2AqiQfhlksMHmDkIAPmwmaI93rF2+rxAeWoQPYYT2mFuvcmYADm53wDwQVUH
         QTwA==
X-Gm-Message-State: AOJu0Yxwjgmuh++TQDUWOD7HaVk2f0rkHcQ/v8Yc8pTEIAUogZZ0jL7/
	TOh5R0xEd8TOWuPLF5S9UKyHdSk6ijPO7bJQoZu28FIlArkVOdUxI8FcjGev1UNBL2BHlobefG7
	MPwQXIg8GAbagFH4DCNxTsyrWYQaZKa1ji/ERMtvVtQ==
X-Gm-Gg: Acq92OE2JIYgJ56mcZMQFHEa8KTcATOqG0HEqdiHZ1udT7p8pgM1ktot35mrzAmCMsb
	TD1V7/OD0psVcCAVmTBuhc0Y4ueyqVr//vBJ4rxJCRkog3mEr4HtqThDQEtdncXSxHvQhZQ5JY5
	cyJGHofAIrGtfyOnzfM68iCFhsRTzdlE9zwTuwSLP1GsQQzifBhQC+shD7zPeDRiZs4IjwsY/fy
	J8u0ioEkMpGDl01zgLSIyIUUV6G6BQGGtf/HjT2c9fVxMPGBJlwtTTPAlh2weF7KFcd+mL3tTwK
	5o8ie5jQtNAEe0V9d5A52Ni9UMlj7d2hVSBnBLzoLIPaQes=
X-Received: by 2002:a05:600c:4e92:b0:48a:7aad:4425 with SMTP id
 5b1f17b1804b1-490a2901aefmr29792325e9.3.1780103785647; Fri, 29 May 2026
 18:16:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529213506.37462-1-jbishop.dev@gmail.com> <20260529220113.CABB41F00893@smtp.kernel.org>
In-Reply-To: <20260529220113.CABB41F00893@smtp.kernel.org>
From: Jeremiah Bishop <jbishop.dev@gmail.com>
Date: Fri, 29 May 2026 15:16:14 -1000
X-Gm-Features: AVHnY4J1EQplGx6EDAXNaim1X35PETCeRy45Nv7d4cYMfuCuj0QUrBJHVErQBa0
Message-ID: <CA+TTa56LOHAadhpVe0dcttVHHCp8m41bLLoO-DD+tLyCmLAVfg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: convert PXA USB bindings to YAML
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, and good catch.

ohci-pxa27x.c does indeed explicitly request vbus1, vbus2, and vbus3
regulators via devm_regulator_get(). I've added the corresponding
supply properties to the schema and will include the change in v2.

On Fri, May 29, 2026 at 12:01=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The `marvell,pxa-ohci.yaml` schema omits the `vbus1-supply`, `=
vbus2-supply`, and `vbus3-supply` properties but enforces `unevaluatedPrope=
rties: false`, which will cause valid device trees to fail schema validatio=
n.
> --
>
> commit 78f580ae03eab5d588221a2a8289471c77c1c517
> Author: Jeremiah Bishop <jbishop.dev@gmail.com>
>
> dt-bindings: usb: convert PXA USB bindings to YAML
>
> This commit converts the legacy pxa-usb.txt binding documentation to
> YAML schemas. It splits the documentation into marvell,pxa-ohci.yaml
> and marvell,pxa270-udc.yaml to provide machine-readable validation for
> both the host and device controllers.
>
> > diff --git a/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yam=
l b/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
> > new file mode 100644
> > index 0000000000000..3f7935384b9f5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
> [ ... ]
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +
> > +unevaluatedProperties: false
>
> [Severity: Medium]
> Will this strict validation reject valid device trees that provide vbus
> regulators?
>
> The PXA OHCI driver in drivers/usb/host/ohci-pxa27x.c explicitly calls
> devm_regulator_get() for "vbus1", "vbus2", and "vbus3" for enabled ports.
> These requests resolve to the vbus1-supply, vbus2-supply, and vbus3-suppl=
y
> properties in the device tree.
>
> Because these properties are not defined in this schema or inherited from
> usb-hcd.yaml, and unevaluatedProperties is set to false, it appears that
> any device tree describing the vbus supplies will falsely fail the
> dt_binding_check validation.
>
> Could these supply properties be added to the schema to prevent validatio=
n
> errors for existing users?
>
> > +
> > +examples:
> > +  - |
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529213506.37=
462-1-jbishop.dev@gmail.com?part=3D1



--=20
Regards,
Jeremiah E. Bishop
