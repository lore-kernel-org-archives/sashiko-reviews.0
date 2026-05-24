Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4445C309DB5
	for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 19:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779650646; cv=none; b=VzYJhSDHpqkuUKDtHMu1YCxqOJLqbyzW2xITj9IecshahJvUsjcvoE7rRPNgXkGHZg6cyzodvRi7yUcTQMoJv+f9grL4YM7FwiQutOep7Om9dyvAjPSjYRSVCMS3quE/liWMAzi3wbBZZGQist/HmCYgYWWUKeoQNSszF9QxWjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779650646; c=relaxed/simple;
	bh=pMm62ubGRWiFVk9vDdY8ndk8iHvNFe8TjKi7hXuiYWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W75xoAwkpxXuGgKwuNuuIo5nJ1AT3vH1w0Eu7vE9NZm/weqXHPt/4gGgUgLDTG8noWFGyafqehJONGBQ43ujOsHqa20vk/RLs6WCok2f3nwKwmdud1hO75qglxCrH8J285Y5XhI14ne4LtleNAgGyvKWuNupyYZfSI7oiqh1Zzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xsjt6mPv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xsjt6mPv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D171F00A3E
	for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 19:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779650645;
	bh=wqAPAU+sjEPeGHo8y7+ojBpZajjfc4nTtFIrZBDM9C8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Xsjt6mPvjmIA/Ufh3rDhibI3HeQyjClYMCsI1XKhHRIcMtZaTpFzhujrPmLDxq2st
	 4b7f/cBOfMvzxLwgWwDpBBGx27NEU/wBq8wzOokDsJNdtYwXkdvwO9IBCciy4Bn8V8
	 nu4MNiJmbKFmcT1aRtS1UI6ILtMDPRZjbDVrd91vwAv9as5Lo/58jODdoTWxmKhUNk
	 nP8wMFrOEtOiJ7UKHLR3Cks+VHNX4tWZpCQsGkcKAtotIQfyNeeigHSnwtn8WRZomR
	 NKEWAdTNl2VyjEMoJ84VlOVt11VnycxO+PsffJu6PLjIEVNas3bsziwvkjsocrwJvu
	 2g9n1t9oeaDrQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-393c93a0166so85562721fa.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 12:24:04 -0700 (PDT)
X-Gm-Message-State: AOJu0YzkMjTFCBXnZIPpwYxlMR7GgykMoFT4HCDjyusLiU7xZfhxfPC4
	VdyNnvNTi5NJgRrHtAGJvXt75/S06QrHY86GNeXqsv6kRox2ZNyG6yja2GcRl06M4MSMYWtloVB
	+Q3IBBrhJOQo4RmvuDjr+Xm0DRiD4NrA=
X-Received: by 2002:a05:651c:907:b0:396:c3c:d27e with SMTP id
 38308e7fff4ca-3960c3cd3femr2866931fa.12.1779650643407; Sun, 24 May 2026
 12:24:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260517234134.2737320-4-alexander.sverdlin@gmail.com> <20260518000221.985CBC2BCB0@smtp.kernel.org>
In-Reply-To: <20260518000221.985CBC2BCB0@smtp.kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 24 May 2026 22:23:51 +0300
X-Gmail-Original-Message-ID: <CAGb2v66t25VF04tz88vGmKdPOPk1PxG1LM70sYLGGqu0JEbkMQ@mail.gmail.com>
X-Gm-Features: AVHnY4JzZIfjtC4N_kN2aIAlBaadeu1FmyFqVosouZU1q-yl2oES1kNkekGnPOQ
Message-ID: <CAGb2v66t25VF04tz88vGmKdPOPk1PxG1LM70sYLGGqu0JEbkMQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] arm64: dts: allwinner: a100: Add LRADC node
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Mon, May 18, 2026 at 2:02=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Missing SoC-specific compatible string for the LRADC device tr=
ee node.
> - [Low] Non-standard device tree node name 'lradc'.
> --
>
> commit 2888476527aa17fae679cf9ed23a85ccc8db7463
> Author: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>
> arm64: dts: allwinner: a100: Add LRADC node
>
> This commit adds the Low Rate ADC (LRADC) device tree node for the Allwin=
ner
> A100/A133 SoCs. The IP block is primarily used for key applications and
> supports various operating modes.
>
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun50i-a100.dtsi
> > index b3fb1e0ee796b..2bba13c5d25cd 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> > @@ -466,6 +466,15 @@ ths: thermal-sensor@5070400 {
> >                       #thermal-sensor-cells =3D <1>;
> >               };
> >
> > +             lradc: lradc@5070800 {
>
> Could this node use a more generic name like adc@5070800 or keys@5070800?
>
> Other device nodes in this file adhere to the generic naming convention
> recommended by the Devicetree Specification.

Please ignore this comment.

> > +                     compatible =3D "allwinner,sun50i-r329-lradc";
>
> Is the A100-specific compatible string missing from this node?
>
> Other recent Allwinner SoCs utilizing this IP define their own specific
> compatible alongside the fallback.
>
> Would including an A100-specific string like "allwinner,sun50i-a100-lradc=
"
> allow handling potential quirks without breaking backward compatibility?

Yes, we always add SoC-specific compatibles, unless they are just the same
die in different packages. Please add another patch to add the compatible,
then use it in this patch. See this series for the H616 [1] as an example.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20240426092924.15489-1-jamcgregor@protonmai=
l.com/


> > +                     reg =3D <0x05070800 0x400>;
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517234134.27=
37320-1-alexander.sverdlin@gmail.com?part=3D3
>
