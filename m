Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D835F36CDE3
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 20:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629820; cv=pass; b=T3GPOr2FdJo+esIlWd/7f1MDXqmTLH11KopatpHWFsJjgFKk1l09Ma6FunHMtWLtRv3b1+hB1TFtfaoet75rZ4x+QOWx1sQOsZ9VCZtcG8YZHbOa/VZlmvslXr5XxPeHCaibmfvZIebuaCAoDA6LrHx5DYhHLqyxY3kYyvctKdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629820; c=relaxed/simple;
	bh=iiYdG63QJ19HQIaUgO9plT5uCdf5kYDA5G+cQ6mO7Hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AS5Kle+TryJuVz04iu41RPD2tjET0p6pR0niQii7b7iFr4XoAdOBRA/PwN1tOBpXO0FAUoMzkuNWL51x/l6PS7SogP7JXsnHTcwXkbubFhrKmIFYHhLepb7M+SbnLoXKA0b7haOdm7KUqbok/5aXRgpLnsdA2tvLlk54BVD5gTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HTfqoIs0; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HTfqoIs0"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b0129cf6ffso2092e87.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 13:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783629817; cv=none;
        d=google.com; s=arc-20260327;
        b=n+EOhcZe8KfD77aWuD/WVdxgx9Wi1NjE4X/dNjrnsbg0zhqqXNswPFATpNxLyx3sDm
         w4LnPd6lpepWHcuQDgZ++Kt7PUaqUneddiyQUwCaROBg83unxhwmkH0qQUUyu5PKPDdR
         2elJ5mRScXe8e6lxcNXHp9r0diRUbdtZlHl/R+z3pZq9YwsMlKcNTPHX5SKfec3M27la
         kbKCVfsp2mWH9km24+QtXQpX5WZNQ0WBIsu/1kO8a4nKEePtBDxQCgWna/ZeybzOcECt
         H2304USveCoUzx9phNDmvwrGLqX7G8VJ17NHJK4dpKpNH0AvI758WGJZByh8zXdaN6s7
         dxsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oCKQy7ar3VkHULBVDK4MeVf44xoaKW3SejbQkM8f67M=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=BKza8c3idB5wYz9Jy9K2kTs7ei80CaOlSll4N6ZL1ffrLb91YKiT+6VMta3sx9UWwq
         eehM2+iDfF7qSh/8yUMauoEXO8phcbWpwlUWITJiK3l3neKQ7GsCCv7dVDeHFnNBOswA
         6L0kfoxcA2QeB3G4xqkMMNVhBNBd0qncjHAaWsAnw2GaCuPOMngwh9gQN5y0nGwSAYxF
         kAtCdvIZMO4FFWsNpqCntXTr7j5n3DOXqS5BZk6/l9q+wyc6AftXp59VgOEqc3qab4QL
         zh/X9A5IZYUzrya+vXZntTOMEe6CZjUqbXu2/tNstioqV1zWdoRxjxsbRqrsg1i+M6vj
         XwUA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783629817; x=1784234617; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oCKQy7ar3VkHULBVDK4MeVf44xoaKW3SejbQkM8f67M=;
        b=HTfqoIs0zZHZCa3IJqdqvTjzibHjxCzmFxgnS04qtnw0NU2Ke8QJzHsLs+ZXIjQWPJ
         s2jRy+G2wZYPr3lrW8wCdwOhG6RVnbsQdMwuEPSUrgIT6TXobk2dj8pyDPt2tPwW3WFY
         Q7cOez+5h8bcuWGP9OJ6HAmDFb3hPdkTjfib1GvuA8JfsoiupnXIq/gR8e7lAi1iHYpr
         hBBwhUHPX76fNFiL4ejniCpeqW19TONsqF6D0Mi8i3I3VzAtzE367BX44P1yS1B+wIpi
         G1dJ7b3o+mFD2G3DBT/Eh2N4+8GQ/htvc2eFgjAhmjvxKQtrwICNPz2booFbz6lF1iqr
         SFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783629817; x=1784234617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCKQy7ar3VkHULBVDK4MeVf44xoaKW3SejbQkM8f67M=;
        b=jF9qG1nyVqhqCUz6BvP9Qah0AdgCjarscDikDVSwo+YfUr806+R9VwPXNbX+r6hWjw
         IE4wOskEy2h5AySmy5AKmLRUHfWGH+EbREGQMoDk0Yw/V39TgG6dr882pvnevS/Bksm6
         c2sum2Wz9lg2/DsnggsgqIpwbun2+IenBZX5msbAs700CxSvQIe6Ltg51wygqbFcx4HU
         DFUysSR3SXh7ik9I5pPb1mtTFVeVDzPzmTjahp1eLlb1vCxpD2poot2B4A6k/nwCTF69
         JibdRFjAf19UWC3+FeVq7PECV7ynAps5Sri7IOG9OdnR4FZoXGD69TgFhoB+uP56wIZs
         yrLw==
X-Gm-Message-State: AOJu0Yx7J+9XPv9N2qHTDujdtNavNiDqHKUsoI4NPdOWigPrmV/bGcqI
	DppLGXD3oFpLbAU0tYLcKZQ5xJP1hqq7kpK09VWqjr/b+8qBv/CU6pTBFzGAfzRfh87lj5I3eXW
	9eA+k3G3c6v0Hc8xwjrDhlMhoLzFjGVf3+136jkAbCqShneJNGTIV7iM=
X-Gm-Gg: AfdE7cnXa5akVP6b5drAAYeSaWQooa2zOw51F1J6H+O1xVfadlpMKCzbgJ7xjG4mGuT
	biBAvfZGqZFgulAHtxSPdzt2JACLmuNnFLSO6VfyVE4kxKgUDpK5pXVwV/C2j0LYOilbsHCFMGd
	d1vDGcj4TjaU6TL9drHPHtyBCmpp/hVYNeANSUveZ4+D90+8uNXutIncn/bNWRS9ajmoD++8DSA
	S6L1aGB35K7Us2D5EnoTxv6+YG8XsiEcN/m3pZhFKIRaPOS3VieQrYj+xLAiPHZFdA+7Mc/0Rwi
	6Ks=
X-Received: by 2002:a05:6512:3d03:b0:5ae:b0ee:f737 with SMTP id
 2adb3069b0e04-5b01cd4f47cmr8777e87.9.1783629816632; Thu, 09 Jul 2026 13:43:36
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708-igb_v3_b4-v3-0-1272650ca614@google.com>
 <20260708-igb_v3_b4-v3-3-1272650ca614@google.com> <20260708232925.D2AE31F000E9@smtp.kernel.org>
In-Reply-To: <20260708232925.D2AE31F000E9@smtp.kernel.org>
From: Josh Hilke <jrhilke@google.com>
Date: Thu, 9 Jul 2026 13:43:24 -0700
X-Gm-Features: AUfX_myJvnDtxDlB3D6ADaOhePgyrRxAKJgPJquTRxogEv4Aj7fK_j9f_7Uc_A4
Message-ID: <CAAdrzjvUcSZqq4y5dvCihFv2K-jQ27g=A3wuO83PVjSAPG1jzg@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] vfio: selftests: igb: Use advanced TX and RX descriptors
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 4:29=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Programming `SRRCTL` with `E1000_SRRCTL_DESCTYPE_ADV_ONEBUF` o=
verwrites the register, clearing the `BSIZEPACKET` (Receive Buffer Size) fi=
eld to 0, which violates the 82576 datasheet.
> - [Medium] The commit message incorrectly claims to add new header macros=
 and remove legacy CMD macros, but the patch contains no such header modifi=
cations.
> --
>
> --- Patch [3]: [PATCH v3 3/9] vfio: selftests: igb: Use advanced TX and R=
X descriptors ---
> commit 44f58d3e0349aa95894e8741ae9ff09ee319dcae
> Author: Alex Williamson <alex.williamson@nvidia.com>
>
> vfio: selftests: igb: Use advanced TX and RX descriptors
>
> The submitted driver builds a partial legacy TX descriptor (just
> DTALEN | CMD_EOP) and never programs SRRCTL.DESCTYPE.  QEMU's emulated
> igb tolerates this by treating descriptors as advanced regardless of
> DESCTYPE, but real 82576 hardware does not.
>
> [ ... ]
>
> >     Remove the legacy CMD macros (IGB_TXD_CMD_EOP, IGB_TXD_CMD_IFCS,
> >     IGB_TXD_CMD_RS, IGB_TXD_CMD_SHIFT, IGB_TXD_CMD_LEGACY_FORMAT) that
> >     become unused, and add the SRRCTL register offset, DESCTYPE encodin=
g,
> >     and advanced TX descriptor field macros.
>
> [Severity: Medium]
> Does the patch actually include these macro changes?
>
> The commit message claims to remove legacy CMD macros and add new ones, b=
ut
> there are no header modifications in the diff.

I'll update the commit message. I removed those macros from the series
when I added the real IGB headers to the first patch of this version.

>
> > diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools=
/testing/selftests/vfio/lib/drivers/igb/igb.c
> > index 58c6aceea63a9..f4f6d2ee262da 100644
> > --- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
> > +++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
> > @@ -235,6 +235,17 @@ static void igb_init(struct vfio_pci_device *devic=
e)
> >       igb_write32(igb, E1000_RDLEN(0), RING_SIZE * sizeof(struct igb_rx=
_desc));
> >       igb_write32(igb, E1000_RDH(0), 0);
> >       igb_write32(igb, E1000_RDT(0), 0);
> > +
> > +     /*
> > +      * Select the advanced one-buffer descriptor format.  Per 82576
> > +      * datasheet section 7.1.5.2: "SRRCTL[n].DESCTYPE must be set to =
a
> > +      * value other than 000b for the 82576 to write back the special
> > +      * descriptors."  struct igb_rx_desc matches the advanced one-buf=
fer
> > +      * writeback layout (section 7.1.5.2), so polling rx.wb.status_er=
ror
> > +      * requires this format.  Section 8.10.2 specifies DESCTYPE[27:25=
].
> > +      */
> > +     igb_write32(igb, E1000_SRRCTL(0), E1000_SRRCTL_DESCTYPE_ADV_ONEBU=
F);
>
> [Severity: Medium]
> Will this overwrite the SRRCTL register and clear the BSIZEPACKET field t=
o 0?
>
> By clearing BSIZEPACKET (bits 6:0 of SRRCTL), real 82576 hardware may see=
 a
> 0-byte receive buffer and truncate or drop received packets, causing the =
test
> to fail on hardware.

Alex already addressed this here:
https://lore.kernel.org/kvm/20260529142439.5bd03e5f@nvidia.com/


>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-igb_v3_b=
4-v3-0-1272650ca614@google.com?part=3D3
