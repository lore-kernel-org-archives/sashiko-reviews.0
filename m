Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F90383C76
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 21:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779485354; cv=pass; b=aoSXyrMQksvhqEfa5UWzoYWQUJfHzczfLIAsALZ7yl+IhCPPvu8ub2MNDL4u/eGTzGOigJH9wIS0WIrIouEOQqxR3Vwom0/Bgrjigo/mzu902ssSSwyc509G4aGWDuS8Fc13a43umNSSN+Uo790AZSlEaF90Jkcn1PWcQctAHk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779485354; c=relaxed/simple;
	bh=GI3ksNffcgu0gYhPpqaOoDcdU1m2F3Yiyb09sVMjOvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0nMDYq8YbzPzXAkfXtfdn+aImnuJa0nZGKFIbEfiwgVxamSWWpHGyTTGpX1hF50gyT4z5AB8PIePQ4wfgDHNB1qBIAmyIqJm6VdPqfLLwqNcvZgrOJUgCmLP7U8vaUB3rRqSczhhYSnvcLbbp2epbgoNkvSE9VhVO5O0WJBwD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=grbTWdBU; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="grbTWdBU"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1357c851a48so9930144c88.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 14:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779485352; cv=none;
        d=google.com; s=arc-20240605;
        b=Q1viu7GucdrjMIkT3JQwI64l3fmxN5A7CpX3+BV3wh7lsL/JKC/U0+2lSuS9jF4te2
         1TMBhJZFqdL77PJqKnjdMLWC4qlWBxiFbdwj1fuPhhpqn0Fi07Ykl/xDrg9yyzLrp3GC
         73iNJFNu1qGuHUowtjqNjsAXtIpcfjlJLvWzrHznbXvC4tWeocqe9awDa1/ZDZYkLsl0
         jqFIpCinK9B75ivteSnUNB9PUfT4o9Nbl1E1QY6VEr87u5yj+DG87rjEHPQdApNOdlFg
         YgmV+8K8Vt+APkzj2GmFN7G7qbZ3a21BSRBv2Gf/l/OYlBwSR4jppJ71fbFO1oWlWtZQ
         vdUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6K2ANhvmgyd4o7NGx/ivPgd7PtVVhTtattoThaE0WQc=;
        fh=2E8G5L5HRIhYv0SLHRh0bmuG4bK/RxhrEd6+zC1U6gY=;
        b=KFi2j0gHSGAvJ9lEems73CiB1zw7mGaE8wOy3NKRxY4IXjhZHVmcVZgn1yWm99sbKg
         XOWC/RydWPlB0oIe25LkEZoaOOJPVM/nm04PhAOhOc6oIMWumc5vRrYCG54c738oncr/
         cs0ByhJXr/6zAURL61LbVUI2SVWFel8lYbZM4HrEuwTYkbjGRM7/lVHQP/MXQ7jDOHo4
         ORuMm2hqulNWSfbNoVpLCErYFoDmgxlGS6ueihLY2VRgFzkSj0J5LyjM/DXHwTdHQyz2
         9pEcSGE8EcAGRyp4e1nyauy93qs0j2bcoGgLNGOdJDIotWgU+SMNEk7n34gjkw9MRqxE
         0tCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779485352; x=1780090152; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6K2ANhvmgyd4o7NGx/ivPgd7PtVVhTtattoThaE0WQc=;
        b=grbTWdBUDZuUwF0puKT4YbSZai9SIaZwgYYgGgpo+UWlg8YNIxpEDg+cEVNB336yJs
         WzH3DH/hwXwm00GPKtZSCd1vJe2GS304KlMr2Ob1SERRyyuFDj1MYUZl2sCFAWwZx3kW
         6yyJ/WmiC3uNrmuoURP1ibqbPGBxv+dLRMFQCK9P+WhN9R7SDuQuE6zLyEeoyyNpRJxh
         o4dtBv6N3/YlxJqr7C4DRSUhd/dzJ43Gfst+2HSZ+yIZA3HKlzqh8x1TRGT7LMgF7/ww
         BFOAGQfJycGHNLlzgFzC939qW4PF6wp3EzjWa0/czWkFxIsLfTxxVdESAIZ1h0pQdEPF
         wo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779485352; x=1780090152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6K2ANhvmgyd4o7NGx/ivPgd7PtVVhTtattoThaE0WQc=;
        b=PgXyKeE8zFz4XK27Y/xT58sdsJ1IN5It7QZ9rE0i98YRAtXtRC6g0OEuCthAS+TFTz
         ZcyajV5Jpy95iNGGlkqzXRmQxLnDfyzHXD443BARApoStLdfHYmGW4VvsxNIJNxJfsKw
         cY5XOsVxVOMYEK4dMPaIQFAQNDx+hKkr4YfCD3cjYMs7ssAsH3P9ByZ9fycri2NaROUO
         oL0lKJ4L3kMgU7b7E5dZv8892/g2uoKG+4W2rYT2DVgCUT5T96Mei+F8jSS+Z92Gax54
         MMAiZBGy68Dbi+Yk6m988v60zmbT8UjuKoLZZCwYOuzivVvcowVdcdsvjj7TYHBHyCfL
         8m7w==
X-Gm-Message-State: AOJu0Yy2D0l+dD9ylqXMHOMCwpHpSsF5dWOYeNUYfbNS+/bWlfa0rozS
	/WuuuMdYDCrqElWAn0UREzCM3wg9Fg3Zd5dLb/7ZKXJ08WsuxOk2Vjt+7tCLOFyQ0MdLBlQxbXp
	a9skAMGo6hUaNl0db+cZxu4VDTXiDV6LaEwt0K5UW9+hi3KLxS3tP9jxs
X-Gm-Gg: Acq92OGcPF3grmxnCNK8FTeii7Cl+5ENaCoonxaeC/HrhQH0lCNhThQPVbos3P0DvM7
	GoOfe62SECk0mYPaarkT2ggt6UgsyE2cuci6d2r3fd+hsfb5SchWQgYmy7TtO40kej5T5L9iNWf
	l+xI1gzgWIYA7ove8bezFkDc0GuidRfS47cW2t1zenYxXuZOXGXdcueVzis6C7js+FN48uQVWus
	0bmL0w+p4ttNVdYvbWR337a/KbrJjIwpLsS9FxC3x7VizdEM7z5Nu4GjW1Pwy1ZCBaEF1/IMC7O
	vc2kLkJr89LzTUB77w==
X-Received: by 2002:a05:701b:2905:b0:12d:ce60:cb52 with SMTP id
 a92af1059eb24-1365f81b447mr1254036c88.18.1779485351351; Fri, 22 May 2026
 14:29:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522202410.3104264-3-dmatlack@google.com> <20260522205453.F34021F000E9@smtp.kernel.org>
In-Reply-To: <20260522205453.F34021F000E9@smtp.kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Fri, 22 May 2026 14:28:44 -0700
X-Gm-Features: AVHnY4KamDj--aV3AykLsYOKZZoEGo-UbptTXXYbt8naapMG4RPx0patVsAYs7U
Message-ID: <CALzav=fgi_ezr7JV3to=RM-RC7sF_XsEcash_+vp65J-jXnkWQ@mail.gmail.com>
Subject: Re: [PATCH v6 02/12] PCI: liveupdate: Track outgoing preserved PCI devices
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 1:54=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Acquiring a sleepable rw_semaphore (rwsem_write) during PCI devi=
ce release, which can occur in atomic contexts.
> --

> > +void pci_liveupdate_cleanup_device(struct pci_dev *dev)
> > +{
> > +     /*
> > +      * It should be safe to READ_ONCE() outside of the rwsem during c=
leanup
> > +      * since there should no longer be any references to @dev on the =
system.
> > +      */
> > +     if (READ_ONCE(dev->liveupdate.outgoing)) {
> > +             pci_WARN(dev, 1, "Destroying outgoing-preserved device!\n=
");
> > +             pci_liveupdate_unpreserve(dev);
>
> [Severity: High]
> Can calling pci_liveupdate_unpreserve() here cause a sleep-in-atomic bug?
>
> pci_liveupdate_unpreserve() unconditionally acquires a sleepable rw_semap=
hore:
> guard(rwsem_write)(&pci_liveupdate.rwsem).
>
> Since pci_liveupdate_cleanup_device() is called from pci_release_dev(), t=
his
> runs when the last reference to a struct pci_dev is dropped via pci_dev_p=
ut().
>
> Because pci_dev_put() can be called from atomic contexts (such as hardwar=
e
> interrupt handlers or while holding spinlocks) to drop references acquire=
d
> during lookups, acquiring a sleepable lock here could trigger a
> scheduling-while-atomic BUG or deadlock.

> > @@ -2490,6 +2491,7 @@ static void pci_release_dev(struct device *dev)
> >
> >       pci_dev =3D to_pci_dev(dev);
> >       pci_release_capabilities(pci_dev);
> > +     pci_liveupdate_cleanup_device(pci_dev);
> >       pci_release_of_node(pci_dev);
> >       pcibios_release_device(pci_dev);
> >       pci_bus_put(pci_dev->bus);

Gemini found 3 files where pci_dev_put() is called under a spinlock:

 - drivers/net/ethernet/microsoft/mana/gdma_main.c (mana_driver_exit())
 - arch/x86/pci/i386.c (pcibios_fw_addr_list_del())
 - arch/powerpc/platforms/pasemi/dma_lib.c (pasemi_dma_init())

OTOH, pci_release_dev() does not seem atomic-safe. On s390, it can
take the zpci_add_remove_lock mutex via pcibios_release_device(). And
on all architectures it can call kernfs_remove() via pci_bus_put(),
which takes multiple semaphores.
