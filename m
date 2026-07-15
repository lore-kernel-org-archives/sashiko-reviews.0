Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8908F3128D7
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 06:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784098552; cv=pass; b=f5uoLo71nmaKP0OCg0cSkLnbuu4wbyrQ7jXzmLidHeFRBbzzEOhyNn/B9iKG3MFDh7gu5ZrHtr3YTM5ShZAAvZRJKFcXMJwiNrIouK4ciBIxVVO+9olQfL05zftJ87AXvEDkH+zaNFjkAkuchJEikEkDDmNLXtYCn/wcLnuKmMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784098552; c=relaxed/simple;
	bh=ifJqXZ4ZAmIfzckP1/3gX562cvXWbJvgz42X1CY3OO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehbYFHDQ+4dkA8NTk1A9vq99380B0r1e/9eyblXwtQregr5SzogBKoxUo7da3e6+CXW7KIJYQI3QJ5UpKrgA3nRp2Tdj7eXRUyoVfyIUD6v0teqM0z1euIbErQcq/RQgAoJGy07LA0oRuWHqoWswiN1xBw18xL/zoeNf9WKIqh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCVq4JY9; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCVq4JY9"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-664ae043b7fso259630d50.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 23:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784098550; cv=none;
        d=google.com; s=arc-20260327;
        b=I++jP7qRo1lF8OCB+R5fGYXzOtEx52nQu7pBEqJClFX59ZRuTtx9p3bIl/8VEyyCip
         ovnu3ZDkFs1fWUbQx1E7e/BisaljhmZGMGv9XCbvWBUhm7LNIIxjfnawwYWe3pAzm1rz
         YWM2WwPRFkl589nyPMVjvMYI7wABO0o+Yq6tomdVZokiCBa1kNv3NoA3vK7SZ5MUvvWr
         U08Nebtj5+rtTI4nhVFlrzFz8p1K5yQf5KQbkIWDdHaFhxKZ/ZFRqLBeIjtCITzUv4Gf
         tF8qCgU5bfSOPtj2t7GFyY9eepuKanmg2DBYM2Y8Wpk1sXApQlIWY40E4WqRyplO9+sh
         I+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z6gxrK21sxCB/eCMN/j8yC9AHCK9IHMw89lMoZ6UyRY=;
        fh=ZaGNrc5GIufehViV7qek72KztHasET/nLnaBFv9LDoc=;
        b=mORG/vMsq7aWit7SBVVRzhr6jI6/7Jflsh1SqgASH1ESxZBJxDHLI8WT8EvQny79vR
         kGFSD6FRuFRGcMhOBwHl/GdGiQ7FILuUn7t+3211pENc4X4QE/CXZ6qrsqcfk4Hkt7zl
         /YNSRenA3tV3J1CQS/C2neDj3FTktHmnPdN1bc1hWN22IJCFhPvoIuyeU3BHWeJarv9B
         InDCWByI0ZMmxv31vIMnQ1JfACwSIi4uJHETjX2E8tACLthtntoLqcBrKzzxkH2Ko+iz
         Kep3pA9bQTSGr6yGGHG0SOcOgrHxM7jZPfmVgGmFREbw18zSFr/vEGu1Iajtk9H1n2C3
         reCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784098550; x=1784703350; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z6gxrK21sxCB/eCMN/j8yC9AHCK9IHMw89lMoZ6UyRY=;
        b=gCVq4JY9mzoy3KUkLKHYANi64Z00brXIjKKuYMWCv4V6Zn18PjUpTxpytNI1VjmXXL
         Mamq0Rqgc39dBR02UdWG7uk8WDYlpnHBrBBS7I5E7eotjhztQew+xe3aRzyKC7RhHnN/
         i9HQtVRboB1Pmaqo5KnsexyXRiSW7677hDz7gfgwzo77L9Y9iyyPU4xR5CrqrgnIp3fQ
         h0sQFN5dlHa6RcAtByZmkbKduDiqv7odCP6U4aM1SLTiQoTbHgHeJZGzy+fMtQnJJoi3
         p9NGhUdWP1UTl8O1Bgghob2VTkqTcnW19JMtLpRFDFgcCD6MMEmX3XhDHCQUYZt4dp99
         ISYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784098550; x=1784703350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6gxrK21sxCB/eCMN/j8yC9AHCK9IHMw89lMoZ6UyRY=;
        b=b0xwWBeDmKQinvqHvHjB2x62kDPu7WTQ7mtpB/phFg7K5Gu4WbISZe0sp2sbmMGKpC
         tt6UaWnV/URWQUUWP9N4sBPvbs5SrBM+NqWc/S49V4wpg5kKgrJnkzjDoS1U0ade9puy
         kx8DWrO/hS+RZGsrnQenLcuH6GjrKrTcSATRVPBcbYyd3A7o8YKBkP9PvflhwS7qcJie
         ulse9qgyT4dzHnJbO9Adz7ji2+0TFn8aSzVKiW63oN09AENG58AwSAKGLJhTc5kI0ELC
         lBjOXkKyR/DBrFKvr+1bSZkBadwjeML3LLyCN+KWm1SGXiAmOL9w/rxB2DMxsTP8LrcD
         eWZg==
X-Gm-Message-State: AOJu0YyFMJoYWloJA4gbjBEbgPEcyBDaQCOoDjZKexBS1DEVErwYB309
	6DSYk69AJssjACvs6tywZZOOyZE2RxE+9nzq2F2p9RLIC2lu1nFsjMh6btbjuuEs4v5dKEFXmij
	hWjQDJo2Hnt2umwXrY+GQxfS/qvWDlFohN0i8bmY=
X-Gm-Gg: AfdE7clY4iMxpFQSknN2DiGohFf8nwvsLto2M3OnhqlCe6dJ35VuQO/P9P0nIM+AT//
	FbiWtwUNF0ymrEGYMf8P1d4r1JcM+fvCoanzgr6DLYrgUcEEe5SghkAKyM8MkW5ebkt0APYynsX
	58+bt9NiuPGffWJR8ZV3ItMW82nF2SzwQd+6c0vCALQABDqHrTcADVeoNiQvO/f0LkzU9ec3585
	qcVVQkA3rGah+akj8cIRTu4BudxIL3gDQ+vgE8eJv4mrQ+qOWPbrsn+OJZuYAA9nGnKzOLM4zxW
	wTBxzcuG9AYTGCcsXHF6bVb7f/iXHGQ=
X-Received: by 2002:a05:690e:408a:b0:668:f57:890d with SMTP id
 956f58d0204a3-6680f579a70mr2127791d50.6.1784098550460; Tue, 14 Jul 2026
 23:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715051939.64652-1-royalnet026@gmail.com> <20260715051939.64652-2-royalnet026@gmail.com>
 <20260715055448.AEA021F000E9@smtp.kernel.org>
In-Reply-To: <20260715055448.AEA021F000E9@smtp.kernel.org>
From: Royal Net <royalnet026@gmail.com>
Date: Wed, 15 Jul 2026 08:55:37 +0200
X-Gm-Features: AUfX_myzakcKGN9vlq_qc4LRJvv-oSEDxuwqFd24WcJAwYA-kTmTVF-i9eX42Ks
Message-ID: <CAEWPSH7OqecBKvxUVtwFe4B9y0-=gsQ7vy6kdBHx-Nsne-Ct1g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Should the constraint be set to 0 to follow standard device tree
> norms?

Fair point. The current RFC wires up a single I2S DAI, and for a
single-DAI provider 0 is indeed the norm -- rockchip,dw-hdmi does
exactly that for its one DAI on the TX side.

The reason I picked 1 is that the controller also has an S/PDIF
audio output path (the vendor driver exposes both I2S and S/PDIF
DAIs through hdmi-codec), so a DAI index becomes meaningful if that
second path is wired up later.

Unless the DT maintainers prefer keeping 1 from the start to avoid
changing the cell count if/when the S/PDIF DAI is added, I'll switch
to const: 0 in the next revision -- please let me know which you'd
prefer.

Igor

On Wed, Jul 15, 2026 at 7:54=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Incorrect cell count constraint for single-DAI provider.
> --
>
> --- Patch [1]: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add #=
sound-dai-cells ---
> commit e6b0bac0b97f568ce749084e6c1e728bcd258b10
> Author: Igor Paunovic <royalnet026@gmail.com>
> dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
>
> This commit adds the #sound-dai-cells property to the HDMI RX controller
> bindings, enabling a generic audio codec to capture incoming embedded aud=
io.
>
> > diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.ya=
ml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > index b7f6c87d0e06a..83c10d9997c8e 100644
> > --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > @@ -78,6 +78,13 @@ properties:
> >        The phandle of the syscon node for the Video Output GRF register
> >        to enable EDID transfer through SDAIN and SCLIN.
> >
> > +  "#sound-dai-cells":
> > +    const: 1
> > +    description:
> > +      The HDMI RX controller registers a generic HDMI audio codec so t=
he
> > +      audio embedded in the incoming stream can be captured. A value o=
f 1
> > +      lets a sound card reference the audio DAI as <&hdmirx 0>.
>
> [Severity: Medium]
> Is this cell count constraint correct for a single-DAI provider?
>
> Looking at properties:#sound-dai-cells, the hardware exposes only a singl=
e
> generic audio DAI. Requiring a cell count of 1 forces device tree nodes t=
o
> use a non-standard syntax like <&hdmirx 0> instead of just <&hdmirx> for =
a
> single resource.
>
> Should the constraint be set to 0 to follow standard device tree norms?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715051939.64=
652-1-royalnet026@gmail.com?part=3D1
