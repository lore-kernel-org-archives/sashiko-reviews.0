Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4369443AB7
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 23:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784676249; cv=pass; b=NCKyfnTl0QqAZrXd8xbS4c0bcUWKkvpl+GTTPCUa3lP3YX3+qf/gcokLmMc3whq5dEZgl8FcGvKMBlDZB/uXoPjwHqt+H2ucBAn2cTTWpUsgY5odDADzywVJA9oaF15le19JvC264wdR4bVAC8IIJAQ1sfHYFJ85vjfxQTvB5GQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784676249; c=relaxed/simple;
	bh=7sCYlVaL2+1CZKJKEZ/isaJFx6+E0RgIqlrpWAw+f2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSg3WR3qbody7XVWCdM4mkwjIbl8dOTGrIiqa3xC0v2Bg17qrt1GXtnmwiQAKaCF5MteLhm6xX//rWC7ZHRExQlEGweecB/O+PCHMu5QEC//7cuOh5ojuRNzEiusparlhAzZx9l4UbsfLUAJmwY51g8La02AbbdIKjNcBLP3nDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=afMl4p20; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="afMl4p20"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b2a8173142so9084e87.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 16:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784676246; cv=none;
        d=google.com; s=arc-20260327;
        b=EcKf7kGJbdm+0uSB2tBpv99+yIAWGa59vpcfk6IVgVmQFkwvlK+S5ATEyBSuJI+/Tl
         BrEUkzodWGpyfxi+CpHqwD3Ius6Xi8bfzBZSl6AwVoccT2wCVI1BVxvLAGR7HQLOFvNK
         JZIFH4mZqYu7KZaET7LvkaO1LzKy1mklAQPK/wHfvuspO4mszUR1IKGbeVRlZ7DEziTH
         B6sYAE8EmIVkwoIGSU+0bp/5ZPhVRJrLfC50e4Ju19m6nZTRYl7BpKvuOM9RtNApbfx3
         gCi5Rhtdr4CX+8hzqy7xurx0DYbFwCw+iHh1jNH2enc2qS2sHW3ZpTaNX/p1xSdrcY6h
         wWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P63nR5J5VcgsLEKhW3G2CnQQw+ZQC3+nOPuDBqd6w98=;
        fh=IDnMz+xTytk/Umv9MdZIEKVm06FDhBN4P4qftx0mXkU=;
        b=BY8vV6jCFS+Nfz/xkFxgZS95DAOB5Lby45z9dM05SLZmwouE2NowcK4Lp78NyqAws6
         hcDaWyojrTiIOBBUmI8Dx4s46J/AnAf4GKrrv+YyuxlcSJ+34zJPMZ1a36C8sleVo93j
         NkuGoCoqtcLse6fSV53xJS/sudwxEtHZ/xxSXn7xbHo/S12nNZxwYZhZde31qTsiNSdv
         u7y24vjlyR7hAnTOifQ19aJ6ozA8L0QgYKtJHzS8sEzv7USXBHyS2sZZUklDQdzPJzUw
         0yquNCqPEicKgD0r9r+glCg4Klt3Fl3ilhud6LAjwbboeU1aNOer29WVl0yk3FvINC6a
         EyJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784676246; x=1785281046; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P63nR5J5VcgsLEKhW3G2CnQQw+ZQC3+nOPuDBqd6w98=;
        b=afMl4p20sLgaJLh6Wi4dHRMNc9tUixopa2oNir5Ssbifg+ItxivvNdFQrI+YtlUY37
         OsV0KZKnU7k1AIf5pOnDEllpxvRTCqCJrC+/Kn2Q8qryCrMmo7rAlPDkKARx+k+cbOxI
         ibYnhWqlRSpGirPRyY+D/ZaJ9G+VZB1H2r6NnT3aP2N/cBXwVorQPB9nz63G3Goa0Rxb
         QHsDzKQ6/mt8t2drYPWJBXGTB3Gpy3YCGFds4qQlKtyG481aAoeh2RnRNav7IhOD1wLo
         GeSULFfxxifkQvlP8TVn7llrv9FATorcofvd0q13Kop0UV82KqFZDkHLB7I8UQlgDhIM
         JItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676246; x=1785281046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P63nR5J5VcgsLEKhW3G2CnQQw+ZQC3+nOPuDBqd6w98=;
        b=SvDIn/1UBfKw22UsBnyaZRU215+gHN+Ruz3MbyKBuxIpoAvShOHWyazZaRjvLnEao8
         bS3Vpj2tM0mMVcog0aZDfpcCfOXOikKAyyHYtniJqtkG019o/Z3eRTKJ9yoYBckns+f9
         oqUAKezD14y74+UPm0dd6eQcKuLJA/fwFg9AbwA877rQpJpSz2albrMoDN0rWio+o6Fa
         WVrk0e39ebqDowDD9nuVsCp8VB0KadImIk9IYyKHIsuvDMcbcNDVO+w8I/sihoz3XFWq
         RwurNX7Rtfve3az1QWRPri3mRPpnAh0KtelPuX0GD4zOCczPnkz2Qce1pJtQMqE7bQ5I
         RwPw==
X-Forwarded-Encrypted: i=1; AHgh+RpJVkN7JAfFDGjEKkmysmm+zAfuHIOiDdENsboesRUqHGRcPig2M/Rftms91GOq3QI6+Ha4G7y6FLjor0/WLaY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcHl1PRAJ1C6tpd6lUdPAq7KpZsXnDhPvsgHPv+kQi1a8FL0mX
	Ee7zVFvXWaM13JmONT1tWrKbPU5kWt0rCvQMvMrhd+gR0M9bFbNiVWP3aJLkimWWM64v1b4sfZv
	4fJ9G7JLeYlJWde6nThksDKdcjNUOkAyQAdjbB3fOcaxvEPi7bwObOeE=
X-Gm-Gg: AR+sD13+tiuVJaae7cigHnSNbvHF2aoVg901xzq2E80bINly2ejf+1HcL0lP1kOZju4
	c/EDerlVXOyYV+aokrABfdCfxIaFeK060WVt/u8ciyU2STk9huOhwtfIHGHSGVWiqDhweuRqwfN
	pBvzBvVgiDz9t4F/p45UJCikEA9SouasYSX53rSVvCyl36l1M/CvmlJa4/HL4MMXJ7ffgXCK9/3
	Ts3BF1E1W/orH8oSw0/QBSnJfehy8FDvwfU4+ANtHHPYM6FwdcwSygdCw==
X-Received: by 2002:a05:6512:2306:b0:5b1:571f:715f with SMTP id
 2adb3069b0e04-5b2aaf90ab6mr35184e87.3.1784676245415; Tue, 21 Jul 2026
 16:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714-igb_v3_b4-v5-0-91503eddb98b@google.com>
 <20260714-igb_v3_b4-v5-5-91503eddb98b@google.com> <20260714211204.437281F000E9@smtp.kernel.org>
 <CAAdrzjsNJfkFjwK4Nwendph60=FFhYCbXkXzTXO354roK3GoTQ@mail.gmail.com>
 <20260720154227.1f727abe@nvidia.com> <20260720155120.2815e269@shazbot.org> <al_4RXwK0IeV1n7D@google.com>
In-Reply-To: <al_4RXwK0IeV1n7D@google.com>
From: Josh Hilke <jrhilke@google.com>
Date: Tue, 21 Jul 2026 16:23:53 -0700
X-Gm-Features: AUfX_mxcEeAOGKigvekzUHIKnmzcVMbyEIl20KIxIb9L_apGupkAAT1xrJux0Yo
Message-ID: <CAAdrzjso3yg3cZsUAxg0NCsExfm9No=6XnvgQ_jY5Je7qJ8cNg@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] vfio: selftests: igb: Recover after DMA-read faults
To: David Matlack <dmatlack@google.com>
Cc: Alex Williamson <alex@shazbot.org>, sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ack, will do!

On Tue, Jul 21, 2026 at 3:52=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On 2026-07-20 03:51 PM, Alex Williamson wrote:
> > On Mon, 20 Jul 2026 15:42:27 -0600
> > Alex Williamson <alex.williamson@nvidia.com> wrote:
> >
> > > On Mon, 20 Jul 2026 14:27:12 -0700
> > > Josh Hilke <jrhilke@google.com> wrote:
> > >
> > > > On Tue, Jul 14, 2026 at 2:12=E2=80=AFPM <sashiko-bot@kernel.org> wr=
ote:
> > > > >
> > > > > Thank you for your contribution! Sashiko AI review found 1 potent=
ial issue(s) to consider:
> > > > > - [Medium] Test flakiness due to fixed heuristic delay instead of=
 polling on EAGAIN during VFIO_DEVICE_RESET
> > > > > --
> > > > >
> > > > > --- Patch [5]: [PATCH v5 5/5] vfio: selftests: igb: Recover after=
 DMA-read faults ---
> > > > > commit a631c99ce1be37dbbdda0314b730b2c6bd947b50
> > > > > Author: Alex Williamson <alex.williamson@nvidia.com>
> > > > >
> > > > > vfio: selftests: igb: Recover after DMA-read faults
> > > > >
> > > > > This commit adds recovery logic to the igb selftest when an inten=
tional DMA
> > > > > read fault causes the device to hang. It introduces a reset and r=
e-init
> > > > > sequence using VFIO_DEVICE_RESET, including a 10ms delay to allow=
 kernel
> > > > > error handlers to release the device lock.
> > > > >
> > > > > > diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c=
 b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
> > > > > > --- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
> > > > > > +++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
> > > > >
> > > > > [ ... ]
> > > > >
> > > > > > @@ -500,7 +522,28 @@ static int igb_memcpy_wait(struct vfio_pci=
_device *device)
> > > > > >
> > > > > >       igb_irq_enable(igb);
> > > > > >
> > > > > > -     return (status & 1) ? 0 : -ETIMEDOUT;
> > > > > > +     if (status & 1)
> > > > > > +             return 0;
> > > > > > +
> > > > > > +     /*
> > > > > > +      * The descriptor never completed.  On real 82576 hardwar=
e this
> > > > > > +      * typically follows a DMA-read fault from one of the int=
entional
> > > > > > +      * unmapped-IOVA tests; the fault leaves the descriptor e=
ngine
> > > > > > +      * unable to service subsequent valid descriptors.  CTRL.=
RST alone
> > > > > > +      * reinitializes the queue registers but leaves the engin=
e wedged
> > > > > > +      * for the current process, so a broader VFIO_DEVICE_RESE=
T (FLR)
> > > > > > +      * is required.
> > > > > > +      *
> > > > > > +      * Delay before requesting reset so PCIe/IOMMU/AER error =
handling
> > > > > > +      * triggered by the just-observed DMA fault can release t=
he device
> > > > > > +      * lock VFIO_DEVICE_RESET contends for.  The 10 ms value =
is
> > > > > > +      * heuristic.  The current memcpy still fails with -ETIME=
DOUT;
> > > > > > +      * recovery only ensures the next memcpy starts from a us=
able state.
> > > > > > +      */
> > > > > > +     usleep(10000);
> > > > > > +     igb_error_reset_and_reinit(device);
> > > > >
> > > > > [Severity: Medium]
> > > > > Will this fixed heuristic delay cause test flakiness under heavy =
load?
> > > > >
> > > > > If the kernel's PCIe/IOMMU/AER error handling takes longer than 1=
0ms to
> > > > > complete (for example, when KASAN or other heavy debugging option=
s are
> > > > > enabled), the device lock might still be held.
> > > > >
> > > > > Looking at the kernel side in drivers/vfio/pci/vfio_pci_core.c:
> > > > > vfio_pci_ioctl_reset(), lock contention causes pci_try_reset_func=
tion() to
> > > > > return -EAGAIN:
> > > > >
> > > > >         ret =3D pci_try_reset_function(vdev->pdev);
> > > > >         if (__vfio_pci_memory_enabled(vdev))
> > > > >                 vfio_pci_dma_buf_move(vdev, false);
> > > > >         up_write(&vdev->memory_lock);
> > > > >
> > > > >         return ret;
> > > > >
> > > > > Since igb_error_reset_and_reinit() calls vfio_pci_device_reset(),=
 which
> > > > > asserts that the ioctl returns 0, would this lock contention caus=
e an
> > > > > immediate test suite failure?
> > > > >
> > > > > Should this code explicitly poll for -EAGAIN from the ioctl inste=
ad of
> > > > > relying entirely on a fixed sleep?
> > > > >
> > > > > > +     return -ETIMEDOUT;
> > > >
> > > > Alex, I'm guessing 10ms is what worked for you when testing with th=
e
> > > > physical hardware? If it's working fine, I don't think it needs to =
be
> > > > changed.
> > >
> > > Yes, the delay was found empirically and indeed we could make this mo=
re
> > > robust if we retried on -EAGAIN.  I'd be in favor of doing that as a
> > > follow-up.  Thanks,
> >
> > Oh, some further context, vfio_pci_device_reset() asserts the return is
> > zero, which IIRC, is why I accepted the heuristic delay rather than
> > expand the scope with a new reset callback within the framework.
>
> Let's fix vfio_pci_device_reset() to retry on -EAGAIN. Josh can you apply
> something like this on top in v6?
>
> diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools/t=
esting/selftests/vfio/lib/drivers/igb/igb.c
> index f50d450d3e94..25cac663de1d 100644
> --- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
> +++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
> @@ -533,14 +533,7 @@ static int igb_memcpy_wait(struct vfio_pci_device *d=
evice)
>          * reinitializes the queue registers but leaves the engine wedged
>          * for the current process, so a broader VFIO_DEVICE_RESET (FLR)
>          * is required.
> -        *
> -        * Delay before requesting reset so PCIe/IOMMU/AER error handling
> -        * triggered by the just-observed DMA fault can release the devic=
e
> -        * lock VFIO_DEVICE_RESET contends for.  The 10 ms value is
> -        * heuristic.  The current memcpy still fails with -ETIMEDOUT;
> -        * recovery only ensures the next memcpy starts from a usable sta=
te.
>          */
> -       usleep(10000);
>         igb_error_reset_and_reinit(device);
>
>         return -ETIMEDOUT;
> diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_de=
vice.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> index 2e67afc0d580..27bdf561925f 100644
> --- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> +++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> @@ -41,6 +41,7 @@ struct vfio_pci_device {
>  struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iom=
mu *iommu);
>  void vfio_pci_device_cleanup(struct vfio_pci_device *device);
>
> +int __vfio_pci_device_reset(struct vfio_pci_device *device);
>  void vfio_pci_device_reset(struct vfio_pci_device *device);
>
>  void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
> diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/t=
esting/selftests/vfio/lib/vfio_pci_device.c
> index 7b8394d0ac50..45704a2c9485 100644
> --- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> +++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> @@ -221,9 +221,23 @@ void vfio_pci_config_access(struct vfio_pci_device *=
device, bool write,
>                        write ? "write to" : "read from", config);
>  }
>
> +int __vfio_pci_device_reset(struct vfio_pci_device *device)
> +{
> +       if (ioctl(device->fd, VFIO_DEVICE_RESET))
> +               return -errno;
> +
> +       return 0;
> +}
> +
>  void vfio_pci_device_reset(struct vfio_pci_device *device)
>  {
> -       ioctl_assert(device->fd, VFIO_DEVICE_RESET, NULL);
> +       int r;
> +
> +       do {
> +               r =3D __vfio_pci_device_reset(device);
> +       } while (r =3D=3D -EAGAIN);
> +
> +       VFIO_ASSERT_EQ(r, 0, "ioctl(device->fd, VFIO_DEVICE_RESET) failed=
\n");
>  }
>
>  static unsigned int vfio_pci_get_group_from_dev(const char *bdf)
>
