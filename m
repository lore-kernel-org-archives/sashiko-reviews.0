Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D02E3932C2
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 22:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722743; cv=pass; b=QZVBP8qc7nrv2maZVCtw6PaFQs4DraJjp3vrpSpCjIvKdgT2dRR8O4oDYcKndqhWv7huPYRdYS1hjNuItZPOaFf7GHz6z3yvpxdR2nsvNxXHICGLToB8mD7ceG8FfkA+VqnD5/Wv/TbekvqwFAZzTbgPKKygWfck8KM24XSOrJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722743; c=relaxed/simple;
	bh=n3jWPBEXC7YO12UP+Hg3xDyh43EJdvNxaruIU8/G3A4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUF0X5PaBo5nQh34a499um1sfgRUJCtMdu4XmKFJ8QABDPBwo6DTNK0k6DQGK9oekTnrg+HC/zumjyrOMHm6OlnHom8mS3E1lY09Oeu7JlG05Nk4mp7EO10s0uZEYq4SRtB+g3OkaV5YGyHzvWURN9qPgykeW4KNqTZAnm5kUvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RQ4/0T8L; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RQ4/0T8L"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cacf197759so19842315ad.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 15:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783722741; cv=none;
        d=google.com; s=arc-20260327;
        b=OIYaPnwUWzKyLkE8p1lZP/eczV/abZND2IDLe7LGK6Sd9xwPhPrfVZMg/weiZXXop6
         0FuY4P6Gwc/2MdHViF75Fg44YdXXAxg8Zor/rFNdSjwOGe06QlJ3IiNrr+6FFDndlPEh
         sEYxEAJaDbEmk229iehIc8hS+9pK20vzVBMYVkHvjObJHty5mYewmNiQ0yLEsFN3jTXF
         6xW8UUCULxKJF4M1LSKiSQpOgtLZheVnOHED8ixIQKYxGMsZZnhXOFGeEDc99Ci9iIxV
         vSRcKHEzUTD5hh1N293W5F+anRmHAMkBrb08y6lNt5V3F68iRgMv69QrEc5ApscCNpof
         JJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rEqvrzWdNs03NSYY4Llo7JEtAwRyuEAURCyKKRu8aMg=;
        fh=2E8G5L5HRIhYv0SLHRh0bmuG4bK/RxhrEd6+zC1U6gY=;
        b=CmmY75/Oe8noN3FcDWvgNrUsuEaNWacLFW0zjgWY51s8cqtd/SfIlXkr7gPh19PnHD
         rYjLBY/z1onhMWLxpIxzBRb8xD0JDbnsQsN//vs9efeCOqInr3C3Asb2lUZg1kRvSuLS
         Zdbkac6RVAa1RqpPWoGYQAJ6Xzsl71OG1S3avxLtn2MRoJKjq7u2n67SAMUeGvpYidah
         TYXwVZKeWBfPI4pExIZPSNY73/qFRGBWHTAy5PtG2AHZwIYuDJzsSSZen91MuJsznlPf
         uLTvxdxf/hQzy+lfCz711chzN9xAozF3wSHrQPH4+KC9ZIcmBrvfEBwjTulZNH8qVQi8
         EGoA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783722741; x=1784327541; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rEqvrzWdNs03NSYY4Llo7JEtAwRyuEAURCyKKRu8aMg=;
        b=RQ4/0T8LBssCYxTN1ieaUtglOiq6Q6qt6Um7NAD2aVqH7xXjbAFMm2G1nfDVQde4c+
         KKUtJZlIwBY9ySR6DlamKKFkrYpbKRZcUbgVmJYbnCpD3W+nIbL5K3ZFNag8/tThO/4E
         +tHN7SVaIMgqdIBGFAdcit7ZpxSeVUOO14abL4eo9m0HBoj8czlU6uU13ngYgcbBzysY
         sBbQn9nhZuLqy8TtLPeK0McRw4gOmOD3zdKb9WIq3ahIICk6eJ6YPcO1n6DcogDqAHFn
         hx8yj4n98l3YnXZUT1nNZ4tnw4v3xZyhtL7djNvIQK5NANpx7U/3WSd57oapxQbY7Yoc
         oQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783722741; x=1784327541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEqvrzWdNs03NSYY4Llo7JEtAwRyuEAURCyKKRu8aMg=;
        b=nOSEhGfkVO+6RHM47GeuAoMopwkSQ00kLcwX1ERtSWORJ5a2WXVo8MSp52Fm53MKQZ
         7rD//XT7/su1C5QAgM43xVZxy/QEj7xWROA3jQ5HAsjc0H5Egw8Fv9ci82eGjnRoH5iS
         stDapFTDIUj7bcpAs4/HteTK/TKFXaaHraTsHLcazV+5ad9O/JpIYF2LClk766yRSOR9
         SfmNQDg+KWug2PSbqLQDAFzML6Yp2lSODDe3XlWSo/grQlstTo+eYd7BTkjidsF40VA/
         L5vCZqIw1yPP3YC6IvmLCs4f2p7T9UMjpUhl57aLMc0fiXhYJRZv7VdvEPLKEJYk1yfv
         ZLHw==
X-Gm-Message-State: AOJu0YyfNiFxEhfuL84GO0BUHxzH4kmDDQopMJM8GC3g00R9QJHuB9bL
	u6H8N99qvCv+e75fivhXxLqCB5OfWwAEljC/fS6FRiVGHuwrxfcwEWClr5bMO4LL+1Rre57qTzS
	uugJHN/o14vy3DOrKZOPWm0+lh4yatyj+aLdDnjUob4pZto+cryDr0e7epqQ=
X-Gm-Gg: AfdE7clIxF70NmV2vTcYOUbcHCCWMsLdgD+0AqVzeI24FuH99x8NxaCCiZde04MtN0R
	Xzv/F4wMyx4QyX91VULij4aSRrNPyW/7jJNf3Dk2/uMmP11ksPB1+1n3q9He2NLR6ZGQwLT3bnE
	F9kB6y06kxz4qkp5A0+5MMb7/Z2o3mpbSUWfCvnw2cXMWFRkm4fcylbEs6kejXg8zamNmDMy7Nd
	z187eEn850i7MBIrmpJ+mPprEKCerUa6UEwEU/tLW2dHUBU0tBGxpfoKZ5NKOKGwy8i7Dqh
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0bf with SMTP id
 adf61e73a8af0-3c110a50703mr921139637.74.1783722740175; Fri, 10 Jul 2026
 15:32:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260710212616.1351130-1-dmatlack@google.com> <20260710212616.1351130-4-dmatlack@google.com>
 <20260710213928.E7CE11F0155B@smtp.kernel.org>
In-Reply-To: <20260710213928.E7CE11F0155B@smtp.kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Fri, 10 Jul 2026 15:31:53 -0700
X-Gm-Features: AVVi8Cfjqrg4u4sl-DpUERrkw0gK2lYYXpeCMTm0VWzP26rFLxArTRQ3P79NdQ4
Message-ID: <CALzav=eL+nA2w7KzTXkn-_qm5couU9nANsEkqF+1qCA9NNV0Dw@mail.gmail.com>
Subject: Re: [PATCH v7 03/12] PCI: liveupdate: Track incoming preserved PCI devices
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 2:39=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] pci_liveupdate_finish_device() incorrectly aborts if refcount !=
=3D 1, completely breaking the preservation lifecycle for parent bridges an=
d leaking their FLB references.
> - [Medium] `pci_liveupdate_cleanup_device()` fails to clear `dev_ser->ref=
count`, leading to state contamination for subsequently hot-plugged devices=
.
> - [Medium] Memory allocated for incoming preserved PCI devices (the KHO b=
lock set) is leaked in `pci_flb_retrieve()` if `kzalloc_obj()` fails.
> --
>
> --- Patch [3]: [PATCH v7 03/12] PCI: liveupdate: Track incoming preserved=
 PCI devices ---
> commit 4fcd6c9f661309adcb1a2b891b9c5a34af9e319f
> Author: David Matlack <dmatlack@google.com>
>
> PCI: liveupdate: Track incoming preserved PCI devices
>
> This patch adds support to the PCI core for tracking preserved PCI device=
s
> across Live Update. It introduces pci_liveupdate_setup_device() to fetch
> serialized state from the Live Update Orchestrator and exposes APIs for
> drivers to notify the PCI core when preservation is finished.
>
> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > index 03075ce06ac98..df6a02240aa47 100644
> > --- a/drivers/pci/liveupdate.c
> > +++ b/drivers/pci/liveupdate.c
>
> [ ... ]
>
> > @@ -138,13 +172,58 @@ static void pci_flb_unpreserve(struct liveupdate_=
flb_op_args *args)
> >
> >  static int pci_flb_retrieve(struct liveupdate_flb_op_args *args)
> >  {
> > -     args->obj =3D phys_to_virt(args->data);
> > +     struct pci_ser *ser =3D phys_to_virt(args->data);
> > +     struct pci_flb_incoming *incoming;
> > +     struct pci_dev_ser *dev_ser;
> > +     struct kho_block_set_it it;
> > +     int ret =3D -ENOMEM;
> > +
> > +     incoming =3D kzalloc_obj(*incoming);
> > +     if (!incoming)
> > +             goto err_restore_free;
>
> [ ... ]
>
> > +err_block_set_destroy:
> > +     kho_block_set_destroy(&incoming->block_set);
> > +err_free_incoming:
> > +     xa_destroy(&incoming->xa);
> > +     kfree(incoming);
> > +err_restore_free:
> > +     kho_restore_free(ser);
> > +     return ret;
> >  }
>
> [Severity: Medium]
> If kzalloc_obj() fails, the code jumps to err_restore_free and calls
> kho_restore_free(ser).
>
> Because the underlying memory pages backing ser->devices (the KHO block s=
et)
> have not been restored or explicitly freed, does this error path permanen=
tly
> leak the memory reserved for the block set?

Yes. If retrieve fails, it permanently free the preserved memory and
then panic sin the caller (pci_liveupdate_flb_get_incoming()).

>
> [ ... ]
>
> > @@ -298,6 +377,87 @@ void pci_liveupdate_unpreserve(struct pci_dev *dev=
)
>
> [ ... ]
>
> > +void pci_liveupdate_setup_device(struct pci_dev *dev)
> > +{
>
> [ ... ]
>
> > +     dev_ser =3D xa_load(&incoming->xa, key);
> > +
> > +     /*
> > +      * This device was not preserved across Live Update, or it was pr=
eserved
> > +      * but has already been probed and gone through pci_liveupdate_fi=
nish(),
> > +      * e.g. due to removing and re-adding the device. Either way, it'=
s not
> > +      * treated as incoming-preserved.
> > +      */
> > +     if (!dev_ser || !dev_ser->refcount) {
> > +             pci_liveupdate_flb_put_incoming();
> > +             return;
> > +     }
>
> [ ... ]
>
> >  void pci_liveupdate_cleanup_device(struct pci_dev *dev)
> >  {
> >       /*
> > @@ -309,7 +469,83 @@ void pci_liveupdate_cleanup_device(struct pci_dev =
*dev)
> >        */
> >       if (READ_ONCE(dev->liveupdate.outgoing))
> >               pci_WARN(dev, 1, "Destroying outgoing-preserved device!\n=
");
> > +
> > +     if (READ_ONCE(dev->liveupdate.incoming)) {
> > +             pci_WARN(dev, 1, "Destroying incoming-preserved device!\n=
");
> > +             pci_liveupdate_flb_put_incoming();
> > +     }
> >  }
>
> [Severity: Medium]
> In pci_liveupdate_cleanup_device(), the FLB reference is dropped but
> dev_ser->refcount is left unmodified.
>
> If a preserved device is removed or destroyed before its driver calls
> pci_liveupdate_finish() (for instance, if probe fails), and a new device
> is subsequently hot-plugged at the same BDF, won't pci_liveupdate_setup_d=
evice()
> see the stale dev_ser with a non-zero refcount and incorrectly associate =
the
> new device with the stale preserved state?

Same thing can happen if the user hot-plugs a device during Live
Update before the new kernel enumerates that slot. The user should not
hot-plug devices they are preserving across Live Update.

Also, probe() failing does not cause the device to be removed. probe()
can still be retried.

The only way this would happen is if the initial setup of the device
fails, e.g. the kernel can't allocate memory during scanning. The
reason I opted to keep the refcount elevated is it at least gives the
user the possibility of trying another scan and recovering the device
if the issue was transient.

>
> > +static void pci_liveupdate_finish_device(struct pci_ser *ser, struct p=
ci_dev *dev)
> > +{
> > +     if (!dev->liveupdate.incoming) {
> > +             pci_warn(dev, "Cannot finish preserving an unpreserved de=
vice\n");
> > +             return;
> > +     }
> > +
> > +     if (dev->liveupdate.incoming->refcount !=3D 1) {
> > +             pci_WARN(dev, 1, "Preserved device has a corrupted refcou=
nt!\n");
> > +             return;
> > +     }
>
> [Severity: High]
> Is this strict refcount !=3D 1 check correct for PCI bridges?
>
> Looking at the outgoing path in pci_liveupdate_preserve_device_again(), a
> bridge legitimately has its refcount incremented for each preserved downs=
tream
> device, making it greater than 1.
>
> When the bridge driver calls pci_liveupdate_finish() on the incoming side=
,
> won't this check fail, abort the finish process, and permanently leak the
> FLB reference for the bridge?

No, the refcount can only be 0 or 1 in this patch. Bridge preservation
and pci_liveupdate_preserve_device_again() are not introduced until a
later patch in this series, and that patch updates this code to
decrement the refcount instead of checking for 1.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710212616.13=
51130-1-dmatlack@google.com?part=3D3
