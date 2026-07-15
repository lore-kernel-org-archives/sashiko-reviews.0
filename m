Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B11432BC5
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 13:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121619; cv=pass; b=MGDihcW3hOkm38/RAXTxKXDtuYiVST2O3a7Vxq5itgvoRN/2SIDYxjTKY014WW8+aKcwwk22jf810WMDkBomvNzbsoWGleDD3JraIpK4Iyu4q2z/MltX/yFcCwYkQm3Yu1cI7B1ozZEsNCZWU+8eCp4gKx5uo/0J+4jwpq54kcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121619; c=relaxed/simple;
	bh=SlSFSIWLWH2oc8UzFRnHM3yL5Po5PvliK6hlvsEAwBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4w+PIJkGG1Lb011fwNJ71SbBcJA6Hfc4Uubpo2rL1A54geG48Y6QK4A18Ne6w1FZKLPveXQbygMGDbPBDm6VYlZ/cifR0FysuxVpyv+LPxX4mJs0Ij0U10PlJWi8uhZNbWLnkm6wwmZFc/ZEKt9958ExPLPRrpTs3ZCOKeVg6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFnH1ZtV; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFnH1ZtV"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8080651d2cfso10231087b3.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 06:20:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784121607; cv=none;
        d=google.com; s=arc-20260327;
        b=qfDyTeMMqjQ4lbMZhJSr7imzIa++ggVWnpN6BgAyjJKymaR1ZDbUF/BeRWO0IDz7+W
         Kqviqub0rd6TvgXoBFAmKcoDJlXl8pmHCBAaV4HNg8FObIh/OnXDB6l0VCCIymxw04Wp
         ZXPRH16+7vKxAdELyPPgtFInC5a0pKtiKoed7OAy6iv7xw9C6WidILx8aDRcS4C2fT1g
         o5DWHyWemc/tbyrSERc7wl9VsoF/eBx6j68awhDaOr6EC/1JKsxqDoitcpxazo6KSOKr
         jXkDdCtISMcJhTwLPlslgeOBGdNiAn+5qgIcfCbci5x3Y6FBy7SKjMPzGuQg0YWqwCjV
         baUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WXY1t7E/1tBkZvLdCQEWkFucsdeDnwjuKZvuP0c9BUk=;
        fh=WZAN7zYDkj46/sWJhsNA34MX4s/UgKB7jgni8mQ3rC8=;
        b=bCzmCo7dshO2gd8HXD076HNSt6hpklFSVGOp3B4ABL0vfiZKX2WXi7GfFo3A3W4bZH
         DFfQpfFRQw+nEFE3RAfmj9s9rYJe0OwDbeOKeFrzSHN1Hnv/8SHefvFU7Iry/UfvkxE2
         c9DatPnDFKk4vOWD11I1R90ADk2oiZJ1cJX9cbasX6Oxp67QWlv5F1jXKt/B3iMkjEX5
         qCt+yFFZLcyF6zWxFmnxqfv2PMm35OCw/8LWeO1aPl8tVF4SemqKbC2mUKpNLiDf/ejp
         mcUuoRftO104VbmfiSiFyOwsx7kvQ3NAbMPtcSeP5Jhso9d0QJzxhSbQBm2njlMNucc9
         lOfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784121607; x=1784726407; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WXY1t7E/1tBkZvLdCQEWkFucsdeDnwjuKZvuP0c9BUk=;
        b=gFnH1ZtV8Diuy4DMmSrG+6MJ3WTwv35+GJKF8VcAEJa0rIro1KQTs4sbjG0VifO00h
         Bcn05YHUMav8+xKIpaNPTYwYlzd3v++9kilxoaFpE7lzqtxGCRJDm4D6LgIfdFK09rIo
         /LHwEVd91LAQdqsS/LIMwWI3aED6Lw4p3D4xlirtH+8e0GJwuIFJ6HJ2PzKtiWLAtsx6
         xGtYS9YH5HZZ7JAx2KqvXgxx69WtBoj5YTz/kzXB6tWSbiynwrXqkY5iyTJFCO0A0N4g
         Se5kWDpajtM0HKw6FFVWcqREtU5kSpqHqNp/1knnTXInAJ817cmsF1rHQIL2bpEucK93
         MB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121607; x=1784726407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WXY1t7E/1tBkZvLdCQEWkFucsdeDnwjuKZvuP0c9BUk=;
        b=IKBVvLYNb3RdjsuhvUx/cHkaNQKU7q12GtDFhXKpOmQMWj1d3iggMb/3/cQAwMpP2n
         TaQfHlLrA/a73CmKVLRTynZt/ekiYEaFvb2m1+4PqobP4HQx+itdPUGCHXhB6w9o8XNP
         bBFobUt7pebMFkrg0nc0VBTU0yaNs65pOVRoWilnQSvFDbzBHn1Myew/7ffhdWwafb9Y
         sW1lLDANzo5NUJCaqmRb32gyh9IY9NYLcJoTqfZUbpK5ZYPFzMBT0rjAmPvG/EAXj7Za
         oaVP82wm+i7j37YHUL3WlD6JqsLhbl+wVLHZ037BtjSMu7uUSL6V5h+JvGJJGP+wlXLA
         vdPQ==
X-Gm-Message-State: AOJu0YwTm1ZmqNXH2PzQprohhVYT9SEi+kvsa86w/41pPrxgNQgsbbTA
	ljpotkdg5TFi1wSjhJNHQadZ9R5q/3CTVwarM9QR/wfsUfYx7jx1J7R/BnfqzXB2jLLhvA5EOP6
	SZ1ZxsteIhVltMZyy4rg0ELG0EFBLsKY=
X-Gm-Gg: AfdE7cn8wzK+uNfK5lypZuJIlW3iUmDgUextmRmB5BcVwr3BUfqKZa/SBc4ZvTDK1LM
	S789PsPN9+SeB9zJJtEDIuXCuQJS0cjtUAk0qJeiWkz/jzvT8o0R3WV7Ifqk7I45+B6yScy1QQz
	FnkgUd42fxo4b5zXffM1DOMtak7KQglU3h3lZSYB5uUziUgdcFGMP0vBmyp9kMkq5oA/jhsmTXx
	fO6zZkT9nrD1Hunxc/B8q46yMHGCnLniSVQ6RS8BS/u27JTqvHq03iPf/ZT2rdu2BpKcDMAXjrY
	3L7IopFYJlDaXiE5DzS61NTWKTHGz+yDhzH671zpIA==
X-Received: by 2002:a05:690e:408a:b0:668:f57:890d with SMTP id
 956f58d0204a3-6680f579a70mr2837584d50.6.1784121607296; Wed, 15 Jul 2026
 06:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715051939.64652-1-royalnet026@gmail.com> <20260715051939.64652-2-royalnet026@gmail.com>
 <20260715055448.AEA021F000E9@smtp.kernel.org> <CAEWPSH7OqecBKvxUVtwFe4B9y0-=gsQ7vy6kdBHx-Nsne-Ct1g@mail.gmail.com>
 <aleBPE5YHlC7pLpi@venus>
In-Reply-To: <aleBPE5YHlC7pLpi@venus>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Wed, 15 Jul 2026 15:19:54 +0200
X-Gm-Features: AUfX_mwfTO8e_VPJdfOPse4or6ggrePK7Jx-SNC6g2Ok5lGwy5jpc5Cegi2PMVo
Message-ID: <CAEWPSH4AYfSR_DBcLFr6a=SJxnAAcjoK612v+g-TpP046qTBmg@mail.gmail.com>
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

> It should be 1 from the start as the DT binding is supposed to
> describe the hardware and be stable.

Thanks -- keeping const: 1 then.

> But in the next version you should look into updating the commit
> descriptions to be less about the kernel driver and more about
> the hardware.

Will do. I'll use your wording as the base for the v2 commit
message, document that argument 0 is the I2S and 1 the S/PDIF
interface in the property description, and move the consumer
reference (sound-dai =3D <&hdmi_receiver 0>) into the example
section.

For completeness: the driver part of the series currently wires
up only the I2S interface (DAI 0); the binding now describes both
interfaces as per the hardware.

Thanks for the review!

Igor

On Wed, Jul 15, 2026 at 3:00=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hello Igor,
>
> On Wed, Jul 15, 2026 at 08:55:37AM +0200, Royal Net wrote:
> > > Should the constraint be set to 0 to follow standard device tree
> > > norms?
> >
> > Fair point. The current RFC wires up a single I2S DAI, and for a
> > single-DAI provider 0 is indeed the norm -- rockchip,dw-hdmi does
> > exactly that for its one DAI on the TX side.
> >
> > The reason I picked 1 is that the controller also has an S/PDIF
> > audio output path (the vendor driver exposes both I2S and S/PDIF
> > DAIs through hdmi-codec), so a DAI index becomes meaningful if that
> > second path is wired up later.
> >
> > Unless the DT maintainers prefer keeping 1 from the start to avoid
> > changing the cell count if/when the S/PDIF DAI is added, I'll switch
> > to const: 0 in the next revision -- please let me know which you'd
> > prefer.
>
> It should be 1 from the start as the DT binding is supposed to
> describe the hardware and be stable. But in the next version you
> should look into updating the commit descriptions to be less about
> the kernel driver and more about the hardware. Maybe something like
>
> > The HDMI RX controller has two digital audio interfaces, one for
> > I2S and one for S/PDIF. Allow referencing connections from audio
> > codecs to these interfaces by documenting the missing #sound-dai-cells
> > property.
>
> Apart from that it makes sense to document that argument 0 means
> I2S and argument 1 means S/PDIF interface in the property description.
>
> Last but not least drop "A value of 1 lets a sound card reference
> the audio DAI as <&hdmirx 0>.". Instead you can add this to the
> example section at the end of the file.
>
> Greetings,
>
> -- Sebastian
>
> >
> > Igor
> >
> > On Wed, Jul 15, 2026 at 7:54=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> > >
> > > Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> > > - [Medium] Incorrect cell count constraint for single-DAI provider.
> > > --
> > >
> > > --- Patch [1]: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: a=
dd #sound-dai-cells ---
> > > commit e6b0bac0b97f568ce749084e6c1e728bcd258b10
> > > Author: Igor Paunovic <royalnet026@gmail.com>
> > > dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
> > >
> > > This commit adds the #sound-dai-cells property to the HDMI RX control=
ler
> > > bindings, enabling a generic audio codec to capture incoming embedded=
 audio.
> > >
> > > > diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-r=
x.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > > > index b7f6c87d0e06a..83c10d9997c8e 100644
> > > > --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > > > @@ -78,6 +78,13 @@ properties:
> > > >        The phandle of the syscon node for the Video Output GRF regi=
ster
> > > >        to enable EDID transfer through SDAIN and SCLIN.
> > > >
> > > > +  "#sound-dai-cells":
> > > > +    const: 1
> > > > +    description:
> > > > +      The HDMI RX controller registers a generic HDMI audio codec =
so the
> > > > +      audio embedded in the incoming stream can be captured. A val=
ue of 1
> > > > +      lets a sound card reference the audio DAI as <&hdmirx 0>.
> > >
> > > [Severity: Medium]
> > > Is this cell count constraint correct for a single-DAI provider?
> > >
> > > Looking at properties:#sound-dai-cells, the hardware exposes only a s=
ingle
> > > generic audio DAI. Requiring a cell count of 1 forces device tree nod=
es to
> > > use a non-standard syntax like <&hdmirx 0> instead of just <&hdmirx> =
for a
> > > single resource.
> > >
> > > Should the constraint be set to 0 to follow standard device tree norm=
s?
> > >
> > > --
> > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026071505193=
9.64652-1-royalnet026@gmail.com?part=3D1
