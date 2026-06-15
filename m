Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26AC38B12E
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 20:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781553882; cv=pass; b=TftqLiIIK9TlxXNZnV10wT9eE4FNFbvQ+3QEh3ZPhkAtam6SZmWZff3rgjVoWNWjOif/Sk6e9dKxP2PwjAR3VxBI59jqeciTJNpO0nUOp0W+QREopdevJVwpplSjbr6Stxv2imBlhpjNoMPQVbAEKLSYYJP+UNR6GePW89eX/FY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781553882; c=relaxed/simple;
	bh=owPIg6ubh/DQddddT9GGtMkMgKnfwbpYGJjt+//AIJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tGRKUWTH9UVjxHiKFZgy0BQPNPJor8hyUfFSPkfwX9xqJImR8VlMRHMmYcE6g1iLj6nBADapttUJiN4K4YyZkXe0JiSo37NnZhykt+tsMnTAPJ/jbJZSRAEw3c5rSCVlKktUhljhdBFLPTuVaSAQB6XCs+3ylCy7B8jWd+DItAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IAB88H0e; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IAB88H0e"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-13817614cd3so8017460c88.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 13:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781553881; cv=none;
        d=google.com; s=arc-20240605;
        b=Wzz8nKFd15SF4H606iQfDatwgs9g7DlU+cyEwxRER2TOOtwvJ3kpxvO0mdY1YATUlq
         /HowIrJAQBFyX9/ezyL77WvPU1Ohf7IHcsSZKMlh3KBXhwLHWy7dHZ1awww5Ow22Eino
         9PMJIro9J/nBQXyOI16pvujM/iy6P0ccj8+L8KUPqI3BxM2l9e9UEWF0j/ksqDXJUX9i
         dqrnUrPG5gmyaFcNc490vdEgBvg+QbUrJ33d7mkFGh07muiI1lL1fbgNNkMqqp4gVHhl
         AbrQiNgvysFNDmhy6dRcd615k1Q6zmvNVikHlK1Zotp9kXpAgYz93MXmCadu+ysq2D3a
         MdEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r3cAuZhgye1IsU1gMrp56etonTXBcaPhEeVfCnENr6Q=;
        fh=4vO6ciVX5a7jzzgYH+uohWI9OArTDe/olgTBHr6Me8w=;
        b=ASRO/qYUzK+PjtWbNjs1413heAl/TKrJiqsMHnvnSrodb/Tj0Ui4YHuGXTNmA9Ij2m
         bCudR77zl6q1znWISvaQ07K66MzQeowoGSiCK5Ug6dtd4+36RFBu+c8tnA1fZxxf1w4Y
         oOgomkWevuI4TB+dCAEatRcA+obGfNTS5SBvic6v2qTQgfJoCUlZXvsFV/Jfh/ENV61k
         xyVAN2RwSmgBzhnTVPM7Qg2Ec2zGG52DV2f32doTk6d8XK6NWg1C31Sf2Jpb43o/iz9N
         Tcv24PlpiR59uqvo54QOSlE85rl4rBUs5FzhmMxQCbzgWz/lX60g+aQmiKdMpByM6YMZ
         ii6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781553881; x=1782158681; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3cAuZhgye1IsU1gMrp56etonTXBcaPhEeVfCnENr6Q=;
        b=IAB88H0ehb+fXLHHwIqgOxMgkM/ODxmjW2F9TLz9qqM/5uEkLfjnzntb6SQQeC9c+x
         s+CAwdtaIQPICSENQrPnd9TY4v+yj6Iq/4BWQ98qrOumqZSjvtYLv5Sdkai282t2Zuj5
         6c9tu1TO5iEijyG3qATpTuQiiQfETPnIiXAZg2OwHufBiSpi4A+HaQN27nZE3aRQR3Re
         STPP5q27F0Tv/vNUAHJvnzml9GmkJ6l70fAkKkYBIMzjqWRidrkLRbIXII/jYjQuNWt2
         mceh3/HefwuVn03KWvfgUXzSa+Q/ts8jAF9BM1iGsruqCJk8YuejVpgDLq3i1mprh+D0
         SBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781553881; x=1782158681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r3cAuZhgye1IsU1gMrp56etonTXBcaPhEeVfCnENr6Q=;
        b=Up1mXGxeskRZoqC83dk6QJXkYHahJmXK+5cxHEJ3oNV4C3ebJEOIuZAphEQtEFeLeS
         WvB9HjDWinWDPt1CHpt+M+bgRBjGEb/nIevMhAMElP0JrdHXNnU1FBQjmLH/mDRtu7+L
         JxfWvEyY3v/h8HjyIIVrjR0/bdVCcYjnQv9GuNmNLoKG4MLIzNrbgKUC9pKUyKBpG8wq
         i5ycidpfo17J1ls+a9MyJEk4PFnn7wdkFfn+aHpZx7qRIPo6DmUqERizgzaIRlUPVsoH
         oVBxA20wrMtg+XGsP6D5vtgMjXshOnuS78D3voVgg1mWlXjlT4/BLPt19bQ0innnRp87
         ixhw==
X-Gm-Message-State: AOJu0YxumUA1jAW46w5UNtIzGvUaGLP+rOTOWw/y5cAy0iDWvd0yAE75
	16r2TsAGfH6ihBD4MFzc+CObnXh96/NTIssE6OHQWqw1qeMJfRRZf/5oz/Tpq7Hs/NpVAZg95Yb
	TCIo7kJN8EuwlLjW/10taoXNGj8WNvyYw54xLSGYw
X-Gm-Gg: Acq92OEjsTA6Kz3RPi0FHSLiknRvpmX+JMH2fGg5nm8bL5bjTombxemom5TKquIM8tr
	Oko7dH6dfUhBeDl4SIT8TAWk6GP6tuxCB5N75ACkhGkxOSK0lCDwQs0C0FLJH5lFgi6p8nyOYMn
	aoqthkJmHgxPyZ8MHH3jMWgZuZwBiimgIWfGkveMcE+HIYIfkrDAnJL2g1QTrPBfJ9hvDShzHF9
	Iw+fuIIEIU/Y25WtK2aXucIzz3TNZ9BpR00GXx3Wt6tcqG1cCiJ5P7xTspWT5cN6pRILwbi7Y1T
	sxJtHS4Hdf/GGZI/YA==
X-Received: by 2002:a05:7022:30d:b0:136:d421:9efa with SMTP id
 a92af1059eb24-1386f38f398mr6171219c88.32.1781553879982; Mon, 15 Jun 2026
 13:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260613002031.745413-10-seanjc@google.com> <20260613003501.DD5951F000E9@smtp.kernel.org>
 <CALzav=fsuDxGViwyFmhR1RmQKugR_tcj70gmq-492thdxJTDPg@mail.gmail.com>
 <ajA-5IQ3R5ZO1rSi@google.com> <CALzav=fQ5FENWgGNEqQrmb-i_9fWTRhLXj2-jZKC_zjM3Kg6PA@mail.gmail.com>
 <ajBQ3YEAMyKnJWYb@google.com>
In-Reply-To: <ajBQ3YEAMyKnJWYb@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 15 Jun 2026 13:04:13 -0700
X-Gm-Features: AVVi8Cd_8D6rihsAKEHaL9-XhAcm___nO2rBi-Wv8z6QEvOUnZocWEMFIMLJIV4
Message-ID: <CALzav=efwGdF+q1-_kMREvshbYTqWT4P_+U6Vs_brktvWub09g@mail.gmail.com>
Subject: Re: [PATCH v7 09/20] KVM: selftests: Add VFIO device support to
 eventfd IRQ test
To: Sean Christopherson <seanjc@google.com>
Cc: sashiko-reviews@lists.linux.dev, Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 12:22=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Mon, Jun 15, 2026, David Matlack wrote:
> > On Mon, Jun 15, 2026 at 11:05=E2=80=AFAM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> > >
> > > On Mon, Jun 15, 2026, David Matlack wrote:
> > > > On Fri, Jun 12, 2026 at 5:35=E2=80=AFPM <sashiko-bot@kernel.org> wr=
ote:
> > > > > > diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/tes=
ting/selftests/kvm/irq_test.c
> > > > > > index 9f8895b898214..6888be54ee4a9 100644
> > > > > > --- a/tools/testing/selftests/kvm/irq_test.c
> > > > > > +++ b/tools/testing/selftests/kvm/irq_test.c
> > > > > [ ... ]
> > > > > > @@ -55,6 +58,36 @@ static void *vcpu_thread_main(void *arg)
> > > > > >       return NULL;
> > > > > >  }
> > > > > >
> > > > > > +static int vfio_setup_msi(struct vfio_pci_device *device)
> > > > > > +{
> > > > > > +     const int flags =3D MAP_SHARED | MAP_ANONYMOUS;
> > > > > > +     const int prot =3D PROT_READ | PROT_WRITE;
> > > > > > +     struct dma_region *region;
> > > > > > +
> > > > > > +     /* A driver is required to generate an MSI. */
> > > > > > +     TEST_REQUIRE(device->driver.ops);
> > > > > > +
> > > > > > +     /* Set up a DMA-able region for the driver to use. */
> > > > > > +     region =3D &device->driver.region;
> > > > > > +     region->iova =3D 0;
> > > > >
> > > > > [Severity: Medium]
> > > > > Does hardcoding the DMA region's IOVA to 0 cause IOMMU mapping fa=
ilures on
> > > > > platforms that reserve or restrict IOVA 0?
> > > > >
> > > > > If IOVA 0 is unsupported, it seems like iommu_map() will fail and=
 trigger a
> > > > > test assertion crash instead of running.
> > > >
> > > > This is probably fine for now given the test is only for x86_64. Bu=
t
> > > > if you are going to send a v8 you can use the VFIO selftests
> > > > iova_allocator to fix this, instead of hard-coding.
> > >
> > > I'm confused, why is this test setting up a DMA-able region in the fi=
rst place?
> >
> > There might be some devices with which you can trigger an MSI with
> > pure MMIO. But most devices you need to at least set up some
> > descriptors in memory that describe what action you want the device to
> > take and then use MMIO to poke the device to read the desriptor and
> > perform the action. Reading those descriptors is DMA.
> >
> > For Intel DSA specifically, send_msi() works by telling the device to
> > perform an 8-byte memcpy and send an interrupt when it's done. The
> > driver region contains the descriptor for that memcpy, as well as the
> > 8-byte source/destination buffers the device should use.
>
> Ah, gotcha.  For a comment, how's this look?

That looks great!

>
> diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selft=
ests/kvm/irq_test.c
> index 6888be54ee4a..9a495fdb52f5 100644
> --- a/tools/testing/selftests/kvm/irq_test.c
> +++ b/tools/testing/selftests/kvm/irq_test.c
> @@ -67,7 +67,12 @@ static int vfio_setup_msi(struct vfio_pci_device *devi=
ce)
>         /* A driver is required to generate an MSI. */
>         TEST_REQUIRE(device->driver.ops);
>
> -       /* Set up a DMA-able region for the driver to use. */
> +       /*
> +        * Set up a DMA-able region for the driver to use.   Very few dev=
ices
> +        * provide a way to arbitrarily send interrupts (MSIs), e.g. by w=
riting
> +        * an MMIO register.  Instead, most devices send MSIs when an act=
ion is
> +        * completed, and practically all actions involve DMA of some for=
m.
> +        */
>         region =3D &device->driver.region;
>         region->iova =3D 0;
>         region->size =3D SZ_2M;
