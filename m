Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBA526B2D3
	for <sashiko-reviews@lists.linux.dev>; Sat, 11 Jul 2026 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783781489; cv=none; b=EN3qFMK3AWr4UtU/Gem/0tbPQOB8+fMLMrPpyCEIlFrnryOliK+JmXlwaMGpD6i1rHSrW29cfAYefZuetaMqM6R2Tf4y2RMWFrx3b71sA55LdhlsscJpXAdQbanS64M0+2ncY0UcqAkQONDguQQmDDy0+rNP40f41MJIyL3Vt08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783781489; c=relaxed/simple;
	bh=4RFSGw+CDMd+5s86BtplX+kqnR5RCZVymWAUAsELbOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eI7ZsixHX2clr8+tSx6YCiUfDkwk33mvTxLGqhP0tPgRSO4bM7abbeC/RZyIhCI3AmhqABacqNT83njCyASmc8ikHKSuv7g6ZUz5tQfqZ3aN4oWzEAGf4O7Vwtjat7ul8hRUmDCPaJd31BTPKqsPxESa2lfnQinCoaUHObLZPL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1e85wTy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1e85wTy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D7B1F000E9
	for <sashiko-reviews@lists.linux.dev>; Sat, 11 Jul 2026 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783781488;
	bh=YbdHo1fFhSGeC4vAMfWJlbQ9rrl/OoSLZE9a3JPg1ZY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=K1e85wTy4bDfXVfOZKLTJKrHyY1vBQdrvQAC8QsI0+NZ0LbGCRd3NY3je0PCPk6tL
	 zaUQ2dRYqdMuY/fBtxPH9X602WP1u5NMh6NLB5Kqe3SBSUBQdXM175a6FtvybmEu5J
	 f6zatSIbWeFcU/cDs1Ba1kQKrQYy+OzROuPWNkV02T1RLbAGjHWF2Wehpe8eNGBSTb
	 9vNZGro/w2cRUy26xOtaP2kYHTA9vot1+ZlskvJQyH+uhED+qK5JffW4nXxuwxbZdi
	 3x4UEyDRrdNJl8WD6MIEBxkp3aXPrI7jb3CPIqp3FrCz5/8FHF+evnQYL+7/qrIk+8
	 g0wnhcLBnr9rQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c94fccf3eso11140211fa.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 11 Jul 2026 07:51:28 -0700 (PDT)
X-Gm-Message-State: AOJu0YwR1TmZc341c2FXV91d0U6h2FSbMUxw489OCPbsry8Hfa3H1cTp
	TqMoolYJjn0Urk76ufTsbZoq4qZ+3VtJquy+p0rPgQUIiL8fcDFFX8uW20a1TGMaztL3ENQjE/p
	pyR52XTf9iDNrxVP0NMlLhVVTa41QcnM=
X-Received: by 2002:a05:651c:b08:b0:39b:180d:34f with SMTP id
 38308e7fff4ca-39caa851bb8mr5565121fa.26.1783781486909; Sat, 11 Jul 2026
 07:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260711135959.3616919-1-wens@kernel.org> <20260711135959.3616919-6-wens@kernel.org>
 <20260711140815.40CFF1F00A3A@smtp.kernel.org>
In-Reply-To: <20260711140815.40CFF1F00A3A@smtp.kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 11 Jul 2026 22:51:10 +0800
X-Gmail-Original-Message-ID: <CAGb2v675dr_rfT69LD33uEOtshjBZg8T3ioh9jWy-DEB17_8KQ@mail.gmail.com>
X-Gm-Features: AUfX_mzNZXwHrrTYqh8_BgRVOxijgn9KAwskKoA2PS7BbrJpLry6SlCoGOivvNw
Message-ID: <CAGb2v675dr_rfT69LD33uEOtshjBZg8T3ioh9jWy-DEB17_8KQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: allwinner: sun50i-h6: Add missing SRAM
 region for video engine
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 10:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Adding a second phandle to the `allwinner,sram` property has n=
o effect at runtime because the sunxi_sram driver infrastructure hardcodes =
parsing to only the first index.
> --
>
> --- Patch [5]: [PATCH v2 5/7] arm64: dts: allwinner: sun50i-h6: Add missi=
ng SRAM region for video engine ---
> commit 8b2bcf328faa458d85d11e3cef06ddda86e2e10e
> Author: Chen-Yu Tsai <wens@kernel.org>
>
> arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for video engin=
e
>
> This commit adds a reference to the SRAM C region in the video engine nod=
e
> to prevent access through a partial alias window.
>
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h6.dtsi
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > @@ -205,7 +205,7 @@ video-codec@1c0e000 {
> >                       clock-names =3D "ahb", "mod", "ram";
> >                       resets =3D <&ccu RST_BUS_VE>;
> >                       interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > -                     allwinner,sram =3D <&ve_sram 1>;
> > +                     allwinner,sram =3D <&ve_sram 1>, <&de2_sram 1>;
>
> [Severity: Medium]
> Will the second phandle be silently ignored during runtime?
>
> Looking at the cedrus driver, it calls sunxi_sram_claim() during probe.
> However, the underlying infrastructure appears to hardcode index 0 when
> parsing this property:
>
> drivers/soc/sunxi/sunxi_sram.c:sunxi_sram_of_parse() {
>     ...
>     ret =3D of_parse_phandle_with_fixed_args(node, "allwinner,sram", 1, 0=
,
>                                            &args);

Yeah, no. Sashiko's context needs to be updated. This was changed in
commit be99eb936b4f ("soc: sunxi: sram: Support claiming multiple regions
per device") in v7.2-rc1.

>     ...
> }
>
> Does the driver infrastructure need to be updated to parse multiple indic=
es
> before this device tree addition takes effect?
>
> >                       iommus =3D <&iommu 3>;
> >               };
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711135959.36=
16919-1-wens@kernel.org?part=3D5
