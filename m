Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A7A40A953
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 23:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785281896; cv=pass; b=fVTP7m1C+7S/Jt5tTjeoAKLQddn44MnvNXIeeWL9Z2q31wukn+8dqI6MLAKigx0zIW7Sa4caR0JDvElFdzMqwbxIr93dLMyNtriqxQH2uI8EUFx28J6jrkR8EYDDI79e2eXs8BfVbuSGSpcY2wpxsZ4ADwmBW35ibblfLbzPkMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785281896; c=relaxed/simple;
	bh=Y/7lDHTHiylr1QgLDeg6pOBDgQs1p/N3mwc5S+PKAyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fb/JfFKkM+Rdvpu6a3AZH8kuYEAgo6RoAnDXBSo+X5/3CMzGTsUnEpWVGj8US5qqPdegkAZ2sK/UMTDuEC16DSTIdFIY+VtCxqvUMQkL5mbpQlTDAoWcaSH6ybpRTbd/xwZ+u4oN7FF82mEIpVxLbn3q+tkI07Tv+4i1Z6P+Plc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tzTo9XAp; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tzTo9XAp"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-848643382fcso412079b3a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 16:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785281881; cv=none;
        d=google.com; s=arc-20260327;
        b=sw22sK9FxkFPlJFz/XHDMUNJv1hSOizcX1/ihQ6GiaU/sYrP0yyFTTS9AEzokYwuwb
         kGPwOyk/pBCRFtDIS+tllx0edh4sNLBovhvJLPW2KOV6nmpMKvTXpU/426MYIb1GFrg+
         7PGZmd82aiVfFeaG3Sg/vsgvjHHC2c6Paj5JTphqsSJA5FdGLYezf3+BNPbb+sr2p2LF
         F+FigjJLFJ9v9Cy1Tm2XU2fMj3y6eYGftamBjDheduMx8gw8DnhC2GmBthUaAfy7tiAl
         O9lhFEYkzO9V7XBAx9Rs6DYPwrJl6wLILkeugsnJUPvGL/BNZDoqVZQI59eB51wS1zCP
         WMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PnypmSI+s/fXBsLmEE0Vb445cRMkPE/zdF74oKMtcHQ=;
        fh=2E8G5L5HRIhYv0SLHRh0bmuG4bK/RxhrEd6+zC1U6gY=;
        b=ZI9UGjp3utQCxCmcodZECnoFiDPFiLAv1rR9Ie2JjUeSCLTAulWO/3jVQRiBu14O8d
         MT1DgnGxmpw+JD2XIxWLJsi2eFPg+jFbpMdqXbMkCeiPuiv/pfUFSysfo39XyUohABRn
         6vQ4GmHrzs127fmePUFXz9KGVsNOP7Re5X+faI7njzi8d6QPclTACSBufVUlWr5zX6OD
         yjCRRPxwaDoo7tQJ4pB/UpAHayQ8pRBuMY95RnMznAfMUqaimVhvuS4IfcK2KnExId2b
         jcwbuw2Z4T+DlAODs7nTBxP5yxYWkW2/R5yBnqV0+ZYa/yu27rrgfgrdYzJO4ZLXYP7d
         4wRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785281881; x=1785886681; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PnypmSI+s/fXBsLmEE0Vb445cRMkPE/zdF74oKMtcHQ=;
        b=tzTo9XAp2//yW+qRhApJMY2VbSjRYcS63/NOI9gyJUEHIfVoQCNCdfJoCWY0iMq/2h
         6kbXdso3ArosCQ6pqiK0CbpMCYixPXWzaM/F+vep1sd0cK+uuEsDuJwbdcy8iwYBq/C7
         pPFuVd5lkb1/dtbQB/8+lC3h8P1gJPiSYxp6KREM8qRSZXEsL48K/oG+QmuzdRB7WsKV
         CuqLSsUuqu+m715skiInUqwLI0GzudtYd5+ZCQmBoZxwoXq0f+Aaj8MtikYr9iEkwi8d
         3PXBwsnav2tMJhveJF5nPqwJIYsrZXiK4lKfSPcvjxma1yWla1EoiI1qDmvdP45Amkg5
         /ZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785281881; x=1785886681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PnypmSI+s/fXBsLmEE0Vb445cRMkPE/zdF74oKMtcHQ=;
        b=OgMLXRbC76ipuuifjnPt0dkzb5kfwObCPga+ReuDeBwZi/0/Ph3DFD91SB9bMWQHSY
         9sTYPdBU7T0pztbwzoJ3YkinB/HBF+pti+gKL40HvsE9h7Dei8NxgcD4mt+2cp3z2m+0
         Lh6Wf2HhKsUyFxm2KVWMP+3uKEtPU/FRnM6/BgvXEFa4TRbjtNRJaoDKA3AbUvzfiD+8
         ozVMOQ6kguWmUS5gVnt9Os5AYFLHpOehqWBOY7vim5+i175bag82ccz4imCbd5j5y0mI
         DBmsgsJ6cGtK7AN0IopaoPVzeU8qyIFNqTa2ZNt95Mcf5ruTEfCuUQOlkdCp1TRSSouU
         xF7A==
X-Gm-Message-State: AOJu0YwEUltag9o8xA1y95YNzTHNcTytriyKfaGYGVHZ60sqwukVpuUh
	aPz/zElS2AgvLPn1CMZIsSvZOw5ANinc58TU6p1bwPeIwRREU39/5eZb97dqolVK6XSNTGjqjos
	m45MtI6dQ86UM5MDuCsVFsRUOzpsDVebJ8fJ1vMEloxNS3hsvX4lQ8GAi
X-Gm-Gg: AR+sD13NcqcchE2qUBwZjCxkTz3M48xYZg45RINf1XSqTIIL9f6sH/i4gsGsiN06qIc
	yoxkjIe+AKJLWQShSro0PzFLX3MDUEStkIAQCveKs2wkuGAJVBPrLfLAWHB14dQH7gXEzt1Uk4s
	sbPpzSW/Z3US46YAVZnC+JXPqpgteHqOeuxgPeeD45V1Sc47bh1vnHKVik5tW80pS3v6rluQzzD
	LqGdJeu6yE9RxLnyUaz/dsbNyBNIcF3vUPshRfPD+dZ7hbaNhOt6TcmzvkXnAOiopvv/mleScDj
	gUGlnJTug+Pb44UkpDZw5KmNgBbtDsvZ0kXLy2Ty36r8
X-Received: by 2002:a05:6a20:7d9f:b0:3c3:719d:dfe2 with SMTP id
 adf61e73a8af0-3c8ba5b7fd8mr5420726637.36.1785281880740; Tue, 28 Jul 2026
 16:38:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728221007.2098560-1-dmatlack@google.com> <20260728221007.2098560-4-dmatlack@google.com>
 <20260728222257.56AD41F000E9@smtp.kernel.org>
In-Reply-To: <20260728222257.56AD41F000E9@smtp.kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Tue, 28 Jul 2026 16:37:33 -0700
X-Gm-Features: AUfX_mwUmZPQSsI1M3rguBFdOcHxxC_9pcGjpiPxQwiLxWBxcM9tgJpez83n9Xw
Message-ID: <CALzav=et-+vV2ewWuB0MKV+JCoLdWr+=W8K7Tf-AX0kj_TkZnQ@mail.gmail.com>
Subject: Re: [PATCH v8 03/12] PCI: liveupdate: Track incoming preserved PCI devices
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 3:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Unconditional kernel panic in the incoming FLB finish path if a =
preserved PCI device is missing or fails setup.
> - [High] `pci_flb_unpreserve()` destroys outgoing FLB memory without clea=
ring device pointers, leading to a Use-After-Free.
> - [High] Transient errors or version mismatches during FLB retrieval caus=
e an immediate kernel panic on device setup.
> - [Medium] Leaking preserved KHO memory for `ser->devices` on early error=
 paths in `pci_flb_retrieve()`.
> --
>
> --- Patch [3]: [PATCH v8 03/12] PCI: liveupdate: Track incoming preserved=
 PCI devices ---
> commit 8fdc703d6dd44076cd03589af0bcffa13c79e7f4
> Author: David Matlack <dmatlack@google.com>
>
> PCI: liveupdate: Track incoming preserved PCI devices
>
> This patch allows the PCI core to track incoming preserved PCI devices
> during enumeration. It fetches the serialized state from the Live Update
> Orchestrator and exposes APIs for drivers to handle incoming devices.
>
> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > index b003b7069cdb0..5ce5f8b369029 100644
> > --- a/drivers/pci/liveupdate.c
> > +++ b/drivers/pci/liveupdate.c
> [ ... ]
> > @@ -140,15 +174,91 @@ static int pci_flb_retrieve(struct liveupdate_flb=
_op_args *args)
> >  {
> > +     struct pci_ser *ser =3D phys_to_virt(args->data);
> > +     struct pci_flb_incoming *incoming;
> > +     struct pci_dev_ser *dev_ser;
> > +     struct kho_block_set_it it;
> > +     int ret;
> >
> >       pr_debug("Retrieving struct pci_ser (0x%llx)\n", args->data);
> > -     args->obj =3D phys_to_virt(args->data);
> > +
> > +     if (ser->version !=3D PCI_LUO_FLB_VERSION) {
> > +             pr_err("Incoming PCI FLB version (v%d) is incompatible wi=
th this kernel (v%d)\n",
> > +                    ser->version, PCI_LUO_FLB_VERSION);
> > +             ret =3D -EINVAL;
> > +             goto err_restore_free;
> > +     }
> > +
> > +     incoming =3D kzalloc_obj(*incoming);
> > +     if (!incoming) {
> > +             ret =3D -ENOMEM;
> > +             goto err_restore_free;
> > +     }
> [ ... ]
> > +err_restore_free:
> > +     kho_restore_free(ser);
> > +     return ret;
> > +}
>
> [Severity: Medium]
> Does this error path leak the KHO memory for ser->devices?
>
> When jumping to err_restore_free (e.g. due to a version mismatch or kzall=
oc
> failure), kho_restore_free(ser) is called, but it doesn't appear to resto=
re
> or free the memory pointed to by ser->devices.
>
> Since KHO pages are reserved across kexec, will this permanently leak the
> memory for the uptime of the successor kernel?

Yes, but PCI FLB retrieve errors are fatal (panic).

>
> [ ... ]
> > +static void pci_check_all_devices_finished(struct pci_flb_incoming *in=
coming)
> > +{
> > +     struct pci_dev *dev =3D NULL;
> > +
> > +     if (READ_ONCE(incoming->ser->nr_devices) =3D=3D 0)
> > +             return;
> > +
> > +     for_each_pci_dev(dev) {
> > +             if (READ_ONCE(dev->liveupdate.incoming))
> > +                     pci_emerg(dev, "Preserved device was never finish=
ed!\n");
> > +     }
> > +
> > +     /*
> > +      * This should only happen if a driver violated the contract to c=
all
> > +      * pci_liveupdate_finish() (something is extremely broken).
> > +      */
> > +     panic("Some preserved devices were never finished!\n");
> > +}
>
> [Severity: High]
> Is an unconditional panic here safe if a preserved device is missing or
> fails to probe?
>
> If a PCI device that was preserved by the previous kernel fails to probe =
in
> the new kernel (e.g. the driver module is missing, or it encounters a
> transient error), pci_liveupdate_finish() will never be called and
> incoming->ser->nr_devices will not be decremented.
>
> When the Live Update orchestrator concludes the update and calls
> pci_flb_finish(), pci_check_all_devices_finished() is invoked and sees
> that nr_devices is still > 0. Does this mean normal system conditions lik=
e
> a missing driver will trigger a kernel panic?

The file associated with a device that fails to be enumerated or
probed cannever be retrieved by userspace, and therefore never go
through its finish() callback. So LUO will never call
pci_flb_finish(). This panic will only happen if there is a serious
bug in the driver or LUO.

>
> [ ... ]
> > @@ -325,6 +435,75 @@ void pci_liveupdate_unpreserve(struct pci_dev *dev=
)
> >  }
> >  EXPORT_SYMBOL_GPL(pci_liveupdate_unpreserve);
> >
> > +static struct pci_flb_incoming *pci_liveupdate_flb_get_incoming(void)
> > +{
> > +     struct pci_flb_incoming *incoming =3D NULL;
> > +     int ret;
> [ ... ]
> > +     /*
> > +      * There is incoming FLB data that matches pci_liveupdate_flb.com=
patible
> > +      * but retrieve failed (pci_flb_retrieve() returned an error or L=
UO
> > +      * failed to acquire a reference to pci_liveupdate_flb_ops.owner)=
.
> > +      */
> > +     if (ret)
> > +             panic("Failed to retrieve incoming FLB data (%d)\n", ret)=
;
> > +
> > +     return incoming;
> > +}
>
> [Severity: High]
> Does this panic prevent the new kernel from booting if there's a simple
> FLB version mismatch?
>
> During PCI enumeration in the new kernel, pci_setup_device() calls
> pci_liveupdate_setup_device(), which invokes
> pci_liveupdate_flb_get_incoming().
>
> If pci_flb_retrieve() encounters an error like a version mismatch (-EINVA=
L)
> or an allocation failure (-ENOMEM), it returns that error code. This bran=
ch
> then catches the error and unconditionally panics. Will this reliably cra=
sh
> the new kernel during early boot and break the kexec handover fallback
> mechanism?

Yes all FLB retrieve errors are considered fatal. A version mismatch
is considered a retrieve error because it means the current kernel
can't understand the data passed by the previous kernel.

We do want more graceful versioning support to handle
upgrade/downgrade scenarios, but that requires deeper design work in
LUO before the PCI core can use it. We aren't going to build a
PCI-specific versioning solution.

>
> [ ... ]
>
> I also have a question about the unpreserve path in pci_flb_unpreserve()
> which might lead to a regression:
>
> drivers/pci/liveupdate.c:pci_flb_unpreserve() {
>     ...
>     WARN_ON(outgoing->ser->nr_devices);
>     kho_block_set_destroy(&outgoing->block_set);
>     kho_unpreserve_free(outgoing->ser);
>     kfree(outgoing);
> }
>
> [Severity: High]
> Does pci_flb_unpreserve() destroy outgoing FLB memory without clearing th=
e
> device pointers?
>
> If a driver fails to unpreserve its devices before the orchestrator abort=
s a
> Live Update, pci_flb_unpreserve() will issue a WARN_ON but proceed to
> destroy the block set and free the outgoing FLB object.
>
> The dev->liveupdate.outgoing pointers on the pci_dev structs are left
> dangling. If a new Live Update is subsequently initiated and the driver
> attempts to preserve the device again, pci_liveupdate_preserve_device()
> will access dev->liveupdate.outgoing->refcount via the dangling pointer:
>
> drivers/pci/liveupdate.c:pci_liveupdate_preserve_device() {
>     ...
>     if (dev->liveupdate.outgoing) {
>         if (!dev->liveupdate.outgoing->refcount) {
>     ...
> }
>
> Can this lead to a use-after-free of the KHO block set memory?

Yes. We can handle that the same way as dangling incoming pointers and
panic. This will only happen if the driver or LUO are very broken.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728221007.20=
98560-1-dmatlack@google.com?part=3D3
