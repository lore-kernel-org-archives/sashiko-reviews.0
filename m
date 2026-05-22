Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607C4255F2C
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 21:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779485712; cv=pass; b=jFEjNeE27CVg1pfG0qBJ0xCA1aL0Pb5w5tThs6t15UfZx4kC6AjDgzFWgdgzEightqV/pGtARGYf+yeO1Zxu3dICYgDIQUrEz5T4Fq3E8WeE24dtxXVXf5ORV9INnpATH4n5m6eu5bHCxgCoYjGcEQNVmCwvsl4R32AQqbkZMR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779485712; c=relaxed/simple;
	bh=IrCbpRqZ79TSnNZHPbrCyoMMlKKTtlqCPS9dngunr+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXQrwMIATuxKXMRRYXMfB0mSUcFEGgjZeQTUX8RxNmmwSkMk/LhQgsWnL3Rus+9CvldoZUcy7T8RjtncDAaW/QnjMZPSpwrmebczyUNqqoNJMt20yaTgX9jQtk8Ue5qgX1AJG20eVNR14MFQdOpfXiSf56RVkgV2BTjLRhOig2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C53iJKdL; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C53iJKdL"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-133466cf955so23207799c88.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 14:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779485709; cv=none;
        d=google.com; s=arc-20240605;
        b=lq5CN2el6iNvY8DQ54pgOFbq5DcFjNLw6JRKb3rILkoJUtOXltVUe5th8TJvbi84HW
         6mv0txVE5JIwP/jrRKA9Dz119pfjq0kw5+6Oxu2XVDdj85fLGhICJjho+EFZ+9lDzcA9
         XbDnCl7zyB2jM8OiF+DXS0W5e/o497q+ZJaTD7wijGQ578rIAZ6sciDy8dYyxsllbx+f
         lUUJ5MCIvy0lTuLS3Fd/RVakaFAcJzKmK/amfEkJAStlWAw24g8AjDKO+PAx5sO3J8Uf
         Z59ZJ0a2MJXW+1bwiBl/7nG9SefEly2qJwIsoPu9xt1odppvBVZzoybI4g5gKKNUfB4Y
         u6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8h6W9a2RrHRkCjSZUakkIOZj2QLkrMpaYUdZtjDG85o=;
        fh=91QGYt6IqY2tEFAID6ZWJ6dSC++M38hEZvyjjHwosNY=;
        b=X+RUAXOSJkqd2MJjMP0WZ428NYseJUORFsdSIz3rOeFE+YClESrDqF/9ho4Itaa2Dv
         iccAYaa9LDB9ASNN7tsyC/CXw55VTbCEvbZ/0pUWtFZmycIh3PPX6WR2aAoi9C34RwPb
         yikUU/BruV9U4x+wVd2gTRd30QVJAGt0BwM1GX6VneCgxoVZ4+l3tJLe/E+lhruZkwzg
         lGPKhbsjTUN0hsm1qLrYrpGjzf6YatES7DnhgWjZrZpZsc+qdljjNJ/KnLXPBQ37I0k3
         LeVFwZojbZqbsOKWXt091Q7SHHlndfD4Zr4yHW4xIZATMdBwnAsFjkeYnlQuTi4kjQ79
         bU9w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779485709; x=1780090509; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8h6W9a2RrHRkCjSZUakkIOZj2QLkrMpaYUdZtjDG85o=;
        b=C53iJKdLCBxpc3FPW7FlgDysFE5Ay7pgRYPHWN+/eXCBRu9AGfjzxX40u+Y1XkvsAE
         MEsi0NTKAxrhJjOGxjvTHh/a9rzi5Voy6Le2EBF/wND3ok5mCmeDAocZfg3eBLifqKYW
         Ij6VilkVVuvL3YGcPSgdIBVo/2m+Z15qQnxbbmwHDlmwjwxknr045VgGjX0nNqirKj+8
         aUlFmipRk7L7e0DhtRYTGLZLYHH97KDNaWqFJwwiYcC+2rN6kt9AKB+mXyQUdaCSVzHI
         52/cWs4QGzAVJ3qfxxCE79IMMLzJfSbU8iYP58Q4jmbBd8BaaS5RSRl/I/6nA53Ad/YM
         wuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779485709; x=1780090509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8h6W9a2RrHRkCjSZUakkIOZj2QLkrMpaYUdZtjDG85o=;
        b=DBq6WlIAqf2f3Q/h3Cb7a7R8LwIC6qTKl8G7qwzJe7AxKfLMpr5wGCajEMdMCFG3dM
         zSJoALNvspLf4hmz+hsPXPE7gO26KuGbBLTDdzRUlWh5+CgZ/ZTnpI5CCra9aX0hTq0/
         VwvMRjpl92t7+hpXCQwfqD4/gErqXOTswNcV4pm57Y9xMv3bOsHiPCapIbi6ZUR5d03z
         zhp0icGgI19xPu1rp3JA8eDs4Ml0qkpps+eoakGrIU+b9vtNdJlt1eo8uEUQ6Wmz5o0N
         z9n2MPpWbFK/PHbDSmlCjBICTMFL/coIiBdbyqDAVTcrW6JUyGKsV45EhonOEr8tVAoV
         w1cQ==
X-Gm-Message-State: AOJu0YwzI5NRm2fEGVlsWfKYtb8MyDieG/kF3oBRoNX2hOaUxfPunUgS
	MczBHmLKUyTyFSkLmsMQnKYA0Llq9iUF7+IuFdjXu/HlNx33rpV8XvGWug22gDD9D4gVCK5H+AQ
	E3RSDZhZwgcTgpKNOgyXj220JiadZxuB+gjwjnV71uyembewdvZQk9w==
X-Gm-Gg: Acq92OHOTuKeb3MrpI4kd+5jnlh2J6Icl3xy8tpnL2PiklK2TUM27BTRJ7amtCH1S1s
	dBHGJT2ZLito7xIJzh/st7a4AZbbpdTSBTZAj08vk95J5xxL2KliwIjYl3YX9yano4bnyeCk0dz
	loP4NksCRHam3FBcKxop4Xd3AAvjPqwqfdBmR2NJlOqQOB3E0+nVUn9nWvfdA+i6TkqxmwxJHu9
	gS6GpbS3kZXmNI7xrCrS8JfbDmjWEeX8KwkMSnrimz10kiWDgxIPPxM07q+DmeBx+B8eABWJI6+
	uapdrJt4jDgBf9K8tw==
X-Received: by 2002:a05:7022:100a:b0:135:fdeb:4776 with SMTP id
 a92af1059eb24-1365fc779e3mr1949222c88.34.1779485708931; Fri, 22 May 2026
 14:35:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522202410.3104264-4-dmatlack@google.com> <20260522211333.D56A21F000E9@smtp.kernel.org>
In-Reply-To: <20260522211333.D56A21F000E9@smtp.kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Fri, 22 May 2026 14:34:42 -0700
X-Gm-Features: AVHnY4JpuIbwi96KtUWFH2D1iE7-iC6vCxFKsYXwS1gOK1ets8Nv2GgQxQFJCJM
Message-ID: <CALzav=cYxfUDBbWf=a3GM15f=2HZF8CJ7Ax5G2vg1VjrnC7w-w@mail.gmail.com>
Subject: Re: [PATCH v6 03/12] PCI: liveupdate: Track incoming preserved PCI devices
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, Pratyush Yadav <prty@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 2:13=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] pci_flb_retrieve() frees the incoming preserved memory (ser)=
 on failure, causing a Use-After-Free when the core retries.
> - [Medium] Leaked reference to the incoming FLB when a device's preserved=
 refcount is corrupted.
> --
>
> commit 5af02c95c00f317cc5c4fa203b8b79373f2759a5
> Author: David Matlack <dmatlack@google.com>
>
> PCI: liveupdate: Track incoming preserved PCI devices
>
> During PCI enumeration, the PCI core fetches serialized state from the
> Live Update Orchestrator to identify incoming preserved devices. This
> patch adds tracking and lifecycle management APIs for these devices.
>
> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > index 065d5af822f74..96c43b84532cc 100644
> > --- a/drivers/pci/liveupdate.c
> > +++ b/drivers/pci/liveupdate.c
> [ ... ]
> > @@ -128,13 +157,49 @@ static void pci_flb_unpreserve(struct liveupdate_=
flb_op_args *args)
> >
> >  static int pci_flb_retrieve(struct liveupdate_flb_op_args *args)
> >  {
> > -     args->obj =3D phys_to_virt(args->data);
> > +     struct pci_ser *ser =3D phys_to_virt(args->data);
> > +     struct pci_flb_incoming *incoming;
> > +     int ret =3D -ENOMEM;
> > +     u32 i;
> > +
> > +     incoming =3D kmalloc_obj(*incoming);
> > +     if (!incoming)
> > +             goto err_restore_free;
> > +
> > +     incoming->ser =3D ser;
> > +     xa_init(&incoming->xa);
> > +
> > +     for (i =3D 0; i < incoming->ser->max_nr_devices; i++) {
> > +             struct pci_dev_ser *dev_ser =3D &incoming->ser->devices[i=
];
> > +             unsigned long key;
> > +
> > +             if (!dev_ser->refcount)
> > +                     continue;
> > +
> > +             key =3D pci_ser_xa_key(dev_ser->domain, dev_ser->bdf);
> > +             ret =3D xa_insert(&incoming->xa, key, dev_ser, GFP_KERNEL=
);
> > +             if (ret)
> > +                     goto err_xa_destroy;
> > +     }
> > +
> > +     args->obj =3D incoming;
> >       return 0;
> > +
> > +err_xa_destroy:
> > +     xa_destroy(&incoming->xa);
> > +     kfree(incoming);
> > +err_restore_free:
> > +     kho_restore_free(ser);
>
> [Severity: Critical]
> Does this error path create a use-after-free if the retrieval is retried?
>
> If pci_flb_retrieve() fails here (e.g. from -ENOMEM), kho_restore_free()
> frees the preserved physical memory for the incoming state. However, the
> Live Update Orchestrator propagates this error without marking the FLB
> as retrieved or finished.
>
> When the next PCI device is enumerated, pci_liveupdate_setup_device()
> calls pci_liveupdate_flb_get_incoming() again, which invokes
> pci_flb_retrieve() a second time with the exact same data address. The
> function will then attempt to read incoming->ser->max_nr_devices from
> memory that was already freed.

Yes but that is a bug in LUO. It should not be attempting FLB
retrieve() multiple times.

(Pasha and Pratyush FYI)

>
> > +     return ret;
> >  }
> [ ... ]
> > @@ -280,7 +430,83 @@ void pci_liveupdate_cleanup_device(struct pci_dev =
*dev)
> >               pci_WARN(dev, 1, "Destroying outgoing-preserved device!\n=
");
> >               pci_liveupdate_unpreserve(dev);
> >       }
> > +
> > +     if (READ_ONCE(dev->liveupdate.incoming)) {
> > +             pci_WARN(dev, 1, "Destroying incoming-preserved device!\n=
");
> > +             pci_liveupdate_finish(dev);
> > +     }
> > +}
> > +
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
>
> [Severity: Medium]
> Can this early return leak a reference to the incoming FLB?
>
> In pci_liveupdate_setup_device(), a reference is held to protect
> dev->liveupdate.incoming. This reference is expected to be released via
> pci_liveupdate_flb_put_incoming() at the end of this function.
>
> By returning early here when the refcount is corrupted, we skip the put
> call, leaking the reference. Furthermore, dev->liveupdate.incoming is lef=
t
> non-NULL, which means pci_liveupdate_cleanup_device() might later try to
> finish it again and hit this same leak. Should this error path drop the
> reference and clear the incoming pointer?

Yes but dropping a reference to the incoming FLB when the refcount is
corrupted could lead to use-after-free. Logging a warning and leaking
FLB seems like the safer approach, aside from panicking.
