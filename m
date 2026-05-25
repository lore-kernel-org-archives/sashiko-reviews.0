Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B331D2C08AB
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 16:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779727821; cv=pass; b=OCa8FHvZp8rQbeNJAIlWUIg71ARsYZ2TYDj1dxSS5h07M798VgPXo+AZobN4t8mV5q/NkIo4umTFpXPcfbDQ7mBaBGWGEwRhNcPd3QWrVfApmVmnqIFXVXseRAwaUq6TsYKltJNvYNV6rUD0/Ctnx/aDKVEsXYdMjBKKcr2JsNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779727821; c=relaxed/simple;
	bh=gvYRD/fbHclDb6BMPlUm/yjtLzzgXzWVzit+Q7QQgkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HI41MyO8gMi39iDqmCRXr3LmM4ivLR6f/M+kgc2ZoBeQXg3Z/SA7MqPNX9gbhpOs1x+SO5YsJvIELVnROtnX12fBl4W0LuFAeCW9RZYTwRmyoP+QAPGnHsDKHbmZ2Rrot4nEmSYKPzNTkQBALEX0NryM0Amrn6XEbMf//3FoWGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pNe3mpXX; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pNe3mpXX"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-516d6009380so12041cf.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 09:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779727818; cv=none;
        d=google.com; s=arc-20240605;
        b=Qz3vgfNkUGWqxrLs+sjBovyJIxP7vMk2+j3F+74nsrN8BCEM1FFDEz3IA3f/nRo0Vi
         58DXt3R3hdAx5dt3492WB1Biuw/yecDJBhJ8Cg3FA68XaMtcyPOR2Gtg5xxDPfvydyjS
         UQANlWLQapd8mVwXclROoKGlNjoErw33RnQZFVQ8PR/70FjVh1wJzav5bBlZIJeuhrIY
         hEW3ToLgsmq9dXTRR6EQCVXEapKdBLY42bMyqQLNBKpBgPqZyjdNyc4mBe96T+JSOgQ3
         D1gzmWnBmuncBvWTnRHg/Yc5poFbDMfGFaGwF6KDtD+CNsCSvfyvMAVsQ5VUugyF5ibB
         cQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0JjUL2DNtzGEe4CPKkrL56TkQhquEmRXcDVg+YHzq9Q=;
        fh=1KnkpctmiOV0pe/6EBLKM5KGa5Jh8EfVKYmeKpswmiE=;
        b=f/phtI1hGoOTqwSBKADhWPQ8HHVHU3e9w0qU0ZM9934l02HDC5oQff32wzjVf658Ff
         IOokX0lVgi4octwd9/dO/hJ9LuWuJeRDb+bccOPkGPQm1ue6Ci15tuo/L8xWPWKGlQ/N
         pSSLKXErvGBLo+m1Rnj3iy9/FfktEC57KBSd0/WirSwa1+msqRkayhp6TarToL0vFI0Y
         mRy+Vz1wGoxF5c37TWPrVtK+U2+8JOZm+TBleM4aH70ubyFQajuUZeFHSxmH6mPi8l2Q
         0ZRT0m482eIDJV6SjNS9vCqiE2jp8dqmu6xcy/SjPDA3WxPybEptkb+d9Xd1pwM7rVQd
         F1Uw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779727818; x=1780332618; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JjUL2DNtzGEe4CPKkrL56TkQhquEmRXcDVg+YHzq9Q=;
        b=pNe3mpXXzb/6vpaHBFKdx7UAXGzSP4dZzU5eA8Tcl3/kSpyg7dI3otbaMgkJLJ6TLs
         KcAX9r+sUoDNd7ziWyakGsLKMCog9F3vSolLrqBZd39UZYg1kkppIpyj5P7AsovErtEa
         qEBn5mkyM0b/yz3m+6IE8bJav1HcdPUN6ljvWCPPuqU/oKmzjzUAiL+xjHt4AfYHJY+a
         bZlnipaf2hs1qBu99GT2U7yZP3s443Vcp+E5mvS9/YK+/1kayT8282Lnisyw/D532cn0
         MtgDIA7+Uzz0OtD5++u09PqhNyw8BReKIF34HI6ysJoTA+HtA7AaSjejR5m9csz9o0wX
         Hbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779727818; x=1780332618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0JjUL2DNtzGEe4CPKkrL56TkQhquEmRXcDVg+YHzq9Q=;
        b=JzyEKXngjbeUvX979Jo414jBDITG1H1L2qFJfs304KOQt36TO3LtMkzQP5e8cEf2J1
         BHUwQJ6VOMmzyqnHhxt1Uud45Aj2TptYhZFljfxPS7hyLto49eTYY+FjsY/TZUOby347
         vKKwqw3AR28na5Btgud8BTBjYiCIcJYRqm5NrazWbFC799osXTj3BCGX8+stSWa7GPDJ
         PcNZEI13oBywL62EykzDXBd+s01v/sdN3mtUMXQk7OIgCjP7f0cVqFGDcvsVxlAKpbyQ
         25JXlbvc/dUMX6gJ1ual1AwOkG4ORc1vhTPUVAPEZ6GhRE8NyNPnqDH187Bdkqygm3f7
         L3tg==
X-Forwarded-Encrypted: i=1; AFNElJ+SeRVB+dxxDCPOG3OtY+jPccINBd3eudbVG8PwtxZq+xSJtFD/Bjfw7siM7qjnXTDHIqQxYeo/lnql19hvOxQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2YMkDJKgbJ6w4YCOfgcJg9X4gQVgcbCs+v0F1XPnuBpr/iSpn
	HRvFQKQIbiqXIDLDxBSurrM3QGMxFKY16N1XcX175smbd2mQ2btBQP3EGmxAaWua5cFu9urFURW
	ravYPwIigmlW4rfOdKJ+7mpMm4UeAuZqb9h2TYg9a
X-Gm-Gg: Acq92OE2NLhIaarawckpDCMTV/rg/DfQMPTMQRk41Yn+j4dqnLauYxE1ReCfU5qWnad
	HGGNCBxl5VGCgnfI6REYjoFT97ntYQGqjCGcWke0eh0/DuyvDfUEPiGCXNaclUjK0uvLOnXIMGD
	nTIGbTYo451Mbj505aUV0tVZ59RC/eweCSrYwGjuzbQVBVHQVUQPwghCeUD0vhFp0YioNjRKO8w
	lmHEvyRpPG+U4A6zCL50VVmHAvTU9N/wbDQ416urkvlUqahN7nq89c5JeoeYunO3lRZSMw2m7QA
	vozc/OIqIOnkCsF7sQClU/xt3l/unw9c0GeSnnX5EiAt5kxA
X-Received: by 2002:a05:622a:5806:b0:514:b17e:86f3 with SMTP id
 d75a77b69052e-516e0dba205mr23195971cf.12.1779727818143; Mon, 25 May 2026
 09:50:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522202410.3104264-2-dmatlack@google.com> <20260522204400.4C7E51F000E9@smtp.kernel.org>
 <CALzav=cZsFx5dpbELx1cMHUa1+4+uv7cYEWAWAtZkXeB2d9mMw@mail.gmail.com> <ahGMrrU0wCUdWgsN@kernel.org>
In-Reply-To: <ahGMrrU0wCUdWgsN@kernel.org>
From: Pratyush Yadav <prty@google.com>
Date: Mon, 25 May 2026 18:50:06 +0200
X-Gm-Features: AVHnY4Lb1xmQZl0kSTzbbqWnI26kjuiXlfW8kdi8Ev0RksUckJgTRut1sW7eqVc
Message-ID: <CA+Yg5gQ_6jwFJpDupMoPz7Q2pMB7PNMHpLdv6ikFxfchz0zGCA@mail.gmail.com>
Subject: Re: [PATCH v6 01/12] PCI: liveupdate: Set up FLB handler for the PCI core
To: Mike Rapoport <rppt@kernel.org>
Cc: David Matlack <dmatlack@google.com>, sashiko-reviews@lists.linux.dev, 
	linux-pci@vger.kernel.org, Pasha Tatashin <tatashin@google.com>, 
	Alexander Graf <graf@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 1:17=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Fri, May 22, 2026 at 02:37:28PM -0700, David Matlack wrote:
> > On Fri, May 22, 2026 at 1:44=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> > >
> > > Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> > > - [Medium] Missing `kho_is_enabled()` check before calling KHO preser=
vation APIs in PCI Live Update FLB operations.
> > > --
> > >
> > > commit b0cb2fb154fba1aa85d63570fe0186e243353fb7
> > > Author: David Matlack <dmatlack@google.com>
> > >
> > > PCI: liveupdate: Set up FLB handler for the PCI core
> > >
> > > This commit sets up a File-Lifecycle-Bound (FLB) handler for the PCI =
core
> > > to participate in the preservation of PCI devices across Live Update.=
 It
> > > allocates and preserves a pci_ser structure using KHO when the first =
PCI
> > > device file is preserved.
> > >
> > > > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > > > new file mode 100644
> > > > --- /dev/null
> > > > +++ b/drivers/pci/liveupdate.c
> > >
> > > [ ... ]
> > >
> > > > +static int pci_flb_preserve(struct liveupdate_flb_op_args *args)
> > > > +{
> > > > +     struct pci_dev *dev =3D NULL;
> > > > +     u32 max_nr_devices =3D 0;
> > > > +     struct pci_ser *ser;
> > > > +     unsigned long size;
> > > > +
> > > > +     /*
> > > > +      * Allocate enough space to preserve all devices that are cur=
rently
> > > > +      * present on the system. Extra padding can be added to this =
in the
> > > > +      * future to increase the chances that there is enough room t=
o preserve
> > > > +      * devices that are not yet present on the system (e.g. VFs, =
hot-plugged
> > > > +      * devices).
> > > > +      */
> > > > +     for_each_pci_dev(dev)
> > > > +             max_nr_devices++;
> > > > +
> > > > +     size =3D struct_size_t(struct pci_ser, devices, max_nr_device=
s);
> > > > +
> > > > +     ser =3D kho_alloc_preserve(size);
> > >
> > > [Severity: Medium]
> > > Should this code verify kho_is_enabled() before calling kho_alloc_pre=
serve()?
> > >
> > > The commit message states:
> > > "Note: There is no reason to check for kho_is_enabled() since it can =
be
> > > assumed to return true. If KHO was not enabled then Live Update would
> > > not be enabled and these routines would never run."
> > >
> > > Does this assumption conflict with the Kexec Handover subsystem guide=
lines?
> > >
> > > The guidelines mandate that all callers of serialization APIs must ex=
plicitly
> > > gate their usage with kho_is_enabled().
> > >
> > > Calling preservation APIs like kho_alloc_preserve() without the check=
 can
> > > silently add tracking state that will never be used if the subsystem =
is
> > > unexpectedly inactive.
> >
> > Sashiko keeps leaving this comment. It seems like a false positive to
> > me. KHO maintainers, perhaps the KHO documentation needs adjustment?
>
> TBH, I don't remember such guidelines, but patches are welcome ;-)

Yeah, on a quick scan of KHO documentation I see nothing of the sort.
So possibly the bot is hallucinating?

But perhaps it would help if we update the subsystem prompts for
Sashiko about this?
