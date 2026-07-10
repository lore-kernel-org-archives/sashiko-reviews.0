Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F88226738C
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 22:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721267; cv=pass; b=DjW/lvUTyx8Ih2nHdTUnhiU6ecgDBgGsPwusVqNU75qDgB4ULPPBZ5jWYB+hSfpV9UzITzNuQPJ1OdqoQMOHV8kQGMXMjv06i8zD9MaNe7KbagNiilrkaU6xYcgN2ZZj9cH4BJAGErhruXSPTAJ3m0qlhq1x9GVaCd16smH9TZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721267; c=relaxed/simple;
	bh=Vff3kRK5AiWmdmzWNqNi86ldeIRObG3k21H9VsN8aes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+2bmv4YEmlxCcsX5K9gjzNbIcGV5yy8PsmiMCUrQTHeuLszpK0UH/IpwLSKybZYgpFNzlCRw+cUnf2milktjj1fCJBRXumtQJJvToHasXW1iYFGGGTLGk5snhssjMyco7UL30hm3TtUgnpdBiXqkzQcIc3V5RfayXVjSEvU0oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hI/xB3nv; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hI/xB3nv"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso789383a12.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 15:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783721265; cv=none;
        d=google.com; s=arc-20260327;
        b=HnOmLpqKIzKuV1oWD1YD5ZQB96iTiRp0QUXTcXma8+e44Yja14kpa+YNGvl5DvDEFv
         reBd1WDfY54zcZw4ItGn42rZJUwUvj8apVmcijFN85fSel5qzJPJUEcjBtjeEFUtvxw7
         okRX6rBB6CPNPXwLFPpYfTNins+W25glqjfCM9ZyPEPtz0wMmJli2uilmlucHwib0TEO
         lshdTZbP/SYR2zFbW14cWVoarjH7XuSOwQI4+idqqYSFvsf9HOok3sk3wOyVtdda6bG+
         4hG35Ok5tW/Oww3Th2fg90kJT9xL9V/twNOC1C80pCvoJjcgxQbZL3PfwX5R0OFT5TDK
         bA0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uCi4vdatGlMYBO57z4Q+nFs0o+7WfmBZSwOdUxt/AOM=;
        fh=2E8G5L5HRIhYv0SLHRh0bmuG4bK/RxhrEd6+zC1U6gY=;
        b=p1uSSr1i97gcPsSmiWh50mvNurcGkNVS8o+5zfOzEQBQdrNvEdGrSqlomG2m4q4vBe
         HTfIlfKrCwIrSmy17q04PZ7BZYhfuqiWzyVY7Uh9O6LXAFcYz8XrgiWRvmPCVsQNNCvp
         qQMaYEygWZ1z2JnJCtsFsz0EV8EBys3RLtygnmMG01ldDPhyxuS/vAc6gGSG7TKFl82X
         n4geFIHO6CPrKa5iYh4ZbMLbCB/L+t+cFksmPCj5EdcolJXtqfKAuLHBERA3mOL35ICJ
         s9ey2T/I6plC3OQnwMIIWspNjaMa5lesJjSocJCKSkZL17lyewVgp8aHdp5DGQWYbjfE
         r10w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783721265; x=1784326065; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uCi4vdatGlMYBO57z4Q+nFs0o+7WfmBZSwOdUxt/AOM=;
        b=hI/xB3nv2hpJ3OHiVpt345BcDt/T86/Mug9hNBcIBBAFvqmDLMoCKlEnwvQnWVcvn5
         mJxld7VMHcoCgn0nsIK1y9em9JBVZHr7tlZu5MXPUHzZt5Vq0L4sO+RDuYcEQSw7VjtQ
         WYcWLzumAJN3Nd1s43YoHmA4+4PQ1yDbViAuBreziWms/Bi0EFgWGE6oTw8tqPqe9F5z
         cMqgSVVNiMP0SDG5BtXo7WrvdhmSZ1VYHwGk8QBjv/JibM+Ikd35rfs7WmzGN/RMrq53
         rII82fAzD4sHckuFuzYi/uExGR2kQq0GDzyEqoGkztsp+Xc0s9bvsCUSkx/NQc3HzT5D
         Xqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783721265; x=1784326065;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uCi4vdatGlMYBO57z4Q+nFs0o+7WfmBZSwOdUxt/AOM=;
        b=gvV2tr835gqNLRbfLsltpyzzmLlz9jhmR71vuCDR/Kz9SivNwInJtY/m8gLjlsq122
         wtXU0KXS6BsGq033DFBYbxaVCEedQj9rww3IOgfV8WLf1ZvarEDcq1KFmHZh28rFZ09s
         5kl7sHDJuMrOpBtBBNXhoPm8BcHYejdRK5rDkMFoqYaEhEqnE9nlzk25U0KA+ok1Wlr8
         caHwOYiY/6dPvfJucwI6QVqtgNE9slNJtEWCI7GFj1JX7ghAPH83WIoYDuno7SgTu3Ea
         LGFDBckvJJAOPNXU6Brf/9akth7i3QzsBJzp+1b+IC2E+K0u8RrK4ceY1xrgrzEb+tQH
         AgAw==
X-Gm-Message-State: AOJu0YxJrMn69+YE4mc7582IQ+w57Y/46JwVVt7HNUcmflVsOdRe3oaq
	c10LmPsW0xnqwhJIUWVUj+n+a6fQlTsobv26yroyoRJp6TzRhgo0l2f8dHuIAVp/K/QtvT6Qc9t
	BV9cSqOy6dxg2t+1naefUL0FHznZ4Eiopk0hSpqITVNYF2ilm3rCPmXNYXJo=
X-Gm-Gg: AfdE7cnbuCrVpS0kw8nCj51ei4DH+f99TMTGndTI1gDQkNXzO7BMESCkNSvCFagwfHk
	h8mvBHyN+m+68L/p3A+vMXPBumHrKBftOGlQXVSUGppLVccTFtQsP+7oJqhGFivefx3v8NKhS7D
	RksWFMw8uNMYcxCupi54FYqNDZqPFTtNwgb37ByYzmc5yhWRSbc+3X1JyRJOdRt+UozhR0tDKfV
	iUhjxQiktJ/b/FUqNR9Y5tNeeay5na6ZyR30dx+QCJtyvZWgMyvWTJqNQeMXayArOcvH0Q2
X-Received: by 2002:a05:6a21:3a97:b0:3bf:b68f:4685 with SMTP id
 adf61e73a8af0-3c110779989mr867436637.23.1783721265104; Fri, 10 Jul 2026
 15:07:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260710212616.1351130-1-dmatlack@google.com> <20260710212616.1351130-10-dmatlack@google.com>
 <20260710213733.B4A461F000E9@smtp.kernel.org>
In-Reply-To: <20260710213733.B4A461F000E9@smtp.kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Fri, 10 Jul 2026 15:07:18 -0700
X-Gm-Features: AVVi8CexiXT1H3iCKRj5ssh2jkXiPSEyAsC89XKny5WUNfb4_b7wLF2ahEoukU8
Message-ID: <CALzav=c1+ZJDJ8=B1ZkBmB8cbx51ke_zFfDhPTjDfF5XhB_ZrA@mail.gmail.com>
Subject: Re: [PATCH v7 09/12] PCI: liveupdate: Inherit ARI Forwarding Enable
 on preserved bridges
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 2:37=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Data race on the `ari_enabled` bitfield of the bridge device.
> --
>
> --- Patch [9]: [PATCH v7 09/12] PCI: liveupdate: Inherit ARI Forwarding E=
nable on preserved bridges ---
> commit dba41feb80b848815c664a662c635fefb4ca7403
> Author: David Matlack <dmatlack@google.com>
>
> PCI: liveupdate: Inherit ARI Forwarding Enable on preserved bridges
>
> This commit inherits the ARI Forwarding Enable on preserved bridges durin=
g a
> Live Update. It updates the pci_dev->ari_enabled flag so preserved device=
s
> can be identified with the expanded 8-bit function number.
>
> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > index a95bfe5eff770..74a11e520f0d3 100644
> > --- a/drivers/pci/liveupdate.c
> > +++ b/drivers/pci/liveupdate.c
>
> [ ... ]
>
> > @@ -816,6 +820,20 @@ int pci_liveupdate_enable_acs(struct pci_dev *dev)
> >       return 0;
> >  }
> >
> > +int pci_liveupdate_configure_ari(struct pci_dev *dev)
> > +{
> > +     u16 val;
> > +
> > +     guard(rwsem_read)(&pci_liveupdate.rwsem);
> > +
> > +     if (!dev->liveupdate.incoming)
> > +             return -EINVAL;
> > +
> > +     pcie_capability_read_word(dev, PCI_EXP_DEVCTL2, &val);
> > +     dev->ari_enabled =3D !!(val & PCI_EXP_DEVCTL2_ARI);
>
> [Severity: Medium]
> Can this bitfield modification race with concurrent updates to other
> bitfields in the same word?
>
> In pci_liveupdate_configure_ari(), dev->ari_enabled is updated. Since
> bitfield modifications compile to read-modify-write operations on the
> underlying word, concurrent updates to other flags in the same word (like
> is_busmaster, is_managed, or msi_enabled) could be silently lost.
>
> The pci_liveupdate.rwsem protects liveupdate structures but does not appe=
ar
> to provide mutual exclusion for the pci_dev bitfields.

pci_liveupdate_configure_ari() is called from pci_configure_ari()
which also sets dev->ari_enabled=3D1 and is pre-existing code.

If writing to dev->ari_enabled in this path is indeed unsafe then that
is a pre-existing bug.

>
> > +     return 0;
> > +}
>
> [ ... ]
>
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index 739ecaab2e76f..e0c133b66a359 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
>
> [ ... ]
>
> > @@ -3539,6 +3539,12 @@ void pci_configure_ari(struct pci_dev *dev)
> >       if (!(cap & PCI_EXP_DEVCAP2_ARI))
> >               return;
> >
> > +     if (!pci_liveupdate_configure_ari(bridge))
> > +             return;
> > +
> > +     if (pcie_ari_disabled)
> > +             return;
> > +
> >       if (pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ARI)) {
> >               pcie_capability_set_word(bridge, PCI_EXP_DEVCTL2,
> >                                        PCI_EXP_DEVCTL2_ARI);
> >               bridge->ari_enabled =3D 1;
>
> [Severity: Medium]
> This isn't a bug introduced by this patch, but this preexisting fallback
> path in pci_configure_ari() also modifies the bridge->ari_enabled bitfiel=
d.
>
> Could this also be susceptible to the same read-modify-write data race
> against other flags in the same word?

See above.
