Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F77F315D43
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 21:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784582847; cv=pass; b=fAWiAFKqelUUkIrUUM3Et93uMIJsIHEWDuMrW5TIMWLJuUyCVuoNDLvr8lwKh3cXEudl/Wrkx1DWl2tf3q3xCVhWswyy6+87PM1/VKg6EXTc7yLbet1pYFDqB7w+wXFMD/hRLuOgftyjH8PEHel/3627pEiS+cfK3E23LKYSanw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784582847; c=relaxed/simple;
	bh=iuBz6ODbxctIQcEz9hRVx17UzGZhYMd+1SN8l/Iffi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sb6LYq2C7Dmd46Ro8F1pGE6ktnqXAmfNyVmE798sQ9lqY2QuNg+Kd5EVbJwJ+6RAFKt4YM/wNTQzSNyafaz1O5Zi8lHLVKISOSQ2F37e3mIVgeizMB8cNkQYT72bvu4jnMzvllbWh8wTjzSOu0Ce62nxqhTrXMBRrKyHHt8xick=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GA2ZGmbg; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GA2ZGmbg"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b020a70f9bso18391e87.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 14:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784582844; cv=none;
        d=google.com; s=arc-20260327;
        b=TkfjxnroidTjUVda8hvd0D+jO/dLjKzq6eKTJ5nP2WG9uW66ZSFmmFYKe65jf1CHvw
         WcfNpvYxzbYo4ieLps8gHbJi2GfxPpjjpy8nTHGX+B/Ha3EwjRZ+pm6BjoExXRUu2ucB
         9oEPIbIlG/NvDrgnfu21klg3AXJHLezd/v53RNdp8T675rqOaCSfNhu7mLYG1ACuvvqg
         KYBwYuoMbnp0/I4zEfXOAg3bBp0Bzur8/xhKS3ZZ5WrOeR2o53PaHzu8X+Lrb8nFFeVt
         3lG9x6Pfsf8hlmzxUyaaBKrH3nlcL/CJgNybg1VLoI/oDO+7OYV1+bS8I7aw7OHQoV8F
         6y4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M8U0zaKrWazb9iq+MM5NRDtbR/DvHa80gVd/ybVUHLY=;
        fh=QlUXu5ScCU3oQ/wPVaDn0x8Qs/lOFTTH1bYHPua1hnA=;
        b=XkhKbWVMUFxy7XeUhpVh/L/SpT8bidQIHTKcaPJX30mtYRu4oER2cFzBnd4tz3Bn28
         G1TN4O1I3+a27alJYQM0KC5Xi5Qb1uY364ghYZSHK2MzEPMN7fdDPX/7bRl+8WdHFflV
         Ytuy/cVuHp1ElEhrAkMycfp0jgv47li5RCBqKOif601jdI75EfGttQ84CtO9m70NcFKx
         ZGYxgftyKYYopsdwLQpK+dXrFo0dS1cnejsorH/o4xyCErh+cZ/yZqJpO3C0aJgIRgA0
         VkQ9XeIbHaF0EL/f66jNUtTdI3LJ2jAnp3CKJg9HK6FUTZt08esejYDyd3ftmYPBx4zR
         2GLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784582844; x=1785187644; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M8U0zaKrWazb9iq+MM5NRDtbR/DvHa80gVd/ybVUHLY=;
        b=GA2ZGmbgnbDYpNB1ddfjp8E86rCwL7RcV5UCsO+HrmnXYI1ZkBEWIRzEeX8bSDnIyg
         S3gNxuxn/ECn4K5DcDkfpnY1J8H7CfV+0f+qLv+LsKDl5RNpRlcJ8zY20VncRor+neHc
         oXCFiSQB9L4Q0yhVj7H9lWmCL4flpxF8Bt/teYRjVriR5i7CH0aSrg+C0x0iV+xm0B6s
         KLsiVsWSkFfNVLQar0SfiBhGAzuv+6uzk9SY40PoDxBTwPz91Xn6wKpwM9/THTR5X+X+
         q665GSBEbHFXALFe9sHRwKpHo+IhJV2HSVkAXKunPju65W2ImjdH+EkRCIV4EJ344Leu
         JamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784582844; x=1785187644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8U0zaKrWazb9iq+MM5NRDtbR/DvHa80gVd/ybVUHLY=;
        b=DKqb7kRM94S/rz0VLwQ/MED3408v/SH02Kv+ktVGOP3AaibbOdFg/VvqQsluutP+78
         gfpjRcEy1i5sQ1B514EOis4KLT0o4Z5Q9WQa17Lfj8hu9AfDQ/YB8od48UlldHQKyF4X
         8gCROqfDXNzkqfPF8CvsKEizOt3M83AVj4ldURNgvzE2yiGPhML0HI1Aske8zOQ1WtE+
         W7FOIiufSAGwbmSOvFr2OHApuD6Rm8WvFMpbDCVQvw4ZZ+AdojkyR/fmjx255LnUnwDh
         zgTda+llO8wT/6EhgBB63VgWQgA2suh5LXUYcUBW8Ce5jnfQACViDqMwYd2ywk04SGKi
         NtnQ==
X-Gm-Message-State: AOJu0YyE8HxW47ur8PQpjgU7vnIGJwTj6mGZJkkpZ207UScVUB4zwUDS
	ol0DHKoREQvvHd2gUd/aT9xhohdQxFBcsE87e96q8LAr1pJ1QzzmRxCXir516vvnzjEBiEYby5Z
	Dc090rVKWXILf542e48IsfE3S/bytI2dAB14tnxY6OsZ7iMQKGQL+5AE=
X-Gm-Gg: AfdE7cnAniPxm6P7SMaIHwV3+hUDnAilT7jVVbBfSzYhUtK3VLySccKVb+apCFClsBt
	AeC7LeSM2A3MeSIV3owoGa+fQfTLIpeywiKZOEgizHC0lsLsvow/RsDrreSxSBZVVo0e4h/aNGR
	p/vYn2GqVzB781WiKpR9ARISQBfnl3GRvMCd9OCPUlM8TdG+aVdUZtcppa+Bd4iUMIaI+Gg+mcg
	NjFS1tVRY3IN5bZyMQ9gwHMVIx5HmfqoygpFpA3TRCRFQjB6GX8VHzqSpQj8lE3SFw87C5miPta
	uVAHT1vAN5nbZH8=
X-Received: by 2002:a05:6512:3b1f:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b2a3159c1bmr174289e87.4.1784582843798; Mon, 20 Jul 2026
 14:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714-igb_v3_b4-v5-0-91503eddb98b@google.com>
 <20260714-igb_v3_b4-v5-5-91503eddb98b@google.com> <20260714211204.437281F000E9@smtp.kernel.org>
In-Reply-To: <20260714211204.437281F000E9@smtp.kernel.org>
From: Josh Hilke <jrhilke@google.com>
Date: Mon, 20 Jul 2026 14:27:12 -0700
X-Gm-Features: AUfX_myD3e5q2EqrZATf6h1baJ9SeqS4RqB0ub2E2ay9NhrO9FU2hAXEPYHjQ5w
Message-ID: <CAAdrzjsNJfkFjwK4Nwendph60=FFhYCbXkXzTXO354roK3GoTQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] vfio: selftests: igb: Recover after DMA-read faults
To: sashiko-reviews@lists.linux.dev, 
	Alex Williamson <alex.williamson@nvidia.com>
Cc: kvm@vger.kernel.org, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 2:12=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Test flakiness due to fixed heuristic delay instead of polling=
 on EAGAIN during VFIO_DEVICE_RESET
> --
>
> --- Patch [5]: [PATCH v5 5/5] vfio: selftests: igb: Recover after DMA-rea=
d faults ---
> commit a631c99ce1be37dbbdda0314b730b2c6bd947b50
> Author: Alex Williamson <alex.williamson@nvidia.com>
>
> vfio: selftests: igb: Recover after DMA-read faults
>
> This commit adds recovery logic to the igb selftest when an intentional D=
MA
> read fault causes the device to hang. It introduces a reset and re-init
> sequence using VFIO_DEVICE_RESET, including a 10ms delay to allow kernel
> error handlers to release the device lock.
>
> > diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools=
/testing/selftests/vfio/lib/drivers/igb/igb.c
> > --- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
> > +++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
>
> [ ... ]
>
> > @@ -500,7 +522,28 @@ static int igb_memcpy_wait(struct vfio_pci_device =
*device)
> >
> >       igb_irq_enable(igb);
> >
> > -     return (status & 1) ? 0 : -ETIMEDOUT;
> > +     if (status & 1)
> > +             return 0;
> > +
> > +     /*
> > +      * The descriptor never completed.  On real 82576 hardware this
> > +      * typically follows a DMA-read fault from one of the intentional
> > +      * unmapped-IOVA tests; the fault leaves the descriptor engine
> > +      * unable to service subsequent valid descriptors.  CTRL.RST alon=
e
> > +      * reinitializes the queue registers but leaves the engine wedged
> > +      * for the current process, so a broader VFIO_DEVICE_RESET (FLR)
> > +      * is required.
> > +      *
> > +      * Delay before requesting reset so PCIe/IOMMU/AER error handling
> > +      * triggered by the just-observed DMA fault can release the devic=
e
> > +      * lock VFIO_DEVICE_RESET contends for.  The 10 ms value is
> > +      * heuristic.  The current memcpy still fails with -ETIMEDOUT;
> > +      * recovery only ensures the next memcpy starts from a usable sta=
te.
> > +      */
> > +     usleep(10000);
> > +     igb_error_reset_and_reinit(device);
>
> [Severity: Medium]
> Will this fixed heuristic delay cause test flakiness under heavy load?
>
> If the kernel's PCIe/IOMMU/AER error handling takes longer than 10ms to
> complete (for example, when KASAN or other heavy debugging options are
> enabled), the device lock might still be held.
>
> Looking at the kernel side in drivers/vfio/pci/vfio_pci_core.c:
> vfio_pci_ioctl_reset(), lock contention causes pci_try_reset_function() t=
o
> return -EAGAIN:
>
>         ret =3D pci_try_reset_function(vdev->pdev);
>         if (__vfio_pci_memory_enabled(vdev))
>                 vfio_pci_dma_buf_move(vdev, false);
>         up_write(&vdev->memory_lock);
>
>         return ret;
>
> Since igb_error_reset_and_reinit() calls vfio_pci_device_reset(), which
> asserts that the ioctl returns 0, would this lock contention cause an
> immediate test suite failure?
>
> Should this code explicitly poll for -EAGAIN from the ioctl instead of
> relying entirely on a fixed sleep?
>
> > +     return -ETIMEDOUT;

Alex, I'm guessing 10ms is what worked for you when testing with the
physical hardware? If it's working fine, I don't think it needs to be
changed.
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-igb_v3_b=
4-v5-0-91503eddb98b@google.com?part=3D5
