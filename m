Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613C8371CE3
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 03:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120101; cv=none; b=LGcJRtl6IjOpaK0/Ndk48M66Efa/c+1HrtQ9YA4c/tCHp0dfv0g6nIcGjX2WERx5MXit+/2NGubqcHNcqg6E3C1P80xclRNaXKJA35ZxPBJzbkctZwJ1gF0wuSWLiwg2qR1PM98E3z+9ZQ6eaxaWSQkL2P8Xt7og3i1wgu+oDYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120101; c=relaxed/simple;
	bh=10nqLsQTTfQgYbUM797LDF87efLT8v1IfDqqCZil33o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcndfvOSiubdc5/lVSuLg9xmAcUgsUG44AWV+0u0JPxqnh3/T8ttK1gWuubjwLcKsqhZsBlIypK3DtnJNoXYI4+/wjppvMekHg4umeSRBGkJnf/DO6c2DW7ZSUKxpCarX2UNT0MZH6WY6L9KZfcTrQ+7JY+LLziwMaGiMe0C19k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e87c66e556so3033765ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 20:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120100; x=1792724900;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C7sEcXH37f0tH5wRZjkmvVXjFOaB+9cAQdh/V2489cI=;
        b=q7pCcv9liifc0CCyCJIQZB/McN9UuC1eyA2kHz4t23yL7xseF0g0p2gYc8Z+viKFaK
         THSHugwQIXzJnCp5cqztd9ogLWRfybsS1403U9Lwh0B5CP3JJFNPQNhbcy99oVMn18qi
         EOHO3qzLxCiOp56UJuyGi+hBaMgoUIk2jk/e0/xY1PVSMcF1mUYZeqACXtA2mISFZgsE
         zGtjiv9vZEojAtCmovuNTzQK9Remucx/4OVthfmOr0N+CY1J1kjWVVjTcA3LBxoCZ40k
         zr/317ptELoA9+MivPlbYERwMI/BrhHaNi6mv0u7bKHObJaWIu4UOiX6fsYqSPrADqDT
         dTVQ==
X-Gm-Message-State: AFq9FYKhQBn5Ck04+D02Eejbr6VcqmTg7eJbHXLd03wPy02boAzrPPoO
	pt2xfbAH9fk8FjSwNmKDiy8Xq93Oftq0ff/a8OV1BxoyRcg0cGjPqx48WGbfw9fOimA=
X-Gm-Gg: AYBFou3IJhxJgofXRaB7P0scCmWEt6AUtm8/IYS1H3Fdbw8RQryCtXjv8Y5mHuGILTM
	60M76ACWuIw75ZMrwtIBwLhcICcdz0Nw/Vu89LjjXo59uvCWpTYQ+Zd1gnSUdxCN4JYpGS0gtbw
	o0Fmh2VTKQRpT/TVP3GbxrqdaicybZa8ercVFabEAsO5xgyz2QUCbCoahX+VcUyN1NdafdOnH2H
	MjihVrQiDWgFizjMmKJv6XSGQ/GnHnZ67L8gpR5Zn3L5b4bt8zF+RoCdsRHH7361pnCN2CdBhJq
	Krp1Hwy2o8SYEsJbXCdgsRw4/9Nqdejh4rDB1pjd9wELd00EcehoEhJuW6yrb3CN/oXBI5Ubvg+
	JF09x6nV5VWGt26jo+0uK/sclS6ITwJu658xQ1fAtW8eaehu2aBQXvlbjpFKrMt7Xsf5qqgY+7n
	y4yCz92Od5DcDway+YGwR2nDoRG2WAbGA8gxPl2UvdGSBP2INuVxTo6Lg++goaKjprPLu6y1iBj
	OZJC+RhDSG5h9uUa5zJR5m9PV8hLo3fk1z5OOtL+RzGrg7k/I1DWj0qXst5xzKFg4Bjs5noAIAJ
	mq4X2nqCINDPAA==
X-Received: by 2002:a17:90b:4d8e:b0:3ab:3767:65d1 with SMTP id 98e67ed59e1d1-3acbb8b29a7mr1466952a91.22.1792120099503;
        Thu, 15 Oct 2026 20:08:19 -0700 (PDT)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com. [74.125.82.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm401571a12.22.2026.10.15.20.08.18
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 20:08:19 -0700 (PDT)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35829219da8so665737eec.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 20:08:18 -0700 (PDT)
X-Received: by 2002:a05:693c:8097:b0:35d:5e81:1d87 with SMTP id
 5a478bee46e88-3602ddd6208mr2385682eec.12.1792120098234; Thu, 15 Oct 2026
 20:08:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015-ehci-ce5300-hostpc-v1-1-3cae67c11946@telaak.dev> <sashiko-outbox-173543@kernel.org>
In-Reply-To: <sashiko-outbox-173543@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 15 Oct 2026 23:08:06 -0400
X-Gmail-Original-Message-ID: <CAPY4CJ7BEa_cmAYiVUdWmRnO4H6ddQJTO_bEZSBSEFh=kChm=w@mail.gmail.com>
X-Gm-Features: AclHuK-6Dfqf-lD7fob5OF5YK8VRSOSLqirzEsT7JpUiorRplDbN6X4TAeDIG8s
Message-ID: <CAPY4CJ7BEa_cmAYiVUdWmRnO4H6ddQJTO_bEZSBSEFh=kChm=w@mail.gmail.com>
Subject: Re: [PATCH] usb: ehci-pci: Set has_hostpc for TDI EHCI on Intel CE5300/CE2600
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 16 Oct 2026 01:22:42 +0000, sashiko-bot@kernel.org wrote:
> Since this hardware selects host mode via USBMODE_EX (offset 0xc8), the
> standard USBMODE register (offset 0x68) may read as 0. If it does, will
> tdi_in_host_mode() falsely return 0?

Yes. USBMODE reads back 0 on this core even while it is running, so
tdi_in_host_mode() returns 0 and ehci_halt() returns without stopping
the controller. I confirmed it on hardware: after ehci_shutdown(),
USBCMD.RS is still set. v2 will read host mode back from USBMODE_EX
for this core only, via a new flag set by the CE5300 quirk, so other
has_hostpc users such as ChipIdea are unaffected.

Testing this also turned up a second problem: ehci-pci reads SBRN and
the port-wake bits from PCI config 0x60-0x62, which this core doesn't
have (those bytes shadow a BAR). SBRN reads as 0, so the controller
reports "USB 0.0" and ehci_shutdown() returns early, which hid the
issue above. v2 will skip those reads for this core as well.

Thanks,
Joseph

On Thu, Oct 15, 2026 at 9:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] usb: ehci: tdi_in_host_mode() fails to check USBMODE_EX
> --
>
> commit 493a630291d0b5961a888e40fa36840fea16fbf5
> Author: Joseph Telaak <joseph@telaak.dev>
>     usb: ehci-pci: Set has_hostpc for TDI EHCI on Intel CE5300/CE2600
>
> The TransDimension EHCI core in the Intel CE5300 and CE2600 SoCs
> (192e:0101, revision >=3D 6) has the Moorestown-style register extensions=
:
> host mode is selected in USBMODE_EX rather than USBMODE. This commit sets
> has_hostpc so that USBMODE_EX reads back 0x23 and devices enumerate.
>
> > diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
> > index bd3a635555942..8c71c3de3082e 100644
> > --- a/drivers/usb/host/ehci-pci.c
> > +++ b/drivers/usb/host/ehci-pci.c
> > @@ -145,8 +145,16 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
> >                       hcd->has_tt =3D 1;
> >               break;
> >       case PCI_VENDOR_ID_TDI:
> > -             if (pdev->device =3D=3D PCI_DEVICE_ID_TDI_EHCI)
> > +             if (pdev->device =3D=3D PCI_DEVICE_ID_TDI_EHCI) {
> >                       hcd->has_tt =3D 1;
> > +                     /*
> > +                      * The TDI core in the Intel CE5300/CE2600 (rev >=
=3D 6)
> > +                      * selects host mode in USBMODE_EX and reports po=
rt
> > +                      * speed in HOSTPC, as on Moorestown.
> > +                      */
> > +                     if (pdev->revision >=3D 0x6)
> > +                             ehci->has_hostpc =3D 1;
> > +             }
>
> [Severity: High]
> Since this hardware selects host mode via USBMODE_EX (offset 0xc8), the
> standard USBMODE register (offset 0x68) may read as 0. If it does, will
> tdi_in_host_mode() falsely return 0?
>
> drivers/usb/host/ehci-hcd.c:tdi_in_host_mode() {
>     ...
>     tmp =3D ehci_readl(ehci, &ehci->regs->usbmode);
>     return (tmp & 3) =3D=3D USBMODE_CM_HC;
> }
>
> During driver unbind or system suspend, ehci_halt() relies on
> tdi_in_host_mode(). A false 0 return causes ehci_halt() to exit
> immediately and completely bypass the teardown sequence (clearing
> CMD_RUN and waiting for STS_HALT):
>
> drivers/usb/host/ehci-hcd.c:ehci_halt() {
>     ...
>     if (ehci_is_TDI(ehci) && !ehci->no_tdi_mode &&
>         !tdi_in_host_mode(ehci)) {
>         spin_unlock_irq(&ehci->lock);
>         return 0;
>     }
>     ...
> }
>
> Can this bypassed teardown sequence leave DMA and IRQs active on the
> newly enabled core, potentially leading to memory corruption or a system
> panic? Does tdi_in_host_mode() need to check USBMODE_EX if has_hostpc
> is set?
>
> >               break;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-ehci-ce5=
300-hostpc-v1-1-3cae67c11946@telaak.dev?part=3D1
>
