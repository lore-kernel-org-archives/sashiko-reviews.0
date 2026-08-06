Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5656F494809
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 19:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786045146; cv=pass; b=mdLcxmabcG7vKRTIztDBJVnJKPTMk8nCgVtm1ZJTmNPuSR+aN6oq3pQ90fzbRinwWm1s8f+nXw/K/IauLTmy1zV6V2CUIi+MJGlbDfdA+IxeHwEyD5Icx9CuIW8d82poO4jnozjixRus3CHqb97zWwb8CXqmGtGJQwfWpoqPGJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786045146; c=relaxed/simple;
	bh=pZsRu4bih/fOebs02+cyeryB8ah9q5y2Gx6ty4QhO3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMsVjLwHh6X8lbe/lVIFeaukmP2jlZVvb/i4LjMS6b5Alqi649IYPoQZgsSDZvpsPxKoaN1KFnZumHODnxqdLXYVVhywsXrtkVECjimKp0uUMEyr9utzsB6kx5FTTymIM5TxpUIR4rIMIzSlHwCG09d/OyTzze1S9BAolezSc2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFl521B5; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFl521B5"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c0c45c580so15988461cf.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 12:39:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786045144; cv=none;
        d=google.com; s=arc-20260327;
        b=AkKXwi8IYfuW5xzcFu3/INnFu5GxQVBWYmtzqdIv2PGPcMmze+VCJ238EULpzN1vTC
         bL6SR2rTeKUxMPpw5ZSvUE+/iiPJdrE6sRNhk/9eNnMIl/qsTLNoxeS10b3FrF+CGcB7
         7Hv9YqbEzJZ1Id313HN3rnRhjV2gpl2oaxczxcOnlS7HGhrPScvmzCfI6D7+OoWke7bu
         qEZs1l/fPVz/QzDXY1TjPCTz+MB9s7NLkBWgkX6MigmdX1DgUbwhTn2ThZ5ZUAo5kMq6
         8Q/rfPDpR9Ew/4nK9IxPvxssXrOUS5O54e+4T0BJLwiRdBuJ4TPd6ffqXrQx2sriwuGU
         mAig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NNryo2myA6o1ZLmEL9pxSp2a/VR8Nun1pZv4kg1nG/o=;
        fh=2E8G5L5HRIhYv0SLHRh0bmuG4bK/RxhrEd6+zC1U6gY=;
        b=Mcj6Yxc+leG8DGxWg8BbWWa0UskniI8cKeW/xKKUdmQDxQ1ExQiJWYdF6bL0Wkivws
         iV8o7EbDEvTH7m1Irq4p8deI4ZsiFGlodwT667mfgmVHLTM3wlyoImstTuoW8NQRFDmb
         dIJMvNsJZ+iuX1jy+P0lz85jqIRCWFHIerf2nLjSxTM4QSjjLNSDET06nzb7VZnj96Sp
         rqvMIpD5GvVorqatT9IpPYoW8nxVVSjB8rFkkhisLSqnJR1D5gAya8mn0z1csdhGNuID
         gJbeugLaBvj2ZT54cq5yzyuG5uuucV7T8wqD9GqujqN6LoqDLVwjhUb/mSvoIuvNsYXU
         MPAw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786045144; x=1786649944; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NNryo2myA6o1ZLmEL9pxSp2a/VR8Nun1pZv4kg1nG/o=;
        b=CFl521B5PSWUSS2aTv228p+U/8EtSwjEtqK//7Rf1CbzM+unbV6l66BXSbbW89VgQz
         7dlQx1jWAzoazy9bvTLYwlgJH3xQPZETpA5k60qbSst2CZgikYjN1rhYBHgkkylLqOtx
         mSDBS6ybU4FFAtaPZzIDkbc7o8xbBHInX525EpVTMarLw1qNJ3rPtqfYq8wZJ5BDVof9
         y1qw0F6mBkuTf9hqFAOysSHltJp3R8CjJd7vqL+A7qOsc1KsZF8IwxPLZX1hQxc3SHHh
         Q2Xa5DT+fPVr715MnvBZWm63Hq00vPpY93HohNSoNduM9oFAU7oJMZmu8dlvyNlvIx/H
         XrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786045144; x=1786649944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNryo2myA6o1ZLmEL9pxSp2a/VR8Nun1pZv4kg1nG/o=;
        b=bSKxnlZExXxHGh4poNsyXZRnRbrLpcRP9goRS69JAyBH7DLvO3rmmsvLOUweVySkea
         34DFzTPD9b1aqtYE+S+2SeG1cZh8qDy7bcJFwj6LqRm9jFvtE/ItzxiTnRQyQ6hBu9oK
         0oa/gyQHPILvi8LLhdfZqbg2KzJkOOoQSf3TIztO4PX8N0QSLHr8yq1Cx6IId/rLYJ7q
         lQJn+hAarIYB+COs+Jj+JI9sBGcBKjQ5eScmUpkzk1p+F6V7B4xhDPt3KiDBAebPbr72
         f0flN/xLRGloAjwgT9a8aj/gHTv2d/fxwHtzxJaRRivflJbI7ZMU2hR55WFpiQBD3XYb
         kNkg==
X-Gm-Message-State: AOJu0YyLCgcUhmqub2bq8bEv/9CWoIi8BWZseVQbHgdTnso/2+i4hl0+
	louFBNOjDrPpDYpKSZ2OZYUH2O0y/068trV81aEJVXdGys6ibE1zsuvZRWhhDFr/XWzRGbQDjvU
	6qPsoh4oQZqprBBZPKz1BaIl+rn7NAyLUQUEAdXc=
X-Gm-Gg: AR+sD11YIXbJom+VI9hfGG5XdxCVWqdMjQ6r0vkuKeCN3tFacZ0sbtq3wTZgJIm40gM
	v5CKNu53GC8D2t0Q+xE/96GFWZJSIaIJeCE/Sj68tAYm4XCsY/q5kKtA5NGw+/wE6zkkzTvlONI
	/HPPGdnJpRrv161+yWIU7ccayZrMglV7AoE8CQULg+4RD90yeedFv9hnIhykiSaWxAy2HByKDKu
	MTPCkvV9wgbSKFik2XCsaAzMFo2gtLC8Ztq/l2KbZ4tkJqJtvheqgSJ+a/C66m3O7u2iB2GVKJh
	pGFmb6o7tUbyWNpEwwBlqS7inl0FEXNdXr4rQJgxKb3WLg==
X-Received: by 2002:a05:622a:411:b0:51c:e14:87a7 with SMTP id
 d75a77b69052e-52ce60e900cmr177493651cf.28.1786045144090; Thu, 06 Aug 2026
 12:39:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806190439.12022-1-derekjohn.clark@gmail.com> <20260806191942.39B691F000E9@smtp.kernel.org>
In-Reply-To: <20260806191942.39B691F000E9@smtp.kernel.org>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 6 Aug 2026 12:38:52 -0700
X-Gm-Features: AUfX_mz1my3wgtPNVK9lIPUcA32hoZSI-uH2kaE1mQFxmSM0blLQR-HhSyV2W4A
Message-ID: <CAFqHKTk47MvjVvijt_JKH53pMmaNMWSGvU9QkTuj6zJ7XHhnXQ@mail.gmail.com>
Subject: Re: [PATCH] pci: quirks: Disable native PCIe hotplug on MSI Claw A8
 root bridge
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 12:19=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The quirk disables native PCIe hotplug on the shared host bridge=
 rather than specifically for the target root port, which breaks hotplug fu=
nctionality for dynamically enumerated Thunderbolt/USB4 devices system-wide=
.
> --
>
> --- Patch [1]: [PATCH] pci: quirks: Disable native PCIe hotplug on MSI Cl=
aw A8 root bridge ---
> commit 841400e3b6d906dff0f94738835128127178d2e6
> Author: Derek J. Clark <derekjohn.clark@gmail.com>
>
> pci: quirks: Disable native PCIe hotplug on MSI Claw A8 root bridge
>
> This commit adds a quirk for the MSI Claw A8 to prevent s2idle resume fai=
lures
> caused by the Realtek card reader. It disables native PCIe hotplug on the=
 host
> bridge when the specific root port is found.
>
> > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > --- a/drivers/pci/quirks.c
> > +++ b/drivers/pci/quirks.c
>
> [ ... ]
>
> > +static void quirk_claw_a8_no_native_hotplug(struct pci_dev *pdev)
> > +{
> > +     struct pci_host_bridge *bridge;
> > +
> > +     if (!dmi_match(DMI_BOARD_NAME, "MS-1T8K"))
> > +             return;
> > +
> > +     if (pdev->bus->number !=3D 0 ||
> > +         PCI_SLOT(pdev->devfn) !=3D 2 ||
> > +         PCI_FUNC(pdev->devfn) !=3D 2)
> > +             return;
> > +
> > +     bridge =3D pci_find_host_bridge(pdev->bus);
> > +     if (!bridge)
> > +             return;
> > +     dev_info(&pdev->dev, "disabling native PCIe hotplug\n");
> > +     bridge->native_pcie_hotplug =3D false;
>
> [Severity: High]
> Does setting bridge->native_pcie_hotplug =3D false here break hotplug
> functionality for dynamically enumerated Thunderbolt/USB4 devices on this
> system?
>
> Because the pci_host_bridge is a shared structure, modifying it globally
> prevents the pciehp driver from claiming any hotplug-capable PCIe port un=
der
> that domain. While this might be the only fixed slot reporting HotPlug+ d=
uring
> boot, downstream ports on dynamically hot-plugged PCIe switches (like
> Thunderbolt docks, eGPUs, or NVMe enclosures) rely on the host bridge's n=
ative
> hotplug capability to function.
>
> Would it be safer to clear pdev->is_pciehp and pdev->is_hotplug_bridge on=
 the
> specific root port instead of modifying the shared host bridge?
>

Hi robot, and any humans reading this,

This identified something I missed when scoping the patch. The two USB
ports on top of the unit are USB4/TB capable and are affected by the
root bridge quirk. In a previous version of the patch I did try
pdev->is_hotplug_bridge =3D false to no effect, but was not aware of
pdev->is_pciehp. I will try with both and see if that resolves it at
the lower scope.

Thanks,
Derek

> > +}
> > +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_AMD, 0x150b,
> > +                      quirk_claw_a8_no_native_hotplug);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806190439.12=
022-1-derekjohn.clark@gmail.com?part=3D1
