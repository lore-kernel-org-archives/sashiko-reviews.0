Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5DE42E8D3
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 22:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722076; cv=pass; b=BVzjHRJO68XRlJTT28ff5xD0A5gy44Eryw5xwBu/72sxx5pDPqgr0TpS5jIxIDZ/Jt76rQQmj0YeSlLVODJWHjAJ3A3uzSxh60Kk5FEJf3wgwRUdtc6jQP6U04nGF11+97GNQjAcsKDJuV/lR7snbVjGe1CqsYam2c5knSTCdHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722076; c=relaxed/simple;
	bh=AexQyWdtnOBNxCR14romYussjnXujihHW3o7Jk8KjV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ir6/PCl8/RwXS/iCj64pOU0LZred3egeRJPamfXnjRnbggFPIkKmVijnMACs+VplKsPQwMl4HSm9fnCSv3W9Np170lfa5NV8HJzX/scrym4ZsG1/t96HUucFASDdzITP8+gPuz1M7yfxQaprMEY4omBcXFgD5fJWBMQz1MzS9T4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s9Q6S9Kt; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s9Q6S9Kt"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ccf2360620so12931905ad.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 15:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783722075; cv=none;
        d=google.com; s=arc-20260327;
        b=QqjaM0amZRNCRCX+p7O1zWzJBVvMqbvCfPmZSMWHB6EFy29z1S+ZQPFBvTdVvMEUbh
         1zwCPdztDIrGXJ3b08pMhyQCLwBo56axjKdkUML9pvgANYSS0zzUa8QbvP1BG7H5TaQk
         XHpH6S6bMYjtQ0ZrqG+j5AlGq9GirbTVRvo4dIEoO7Vl6z+7Rb7MBhg7TJxmpqFxWk29
         hrD7xKq3IJnZsrZLgVR2Q4G2PWEhT+e85ujmRWldrb4BSFsMlmQ5m5L1aH+qiNlwKBhh
         S7MWrFNulFfO38H/YCLhuiaUmviCwDR4YefHLloTGeXGBCbhQ20fzhG6SvL48D6xARkp
         aHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eJQ12QuZIJ5EMRjO8Od9KXNRvzbL6BoA/mx93EpDKlk=;
        fh=2E8G5L5HRIhYv0SLHRh0bmuG4bK/RxhrEd6+zC1U6gY=;
        b=SRLEy4SCGZOCqzkBuOIkbGc97GaKd2tcdi4pZC2s9aRqoYOXOPJW7P40fspTM3g7nd
         d7pP5yY+NClpLXNqQIuXyfrmgvEoc1ZSAh4ep/RrOcPA5tRCqGHTD7W2wcSa5P7qBGyQ
         bAeepHqIzcDNFAfql0SQ1n5/lblr6+gPHb3drKMjCCpI/guMOCkia4tqiZCQoPnUlgcH
         e7FLTlr3MkqXjn48AzEYXcu+YUe3jjDHMYLLCHtw1NGK6OAciKXevJ9lqKHpORTwXnbN
         y5Ynhez0/KULyzHBj0lM/8+9LDMRQudPV5fs0NgAZmNoq1yk3O+puGbDKgKYfmJD6FIz
         z7+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783722075; x=1784326875; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJQ12QuZIJ5EMRjO8Od9KXNRvzbL6BoA/mx93EpDKlk=;
        b=s9Q6S9KtijC2DmEjwJ5fzibTvbMFHrPVoheSWKo/O1cwHHdqw0HTUalINRxQxWATph
         oWTj6nF1KCrj4hNEA3hu5POP8DrX4k/SUQqFd0Th4iTukGgmP+S67IfV6GmkglTivjY3
         NcbgnGyoyx75CVrbq0UTOsjtARWU3W4NYiwssK1BtugTXjUFCRlOnaFxyeek+6h4H3+5
         9PIEYAkmWtuMlv0+KfZ3svjoWZiyJ0aFcLaKpSxvWyL94OnUVE67tWZEQNd2oiZpVhpo
         bxwdSgec358N618admVVjYWYLjZ5MuefKo49JG/Y5roif3QrFP1UtG0te6VcfjKKEwWt
         bgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783722075; x=1784326875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJQ12QuZIJ5EMRjO8Od9KXNRvzbL6BoA/mx93EpDKlk=;
        b=XJPQYn5r4FBx3N/h8xef/OeLPkRlP92VDkaVhcU1gdPJVgic6X9jYN4MczqsiIRbny
         ztiPEBrfEL7EUf+WWctSlwEUOAWycRc4DXYoKw6ZHiv6cZL8mYOmijAl16i6i7Dyyk3Q
         ZbjibhQ1hp24ioGxTRNaVuQS0QbElAYSC6ImYY0lxFpVO08J9JBZQbGgGQBs9m4cy3Rm
         9mE15IoUY8xJ7ai58uXscbJMzvToQ47kv0F547i0JcudsIzq3axe9HaEl7K1KCs5Fpjg
         mz7Jf+x3hUMWe6sa0MBNr+LqzXoXqFwjS4HPeG47vpordF6ZimCCJ3VwjjaR2GxGKGbC
         isOA==
X-Gm-Message-State: AOJu0Yw+kRxGBfW5IqOGuCV/eSgbHKjFxbNAyFkUlxkRFudyS4+SzFtv
	e7a6wVTt7quhGmM5Vdzof4qVJ4q83Pcd6XWX2IFnbN4n7oGdnPsf+OMaWox5T6X9uTEF0LsA1BK
	QUYThMxwecrzAA826v5Ug0EorUiJrqh261Da0ZyzSVLP9VaHrLGpHLLX6
X-Gm-Gg: AfdE7cmiiSXVwgx1Mg2jFOC2ndyNmQsmOs8RMOI/oFdASpq4AOzX//iEKl18tnn6+pX
	XkquuuZaj+D/C6HynkxNcx22fRkGvE6W1hyEsXZaDT3MSRxiF8CgDEmn9guXffZQC46HrN7IxFH
	LhvLbcYafvlr3q5N+GcsP5QGb9NXml95xKcbYWZvbv4oDDlNV5oI54X778MNZmfRFmslcXPp6W0
	Wr7br5NAR42YVuh2jlQb0u2Nx9+3/4A9yA+mm8qSpcJkUBSXZwO/a+HFyHG87RR79oiem6e
X-Received: by 2002:a05:6a20:431a:b0:3c0:b766:7500 with SMTP id
 adf61e73a8af0-3c110bd8c49mr741431637.68.1783722074179; Fri, 10 Jul 2026
 15:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260710212616.1351130-1-dmatlack@google.com> <20260710212616.1351130-3-dmatlack@google.com>
 <20260710213902.56C6C1F000E9@smtp.kernel.org>
In-Reply-To: <20260710213902.56C6C1F000E9@smtp.kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Fri, 10 Jul 2026 15:20:47 -0700
X-Gm-Features: AVVi8CdWY4CLdCe1vaQDkifwOsvrPs1KJiTBtDjvCkcdYtirLyoV_GSd_ZjCv0E
Message-ID: <CALzav=eTgbKt2dfYBd3FrLm_epGncLpOC7t=52u2xn-gSd1qLA@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] PCI: liveupdate: Track outgoing preserved PCI devices
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 2:39=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Missing lock acquisition in FLB destruction callbacks allows con=
current operations to trigger a Use-After-Free.
> - [High] A dangling dev->liveupdate.outgoing pointer after an aborted Liv=
e Update leads to a Use-After-Free if a subsequent Live Update is attempted=
.
> --
>
> --- Patch [2]: [PATCH v7 02/12] PCI: liveupdate: Track outgoing preserved=
 PCI devices ---
> commit 9a74c06de23d913aa84d2cbcc2aa3409bb1d2eb3
> Author: David Matlack <dmatlack@google.com>
>
> PCI: liveupdate: Track outgoing preserved PCI devices
>
> This patch adds tracking for outgoing preserved PCI devices across Kexec
> Handover (Live Update). It introduces APIs for drivers to notify the core
> when devices are preserved or unpreserved, updating the PCI core's FLB da=
ta.
>
> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > index 899758883dd5d..03075ce06ac98 100644
> > --- a/drivers/pci/liveupdate.c
> > +++ b/drivers/pci/liveupdate.c
>
> [ ... ]
>
> > +static void pci_liveupdate_unpreserve_device(struct pci_flb_outgoing *=
outgoing, struct pci_dev *dev)
> > +{
> > +     struct pci_dev_ser *dev_ser =3D dev->liveupdate.outgoing;
>
> [Severity: High]
> If a previous Live Update was aborted without explicitly unpreserving all
> devices, will dev->liveupdate.outgoing point to freed memory here?
>
> During an abort, pci_flb_unpreserve() executes:
>
>     WARN_ON(outgoing->ser->nr_devices);
>     kho_block_set_destroy(&outgoing->block_set);
>
> This destroys the block set backing the dev_ser allocations, but the
> dev->liveupdate.outgoing pointers on the actual pci_dev structs are never
> cleared.
>
> If a subsequent Live Update is started and pci_liveupdate_unpreserve() is
> called on one of those devices, could we dereference that dangling dev_se=
r
> pointer and corrupt memory when clearing it below?

This would only be possible if a driver violated its contract with the
PCI core to call pci_liveupdate_unpreserve() when the device is
unpreserved.

>
> > +
> > +     if (!dev_ser) {
> > +             pci_warn(dev, "Cannot unpreserve device that is not prese=
rved\n");
> > +             return;
> > +     }
> > +
> > +     pci_info(dev, "Device will no longer be preserved across next Liv=
e Update\n");
> > +     outgoing->ser->nr_devices--;
> > +     memset(dev_ser, 0, sizeof(*dev_ser));
> > +     dev->liveupdate.outgoing =3D NULL;
> > +}
>
> [ ... ]
>
> > +void pci_liveupdate_unpreserve(struct pci_dev *dev)
> > +{
> > +     struct pci_flb_outgoing *outgoing =3D NULL;
> > +
> > +     guard(rwsem_write)(&pci_liveupdate.rwsem);
> > +
> > +     outgoing =3D pci_liveupdate_flb_get_outgoing();
>
> [Severity: High]
> Does the destruction path in pci_flb_unpreserve() also need to acquire
> pci_liveupdate.rwsem?
>
> If a PCI device is hot-removed concurrently with a Live Update abort:
>
> Thread 1 (driver remove):
> pci_liveupdate_unpreserve()
>     guard(rwsem_write)(&pci_liveupdate.rwsem);
>     outgoing =3D pci_liveupdate_flb_get_outgoing();
>     ... begins modifying outgoing and dev_ser
>
> Thread 2 (Live Update core abort):
> pci_flb_unpreserve()
>     kho_block_set_destroy(&outgoing->block_set);
>     kho_unpreserve_free(outgoing->ser);
>     kfree(outgoing);
>
> If pci_flb_unpreserve() destroys the outgoing FLB without acquiring the
> semaphore, could Thread 1 end up writing to freed memory?

No. Drivers must call pci_liveupdate_{,un}preserve() only from their
file handler callbacks, which cannot race with FLB handler callbacks
(enforced by LUO).

>
> > +     if (IS_ERR(outgoing)) {
> > +             pci_warn(dev, "Cannot unpreserve device without outgoing =
Live Update state\n");
> > +             return;
> > +     }
> > +
> > +     pci_liveupdate_unpreserve_device(outgoing, dev);
> > +}
> > +EXPORT_SYMBOL_GPL(pci_liveupdate_unpreserve);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710212616.13=
51130-1-dmatlack@google.com?part=3D2
