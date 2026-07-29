Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AED93A71B6
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 18:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785348804; cv=pass; b=hjCUGO0If1d4lOr3Mynif5vumsgNUtd16YCD+v6E8q59GBauD06iwy2fTZSBtkDkMEmrtSmKzapvf6UGa7okjDYkIJtkK9APwwQX4fgxYJ0iAy0tz23SiX3eZQfBoX4FdoyfTh4cEN1GvYVCjf02xcHCyOZ9yl5Iq7wCVwg8mHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785348804; c=relaxed/simple;
	bh=l9Uk7VyAGhBOCH47wMyEDvu7VOuPXGyeXwTOqqtrNwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSssj6mlyle8vDFEXHxdzEt4YdNTDt2y0lsPdWmV7pu3nQEtR+ocxYTkjdhCnC7SI88CwJ3xfJhN7L3Wtbr+x/yOahKSmNCJArPfI7bB3lzaPx4NIK3Jsla8acyo1aipW1WCFUiBFTy0Jtb6byntzqnVptLBjeZxR4noJBXVTTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mty2jN94; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mty2jN94"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so2105841a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 11:13:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785348801; cv=none;
        d=google.com; s=arc-20260327;
        b=B1i+eFVrZj2cVUq8qfglWKIz4ggHff3t+mvTdguXl1WMfCCyurhAEuVVNOZ/LCFuZi
         0fDTLY/J+ELvdYBMyUA1qj3PC8H1IAMZtqMX2WSMnZZmxu/cNeuGxZbXz3Ph1N/Pj/eP
         QiVaKQ92gtLvGbz2Iy7FNRpIAYgT/vWyC/9X8DvxOFLzmJvgkRpYtUBmm53CLk0geucg
         2PzUqio8xwfFhv+b9c0y3C+MQ/PiP+i6Kvuzd6nqodMXaDsSX4BbSZo8BZXpLtaIepa4
         0zhMnPOMLGtVCR0E0c9VU+nFUZ2Uzu+8T2ziuotv+kuxcKZi0wKBsBhgQ8KwGcdz+sou
         lhmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w1z/xndzybZ5D+AlRgPZw9qYMQrcZbDchb7urQIjmOM=;
        fh=09d0alT2vWugDAMCzpgQpl3/7WoRUt39xgQGbwqyPYU=;
        b=ZinR5Quqq2uh9wBByZdcX4vsHLGHEIyCL9owajUYvwSxSGEwso5uVOpgmp7HKoetoA
         +SOwM0i1FqriPvOAT6SPK7YoGgKieL11jc+TNg422l9qheiJRTIKpFOreL+rTqb0nKjo
         1f7LxRf+sVwjejCEDajjWv5qcTss/1euhk+3HvccGaYzFp+QVylEs/IEAyyRWHpV8G7L
         zQhgTzz6/eHHAfYWRk4y1QZfWn/93J99wubbtfoFJ4hMPzJB3ItvnehfVf049KJ4DpXn
         FDpldSC9dtywEjwL3EN6dbFl4mu7VI9yl3bw+pm5W5z5HV/OgcRlZpTUmWwHcPUEyinz
         4M7Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785348801; x=1785953601; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1z/xndzybZ5D+AlRgPZw9qYMQrcZbDchb7urQIjmOM=;
        b=mty2jN94AyqrtlZrIaqL7EquB6l27HFg6XIecwJZoglOOvDSBJ0WiedINO1MoUveIV
         484raimzYhRRZLe3xnk4TjGQzsPlW6GhuuUjsHW+scwwEZZccwSFSZjfwe3zXFEEBDxq
         bHpy1a/8IGCHOuIPqEesiYMNIhbHACPANBx0wGv61QGTuLyfIU88/wKcf5fWXTIXF1xe
         9lFfucCTE3tCn41eFTfSt4tm3Jq7yVvtlk+2866besbIhyEJuMc5uuoV/0IAKToeSTcR
         wSbwHkAAHSeQTAlsVrrv2/di4QubsIVUo6CqHaLjOW6ZczpciGJdj73l6cIkqpog7NWu
         M1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785348801; x=1785953601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1z/xndzybZ5D+AlRgPZw9qYMQrcZbDchb7urQIjmOM=;
        b=l4jJP3VsGzX6jWx6w2ckIBdKN2WJsqJKrHt4H3X2J+P7dxsEI1L7LKXdXt1wxx+QjV
         fCmkf0IF58/Bw7ptoiF1wLMtx/hXBsd6nuQeVzqhqyBqpUciAjXuvy6ibTb3hfUOE+8N
         HhFtRi17A3jIT3PsBkHWMfwVOnstQXHlbTqrgvOwWn+dwtEPgRBJuAL3YUP2jqGCQSLd
         L3oQlr6Dmm9A6KJ1MS4eTKduI5utfR7ZHj6zfGWQ2rJ5NoBWZCDjOZ/JhyS3XxazXpY+
         RFa78KPfWdmsSQcxpNDW+gUX4A+TVq1Fwajz1ALpuxFErPKR3V7Zh1RyMc97dv8f7AqC
         6YWQ==
X-Gm-Message-State: AOJu0Yxh0gkQDFKOXDEr4TI5piSnluSb5QkpGweYPR9WpMW2mlgkw+Yu
	6mgISyB29M7hi6HyErybdR1gxDCK5jL4FuEvJHU5RVmt2FwJtOf3j8buOuj76OIzMCfBjHUwrMy
	XN6CgOPITS8pOiBFudCuvYBlmoF/ZXe4=
X-Gm-Gg: AR+sD12Tdz3yC5nIuIlUBhpRrOsJEg76wbdH9qlSfZMlbiX4y5Lb+R6WOaJicXTMGa1
	3H5renZ0ImR9gKSx4BKnw/v2QtnokHNQh/kic6yYV9sPsjq1n3flYhtsxmzABRZDwvF7l1fgjwR
	qJ4K79TJ7Ue29OZBdoSAAocPRcnwZlhh4msk6fCP3OAIShyKgZonczjgrICtT9AAMPWUbaqKLft
	WDsHYhbVpTH0mDRjbWrOvfaeJ9wSjOykUWTZwUklLiix6g031BxgfTrB6UqvLoCIy1P8XqcMd0/
	6hwK0a7Ix5G8gFmaOvnEiVZqsNXTVqNVWELQETxKbVT57WiIB5YZC9J/R2EK9ISKAcbbvzxGD3k
	xH2SNU9DHftxMaj3gRcDyVASSkB+ibwG7RTEO/rLbVTaXBqD71AVftzG7Ze1f+GQNiXiezV7N4Y
	On6IAVxLz7Sie+ZjRTltNvLCrqg40nun4TATqi6dCtUzaroUlailsgZELPoZA6uLntCbM=
X-Received: by 2002:a05:6402:3899:b0:698:5610:76de with SMTP id
 4fb4d7f45d1cf-6a034a0b14amr4298664a12.4.1785348800634; Wed, 29 Jul 2026
 11:13:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260628231156.1254012-1-rosenp@gmail.com> <20260628232714.BD9581F000E9@smtp.kernel.org>
 <CAKxU2N-3zVUM6A-fQnYWud4O7M55Ghc-wnTCG+8DD6_nh2827g@mail.gmail.com> <ba56ee70-9702-4b11-ad04-d63322ab60b4@app.fastmail.com>
In-Reply-To: <ba56ee70-9702-4b11-ad04-d63322ab60b4@app.fastmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 29 Jul 2026 11:13:09 -0700
X-Gm-Features: AUfX_mxsWPdeWCTjyGu9bwG4Ft-f7FWsPOq11UXIaV9_Yv9Ny3dg6AFlEw2whJY
Message-ID: <CAKxU2N9Nt+HF-4TzB3+_5ta=28wb0xCCLuUVO6Bm=LW3ZnNmHw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
To: Arnd Bergmann <arnd@arndb.de>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 8:40=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> I saw this in the fixes pull request, and the descriptions
> below don't make much sense to me. I'll hold off on the pull
> request until someone can come up with a fix that they
> can accurately describe.
>
> On Sat, Jul 4, 2026, at 00:17, Rosen Penev wrote:
> > On Sun, Jun 28, 2026 at 4:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >>
> >> Thank you for your contribution! Sashiko AI review found 1 potential i=
ssue(s) to consider:
> >> - [High] Removing the PCI memory ranges from the parent `axi@18000000`=
 bus breaks outbound PCIe memory mapping because the child `pcie` nodes can=
 no longer translate their addresses to CPU physical addresses.
>
> This makes sense to me, but doesn't explain what caused
> the observed bug
>
> >> commit 4f061464281d4964ce46dab60d36a09328f14862
> >> Author: Rosen Penev <rosenp@gmail.com>
> >>
> >> ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
This patch can be dropped.

https://lore.kernel.org/all/20260727140939.389-1-strst.gs@gmail.com/

is the proper solution to the problem.
> >>
> >> This commit removes extra AXI bus ranges that overlap with DRAM on
> >> BCM5301X/BCM470X SoCs. The intention is to restore the original
> >> single-entry mapping and fix PCIe routing issues.
>
> The DRAM ranges on this chip are at 0x00000000 and 0x88000000
> and don't overlap with the axi bus ranges at
> 0x18000000/0x08000000/0x20000000/0x28000000, so the initial
> analysis is wrong.
>
> > With need_ob_cfg =3D false (no brcm,pcie-ob in bcm-ns.dtsi),
> > iproc_pcie_map_ranges() is never called. The bootloader has already
> > configured the PCIe controller's outbound windows correctly. By
> > removing the extra AXI bus ranges, of_translate_address() fails, those
> > bogus resources are skipped (the OF_BAD_ADDR check at
> > drivers/pci/of.c:377), and the kernel stops registering DRAM addresses
> > as PCI MMIO windows. The hardware continues working with its
> > pre-configured outbound windows.
>
> This sounds like the bootloader configured ranges don't
> match the ones in the devicetree description, which would
> leave three options:
>
> - change the bootloader to match the dts
> - change the dts to match the bootloader
> - change the driver to reconfigure the windows according to DT
>
> Can you check how the OB windows are actually configured
> by the bootloader on your board?
>
>       Arnd
