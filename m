Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2384A2E0C
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 17:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784137299; cv=pass; b=tMxKm0mCu431AHt35C6AmwIFbCIF1pJfV48Sj3O2FNvObHn5uW399OC1Ph03M2D3KBMR+61ghPG06OF6mPsGRniP3AReIP1K5W5FkW4/SRFFuyoNrF7sMLyWw8vL8JQYzEQOzcnrEMx2nSoeIYZs74gnIKibIRy1HZ0jOWYwEaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784137299; c=relaxed/simple;
	bh=dQW6TQ1rFh953Dt2vhupwt1QO2viiCbkjMu0LKVypn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uRW18Dl2Q2s/rp9dgBlMA7lvNGfIGReGsTXCMmKUTykpyjj3/vitQqUHIkgQ+CPl3uOsLWAZ0J0LyIaMIJ7voaxLMEj4cQjtIR6QwYGWadq/jJ5lZMnyYH03y3x6W1YghU0hgzLIF+VNXW69OJwGfby5Crs9aLIyfgg+i2Tvrbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJ8jZo8d; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJ8jZo8d"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81e8c68c0cdso7250817b3.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 10:41:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784137294; cv=none;
        d=google.com; s=arc-20260327;
        b=prNe9Ur2Qu5du1cV9+W7yXqicKyU+Yg5SUcJGewahsxDP334mkk50V8NHHCWc/SU0i
         ZE6u/1oLtKAAmaR+sm4AcEd/8w7Vx0ikv2bIbieGh2Y0j+J3V5AnXipai4Q5Weixq8RP
         47W2NiQ+MMU2sY4rdw4WPKbsy3zPEiMOkE87j9uvO2Kz5uNRRZ7UBIXKau7rOZpdoNNp
         W+sW3GThXb0wGnM0wRjpoo/bAsmzW13Z6/Aiq5kHuJTOinnlCKuHbRYoCAp+r0isxv7q
         DTame/bhN0B7CxDNJW5c1TF/22lnD43PubAbAdlhy9L/8i0zqHW7Ztgf6rXO6KTZzT8b
         yVoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zg7A5Jpo8DbdBBYZQVt5X+er30m85xx835hMZvBqipc=;
        fh=WZAN7zYDkj46/sWJhsNA34MX4s/UgKB7jgni8mQ3rC8=;
        b=ssdbj0cVnm0Iex89VmKr8Ut5EwC8vJ4i3BCrANPMLPhcaSOhDOVplA9llbeW8Tv5ss
         ffovpmxu7aGY8Cg/zV+XwBOmcfbW+fM0zuPlji0WxCgGdGCxAORWPlnMXXNI1Iw0GiXg
         bctXSYLPh2HbjI6dRheKAgKsaHrk+ATNx5vXyCqb5ScSZQo5ecYIIIxn0XRAaCy4wWiv
         u5pHFOKjbm/DtH+fx68sR0qVEE+5006lZQZm/f9250vsuCRWCYdWsolXG4OoSNTweKXm
         BHbnKQ/E6ueqKFfRjYMoFx7ifcgo4XAHcLiQUeAS0T2xvYbJRoLt+86VE3s/XOdMGyRy
         iw9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784137294; x=1784742094; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zg7A5Jpo8DbdBBYZQVt5X+er30m85xx835hMZvBqipc=;
        b=rJ8jZo8dTdvNB3ARMs8YwxAVRYGU+dyR0pryM8y5ZhviWzzFhskq+Q/NJPYFniZQYh
         +J40eqgiqty62apiYBcZIiRY+Bb9V3LlltaL0XI5fpkeQEAyCUum9D+nvWXgtA3BzsA/
         96Tp36FgDrvPYPYyzhhuOuO299gVv3ahH615szapaMuSJgWbUuvmnpSIh56Il1kSVWDK
         o9hKtUNVdrCD/V3zjVlJUWTMFnHBU8L1m2tdU28o9N6KaG5WpC/VWtN+N0yQYE6qkxUo
         yg7UtHyiiRlaIGJJsZ9I1i1LHeEF24TwYmN08XqV5WonuQXThkIIvVdV8R69LQh5VJtO
         wLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784137294; x=1784742094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zg7A5Jpo8DbdBBYZQVt5X+er30m85xx835hMZvBqipc=;
        b=raVZcyIVq34XSZfHyJundu49Ve/u2LHPjqn2R/2W85Vt27c2ypcrVIyj3RbnQbBF7H
         P4SWutOzxnh0zsJYuOln3EBtL/lgRHUE1dZ0JcLvgY/inCrBl/uUWYs51Us+eMVMOoKD
         BTvpum6PAdn+SQ0D8LZR1/t9KX0ADvSEkuu+1AuEp2BS5CwalTngOBvQwGLRhp2ZVBDT
         Ngtx9ROVNvyPRX7I5tW2pERE1zd/Vcz/p4K8c3jz4dUl67tkrerBkP4vomCZMHIMQSSY
         j0s/hvDyL/M15XGbS1BXefgr36nd3mo6WI4DvBkJoiLLMaSbuMVFGO8OEGedWqjWbCBB
         0pfw==
X-Gm-Message-State: AOJu0YzxurIJ5XuEnp42LTYvr2hMWD5PSdghtpVkfDde91f7DMOlaSSq
	x11f1z7oAWp29KhBtyG9p5YMuic+3NFE+Jl+Ot8L4+wsJ9tyxiv2c+mCPCSyAh+qmDEHIS9PXx4
	Q7GssdyBEQ8p5dZd+ty55pZ4CRaAzBlY=
X-Gm-Gg: AfdE7cmyH4VZBEb/EkPwLfQdY50D35MhXXT0mMniHJGt5AKp/12IQ1v/UPXqFC7WgWh
	mSYWx+Dfxp7jPl9eXHX6EuHxySLFSaciyHoNJ7JUuEJdCNUC/aF4+W3/czQ+WPiww/uCXAFrwgY
	41+I4m3S+5Y+YOLJoTN2KHaeQbeKkstobHoAFZIGv0KbXsBl1IxVBnVvpC8cM92LLzbziVrMzUU
	8UazSoMgJsnt577uoZ5SaFOkVVDNWd3znyad15V4pugL+v1zng25992PnSQIZAoJJ8n+1u1SmDI
	oClwBcXVrEsvPHmcJ+b5hTgsI2gu3zU=
X-Received: by 2002:a05:690e:1447:b0:664:d93f:b5f2 with SMTP id
 956f58d0204a3-667d7a98cdcmr11438958d50.1.1784137294186; Wed, 15 Jul 2026
 10:41:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715051939.64652-1-royalnet026@gmail.com> <20260715051939.64652-2-royalnet026@gmail.com>
 <20260715055448.AEA021F000E9@smtp.kernel.org> <CAEWPSH7OqecBKvxUVtwFe4B9y0-=gsQ7vy6kdBHx-Nsne-Ct1g@mail.gmail.com>
 <aleBPE5YHlC7pLpi@venus> <CAEWPSH4AYfSR_DBcLFr6a=SJxnAAcjoK612v+g-TpP046qTBmg@mail.gmail.com>
 <alfCQd689ATJOdwM@venus>
In-Reply-To: <alfCQd689ATJOdwM@venus>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Wed, 15 Jul 2026 19:41:22 +0200
X-Gm-Features: AUfX_mxAn0tlPy3Nu6Juugzw1ag0FrnBRekTl-ObKL4Q73o9n5lkkPOvfoeeM0s
Message-ID: <CAEWPSH6L79Kb9wQna9Cg8yGMJAN88__PwsuXvA+oo+fPStLoYg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Sebastian,

> Not implementing all features in the driver is perfectly fine.
> Ideally you return -ENOTSUP if somebody tries to use the S/PDIF
> DAI interface instead of I2S.

Done for v2: the codec registration now exposes the S/PDIF DAI as
well, so the DAI indexes match the binding (0 =3D I2S, 1 =3D S/PDIF),
and hw_params() rejects the S/PDIF interface with -EOPNOTSUPP until
that path is actually wired up.

Thanks!

Igor

On Wed, Jul 15, 2026 at 7:28=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Wed, Jul 15, 2026 at 03:19:54PM +0200, Igor Paunovic wrote:
> > For completeness: the driver part of the series currently wires
> > up only the I2S interface (DAI 0); the binding now describes both
> > interfaces as per the hardware.
>
> Not implementing all features in the driver is perfectly fine.
> Ideally you return -ENOTSUP if somebody tries to use the S/PDIF
> DAI interface instead of I2S.
>
> Greetings,
>
> -- Sebastian
>
> >
> > Thanks for the review!
> >
> > Igor
> >
> > On Wed, Jul 15, 2026 at 3:00=E2=80=AFPM Sebastian Reichel
> > <sebastian.reichel@collabora.com> wrote:
> > >
> > > Hello Igor,
> > >
> > > On Wed, Jul 15, 2026 at 08:55:37AM +0200, Royal Net wrote:
> > > > > Should the constraint be set to 0 to follow standard device tree
> > > > > norms?
> > > >
> > > > Fair point. The current RFC wires up a single I2S DAI, and for a
> > > > single-DAI provider 0 is indeed the norm -- rockchip,dw-hdmi does
> > > > exactly that for its one DAI on the TX side.
> > > >
> > > > The reason I picked 1 is that the controller also has an S/PDIF
> > > > audio output path (the vendor driver exposes both I2S and S/PDIF
> > > > DAIs through hdmi-codec), so a DAI index becomes meaningful if that
> > > > second path is wired up later.
> > > >
> > > > Unless the DT maintainers prefer keeping 1 from the start to avoid
> > > > changing the cell count if/when the S/PDIF DAI is added, I'll switc=
h
> > > > to const: 0 in the next revision -- please let me know which you'd
> > > > prefer.
> > >
> > > It should be 1 from the start as the DT binding is supposed to
> > > describe the hardware and be stable. But in the next version you
> > > should look into updating the commit descriptions to be less about
> > > the kernel driver and more about the hardware. Maybe something like
> > >
> > > > The HDMI RX controller has two digital audio interfaces, one for
> > > > I2S and one for S/PDIF. Allow referencing connections from audio
> > > > codecs to these interfaces by documenting the missing #sound-dai-ce=
lls
> > > > property.
> > >
> > > Apart from that it makes sense to document that argument 0 means
> > > I2S and argument 1 means S/PDIF interface in the property description=
.
> > >
> > > Last but not least drop "A value of 1 lets a sound card reference
> > > the audio DAI as <&hdmirx 0>.". Instead you can add this to the
> > > example section at the end of the file.
> > >
> > > Greetings,
> > >
> > > -- Sebastian
> > >
> > > >
> > > > Igor
> > > >
> > > > On Wed, Jul 15, 2026 at 7:54=E2=80=AFAM <sashiko-bot@kernel.org> wr=
ote:
> > > > >
> > > > > Thank you for your contribution! Sashiko AI review found 1 potent=
ial issue(s) to consider:
> > > > > - [Medium] Incorrect cell count constraint for single-DAI provide=
r.
> > > > > --
> > > > >
> > > > > --- Patch [1]: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-r=
x: add #sound-dai-cells ---
> > > > > commit e6b0bac0b97f568ce749084e6c1e728bcd258b10
> > > > > Author: Igor Paunovic <royalnet026@gmail.com>
> > > > > dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
> > > > >
> > > > > This commit adds the #sound-dai-cells property to the HDMI RX con=
troller
> > > > > bindings, enabling a generic audio codec to capture incoming embe=
dded audio.
> > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/media/snps,dw-hd=
mi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > > > > > index b7f6c87d0e06a..83c10d9997c8e 100644
> > > > > > --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.y=
aml
> > > > > > +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.y=
aml
> > > > > > @@ -78,6 +78,13 @@ properties:
> > > > > >        The phandle of the syscon node for the Video Output GRF =
register
> > > > > >        to enable EDID transfer through SDAIN and SCLIN.
> > > > > >
> > > > > > +  "#sound-dai-cells":
> > > > > > +    const: 1
> > > > > > +    description:
> > > > > > +      The HDMI RX controller registers a generic HDMI audio co=
dec so the
> > > > > > +      audio embedded in the incoming stream can be captured. A=
 value of 1
> > > > > > +      lets a sound card reference the audio DAI as <&hdmirx 0>=
.
> > > > >
> > > > > [Severity: Medium]
> > > > > Is this cell count constraint correct for a single-DAI provider?
> > > > >
> > > > > Looking at properties:#sound-dai-cells, the hardware exposes only=
 a single
> > > > > generic audio DAI. Requiring a cell count of 1 forces device tree=
 nodes to
> > > > > use a non-standard syntax like <&hdmirx 0> instead of just <&hdmi=
rx> for a
> > > > > single resource.
> > > > >
> > > > > Should the constraint be set to 0 to follow standard device tree =
norms?
> > > > >
> > > > > --
> > > > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/202607150=
51939.64652-1-royalnet026@gmail.com?part=3D1
