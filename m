Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4141CD1E4
	for <sashiko-reviews@lists.linux.dev>; Thu,  2 Jul 2026 00:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782952090; cv=pass; b=tx4J0l+KVxDdN7ttgPNmRNThcPxVUBnViIHYhFw3xJ3qwyuBvJHPXy5woQrN7F/Fgt9y/xFMfh3BCJS3FoI3uOKTbZIroN7fcWW38vDdlp94u6wU9BlGwgDI+MrNzFR3scUGxHeoHYer06i7KxwY3hfMeaUxh7MhUG+fEjrKHh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782952090; c=relaxed/simple;
	bh=PRpLlpspsJW+v9bAkQLyB59Dz43JAAtvI4RiutteAHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TQRpP1gpCVKhQC61cpLthjmLCzJQHKyUzkahyC35+dmemwz4Ul60XumvTSNj6gWtUXuCcrbRUPF0zjOJMS0oPpE2byUwgcG+aRRYy6uXerYKyyaLEH9ebSpUBB5oKosDKpZDjhaHSqv0pmGNluH9mw56/cdougesAQk1W+ReKJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXZ7WFP1; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXZ7WFP1"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c126fe7d0f3so154043866b.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 17:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782952086; cv=none;
        d=google.com; s=arc-20260327;
        b=IjOM7XhbwHzFWpQ/nO12P2A3f6US2Nzd3BX9FeloVjrR6aWUNTmcC2WYywTj0CRyZH
         vnUyQPKaDcpuzC/6lxhLJ2ScbXjOi34bD+oyAIwcTbsPLcSSz/ZVvqhYVVvWa2lrbSI9
         ij3NO+7sWfd8r0MaNx1Se6cKHpEL7ohaP2++onotggPBTW9Rzi0Qd8yNlOMdge73uk0/
         elpE4g1zAz9kFdEY53pXrk/cQkrfgH0RRy9nTklFITmkI8T2TWYpD8yFI/ym6QbsGSOx
         Pg47AUJz9s99vwbQF3jL+X14of5x6XrQt/qomQcK2/TiTv4pOSTZHWlG/e3qX2PLNJLz
         AEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=We1bG2+WbAmOyWnbL+0rX50B3Kc6N+qu5xoD/0ufFUI=;
        fh=eAclegJd5/9JZgcjAF4JAuzGkts5iGJ+OyWCxlO0gLY=;
        b=PcyL8BXHm+Ek0uvsTX2mj79Pxe8mVDDuxgG6CB1jEGuAOHV1ZP5DCaz5LRFxJUxVsA
         l7AkVDQFZ7UqVGcRY0u+bgRKOmkrdSmgTlu9G7E6KJirVrhVUrrBcl83DoNy3Qs+TkhV
         K1CaXFYI5fWHNrQwIz526XrRIZf/DynsNa2TxvvsYMegVPHoHl2PEFDZGlirjAgCck96
         bJalDqiq48t8RWel7bPfffL9q2ECNC368LjsBNu0hRWn/23ecCYtcjfgvxXqeKMDEaDj
         FP29B2mtWkwjfsomKsRmf3CgzgQorbWjsrrauCm3DXTYq04U+hWwAeefMlwlHW6xjmpG
         84Dg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782952086; x=1783556886; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=We1bG2+WbAmOyWnbL+0rX50B3Kc6N+qu5xoD/0ufFUI=;
        b=sXZ7WFP1szG3Hre4P66dIN/bER4FN79he10HR833F2pkHkhKf4mjWIFTyCqnC1oTq4
         QtXJRfYP4oHMslp91n557Kp1tyAVRXR8Dt03igB1NAjuyADIhXIFp44cZJw7Y9mBPwP4
         DGm73V1qoTT7GEYXerWGcb0bw6IfpCzj5bAuRIDEqEzGHGdYxA+WNZrDFUdvhISNssrb
         rB7C0clLVEc27ehlrN0TNnhvmFl5p/tn594CtaK14snxKVY+2QBuI/w3zbHiasT58Bi5
         oc+l9uc+ZdzpiLsPgd96TJVkOXrlSMnFeO98g+/FlXgArv+e+hQGGnC8sBh6OSxl1OEj
         jAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782952086; x=1783556886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=We1bG2+WbAmOyWnbL+0rX50B3Kc6N+qu5xoD/0ufFUI=;
        b=H1VslMDPzUdzQUo0fWzy1RLv9DIuEN0jjPGhyi9L0b7tZs6RM6pSF94rXZelZzbIEY
         Sw7HJhV4BgxYLbM8ijUyHDxNcSdwS98qtg2F6s2r04J+bISKG+mNhZfeytZ6TJU9vREI
         s4I4ZoHYNngHu87cjiHUf+BHV34F6xPzimp1efLA1Rv7GAOiqxzSM1dHM77iiwzTbmke
         FTfI39Ob0aITcOIjtN2wLqA/YV5C70bmCoEIpQxGKpBt8xGMO9yNAT6whNE2e3PNPcuB
         +5n0EATwbIfoP6S53K3mZXosQGhkBSvDlq4viH5vu5z+qb8JzBuqu79/zNe+IyNi2bcG
         D6lw==
X-Gm-Message-State: AOJu0Ywx8kNJlWGAYbuwo2TMDLhO697N08ByExLTb1mzI/gb4LGvXYwA
	LhyCHslfkWQl33gXK6/FNjV5fgxpnFnSaJlKmIqTVZIOlvvVJQ0F2udB1sNziWJvxHFGe3608TB
	XZ/hutfBYDJ3HWQPRT2gHm1eoivXETtvxrA==
X-Gm-Gg: AfdE7cmMVx7W75DLVhq5DNl3aCUZf/c8rQcWk78wQjZH9PQsTiTPm7Rz1k2lWBIcMsx
	1AIRMuAihi8KkzYwlxH6xoMgwa8BRw7nnOAAayjTOKPg7x8oLlLJMFtf3JpMzh2HEeK7vCFLkLO
	9Pqg9JTv8TLxmDpILvAxlFhV98k5pgy7PBVW/99ijvFxH+0AdjzV6dL5k8sI3pihbsk4fpt6VAf
	djV89ytwe2doyKT0eNbgOv0hP5Rb67BioV/3Lji2JXx15R2ze4AcXQdzp0Gr+18PLcrNSNyQC1f
	ZiIU7TARiGNd1Zizwb24oLSQ0gh6fo93VPlKaguxbGWiUE2PoP2MlozkvG8ze4UlFemhLt4A8/T
	PCpd2k1XZgmzHFojAaC7sTfBjFqE=
X-Received: by 2002:a17:907:e143:b0:c12:3590:2bcd with SMTP id
 a640c23a62f3a-c12a9db678cmr131155866b.29.1782952086416; Wed, 01 Jul 2026
 17:28:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702000350.68331-1-rosenp@gmail.com> <20260702000350.68331-5-rosenp@gmail.com>
 <20260702001341.AD7041F000E9@smtp.kernel.org>
In-Reply-To: <20260702001341.AD7041F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 1 Jul 2026 17:27:54 -0700
X-Gm-Features: AVVi8Ce_zg8-2_VISqacBAZy-gMgVLc16q43Xb__VdoFqDMMrz88Vcz3wwROn4g
Message-ID: <CAKxU2N9iNu+FhsRVgNW6dqzymoN5hYfHfyBu4E7UN+WNzv3kaA@mail.gmail.com>
Subject: Re: [PATCHv2 4/8] ata: sata_dwc_460ex: drop redundant struct copy of port_info
To: sashiko-reviews@lists.linux.dev
Cc: linux-ide@vger.kernel.org, cassel@kernel.org, dlemoal@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 5:13=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Returning success (0) on `ata_host_activate()` failure causes a =
kernel panic on device removal.
> - [High] Missing cleanup of DMA resources on probe error paths leads to U=
se-After-Free.
Both fixed later in the series. This thing is still broken when
changing [PATCH] to something else.
> --
>
> commit 1231cd1ac0d6ac3ad6a4b61a9f9cf20df21198d9
> Author: Rosen Penev <rosenp@gmail.com>
> Subject: ata: sata_dwc_460ex: drop redundant struct copy of port_info
>
> This patch optimizes sata_dwc_probe() by dropping an unnecessary local
> copy of sata_dwc_port_info[0]. It directly points to the static data
> instead, saving stack space and correcting the const qualification.
>
> > diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.=
c
> > index 4fc22ce4bd9aa..f262b00384ac4 100644
> > --- a/drivers/ata/sata_dwc_460ex.c
> > +++ b/drivers/ata/sata_dwc_460ex.c
> > @@ -1134,8 +1134,8 @@ static int sata_dwc_probe(struct platform_device =
*ofdev)
> >       int err =3D 0;
> >       int irq;
> >       struct ata_host *host;
> > -     struct ata_port_info pi =3D sata_dwc_port_info[0];
> > -     const struct ata_port_info *ppi[] =3D { &pi, NULL };
> > +     const struct ata_port_info *pi =3D &sata_dwc_port_info[0];
> > +     const struct ata_port_info *ppi[] =3D { pi, NULL };
> >       struct resource *res;
> >
> >       /* Allocate DWC SATA device */
>
> [Severity: High]
> This is a pre-existing issue, but does sata_dwc_probe() correctly handle
> ata_host_activate() failures?
>
> Looking further down in drivers/ata/sata_dwc_460ex.c:sata_dwc_probe(), th=
e
> driver logs an error but returns 0 if activation fails:
>
>         err =3D ata_host_activate(host, irq, sata_dwc_isr, 0, &sata_dwc_s=
ht);
>         if (err)
>                 dev_err(dev, "failed to activate host");
>
>         return 0;
>
> If ata_host_activate() fails (for example, if devm_request_irq() or
> scsi_host_alloc() fails), returning 0 falsely reports successful
> initialization to the driver core.
>
> When the device is later unbound or removed, sata_dwc_remove() is invoked
> and calls ata_host_detach() which calls ata_port_detach(). Since the
> scsi_host was never properly allocated or was freed, scsi_remove_host()
> will dereference a null pointer and cause a kernel panic.
>
> Could the return statement be updated to return the error code instead?
>
>
> [Severity: High]
> This is a pre-existing issue, but does sata_dwc_probe() leak dma resource=
s
> on error paths?
>
> If CONFIG_SATA_DWC_OLD_DMA is enabled and no "dmas" property is present,
> sata_dwc_dma_init_old() is called:
>
>         err =3D sata_dwc_dma_init_old(ofdev, hsdev);
>         if (err)
>                 return err;
>
> This allocates a dma controller via devm_kzalloc, requests an interrupt, =
and
> registers it with the dma engine subsystem.
>
> If a subsequent probe step fails, such as the phy retrieval:
>
>         if (IS_ERR(hsdev->phy))
>                 return PTR_ERR(hsdev->phy);
>
> or later in the main error path:
>
> error_out:
>         phy_exit(hsdev->phy);
>         return err;
>
> The function returns without calling sata_dwc_dma_exit_old(). The driver =
core
> will free the devm-managed memory, including the dma controller structure=
s.
> However, because explicit teardown was bypassed, the dma engine subsystem=
 and
> the interrupt layer will retain pointers to this freed memory. This can l=
ead
> to a use-after-free if the shared interrupt fires or the dma subsystem
> accesses the controller.
>
> Should the error paths be updated to call sata_dwc_dma_exit_old() instead=
?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702000350.68=
331-5-rosenp@gmail.com?part=3D1
