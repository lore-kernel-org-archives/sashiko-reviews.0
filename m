Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A653742DFEC
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 22:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674381; cv=none; b=OvOKcOsc0MPpMPgLxw4/YDLB9wgjD0spymy7o7Yc+khPArIq6Fpocyfn0ZxMCpFn+aOeolkmvSQ/+quVKLJH/ND98fFp9NaIewL9TdMMTKQI+vrhMq21Ts0GwvVwWBD/HIZK208s8JL4MTRZebHTdAS68NoxwudUx6l+fJGvPeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674381; c=relaxed/simple;
	bh=yw4T4xIRvUCnDk702V87YEoZjjbvFmk/m73RhFS/xeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTHVlZc25h/jxT3bFuIveLArMiBSJv3X45c9SbE2BxKGC5FGFZWq7EsLb6HT0if8J972Tea2SRWR9LtLQv2dVFFfM6n/2EQbSXVxqVuvOasYIa3BaubJ60ohsHQh4wG2yNm2wVBaGFoXCTBodI87DiUFQV9uvzNUOTvoX3C2AYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XYs/06bL; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XYs/06bL"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceb096e675so121640065ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 15:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784674378; x=1785279178; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JxnUiUKgz45TKm8FkoVsEhaQ0YHdYAICVOBAO5r+zvQ=;
        b=XYs/06bLzeitWb7ClmZ2tkuMKty+duXy/5JyhpBz8O2Hkr5PQkR6KZw75aZF0RFJho
         C+uYdXj2ZLfEVYnmbbMb4cpHR+krT12r32raNDqUvc5RTttTAlC0gchqqfXwA/0YZoz7
         fC8hs5Ue+bdqAhBJVIAR0RPBdzaoT7XHkx+xjB6NmG60Fc1r6txMIMj3i7oU9kZhlxI6
         CB0JXD8myBBH0+bVobff/QU0Qesf/3vwsp6GxOBZAxrZwta7Hu4y1bcQDiRTe9rX00K/
         jjyoc3bLAGM1hLf9WKQn6c+dO+l8ZWHs05zyBd/l1T+oKchsfXrxHABkKTQ9iIR5GLF8
         vFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674378; x=1785279178;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JxnUiUKgz45TKm8FkoVsEhaQ0YHdYAICVOBAO5r+zvQ=;
        b=Vy5JO+wZhp02sXKyGEpbcDBvU6R1V90lAj1uBjXsPC+vxIJJY7/80WhPxUkjcVl6xx
         Ds/Qijj6qW2AocvutCAQVlZATFEwg6HEq8EsOmvxB9UktwoDv9vG6e3MtiZZY19soHOs
         oQ7hDWGKfd8m0mKZUDWb7Hjs8Pa4NNxoyOrGeL12oqgkt5EIE2Q8amZLVlA/K67lHyK/
         qBv2+HzZsryuMpdiI1pIJWDulxQlwcHRePy/g3PYt+UKGwTGCodDOy62sUSFFXHBPMSz
         TOhL0fpnpxH3Dahj3134qtLKSbfqKo+cat1lmU0mh+fS8pNPFiYYBe04oyU3aBaWiyYF
         ccFA==
X-Forwarded-Encrypted: i=1; AHgh+Roz2a/7nnS9/hsYX2OrIy19xiFZt9aD3MFmJLnFI2Eee6vcLwIhtQSaHDgPht50jB5/1Ei+Vl0il9Y6ra+pHzs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwM0NkidKok4jjP6lllfRHQfxAT+aRoIFIoSyaNaNvlBtWZRI4T
	85a9dIIkAfH+n5woqppOUQ7aXxYaKuu9K0YRTaLEiQrDJhXT/0rZ7zn9QxwfnIuRxA==
X-Gm-Gg: AR+sD11aDcf+xsz5ttqoMzxJgsZpvwOuiwIRN3zuWKszGGEVvkQR/8CUI29kcGIZ9iE
	H89XBSXapL3f2JgmhYnOQpvZj4TtSG4Sa023LERZAP9zQbfTEehuFRAANx7ukNhxBVl9hylIEEW
	IBRMKqP+jyCj3M36AbQgyJrtackAhTgBh1AmCInER/kxmOkKTHhkJDY2AGiToA/r7Rr7JrZWxiS
	rnzLtmsCnmrc6owCneDDSmOAnp/r1k9qpz5xm4X+Oh98ndIia4KUtr7LsUPwGL0O9pPQm1S7NUr
	A6UjOGSvnLmO01A80ExM96HKnUL0cubMU7xt/El67NivQqPTF8sdTWC8TJ2esp+pIH6sNHI1Jc+
	4uZRzMichUUFHPjkcdw+IDYj8lxyQ6PRBYwEy+FMXc1IRYy8y7oirFKpyqYBW+S2vCyxRZSgI7/
	b3YMV0+rNioDQ0vONNcKqoaoA89de4mdhJN0uZQy0L
X-Received: by 2002:a17:903:2350:b0:2ce:d5e4:2fcf with SMTP id d9443c01a7336-2cf34a18da5mr220018435ad.42.1784674377389;
        Tue, 21 Jul 2026 15:52:57 -0700 (PDT)
Received: from google.com (79.217.168.34.bc.googleusercontent.com. [34.168.217.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f313287sm3748645ad.58.2026.07.21.15.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:52:56 -0700 (PDT)
Date: Tue, 21 Jul 2026 22:52:53 +0000
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Josh Hilke <jrhilke@google.com>, sashiko-reviews@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [PATCH v5 5/5] vfio: selftests: igb: Recover after DMA-read
 faults
Message-ID: <al_4RXwK0IeV1n7D@google.com>
References: <20260714-igb_v3_b4-v5-0-91503eddb98b@google.com>
 <20260714-igb_v3_b4-v5-5-91503eddb98b@google.com>
 <20260714211204.437281F000E9@smtp.kernel.org>
 <CAAdrzjsNJfkFjwK4Nwendph60=FFhYCbXkXzTXO354roK3GoTQ@mail.gmail.com>
 <20260720154227.1f727abe@nvidia.com>
 <20260720155120.2815e269@shazbot.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720155120.2815e269@shazbot.org>

On 2026-07-20 03:51 PM, Alex Williamson wrote:
> On Mon, 20 Jul 2026 15:42:27 -0600
> Alex Williamson <alex.williamson@nvidia.com> wrote:
> 
> > On Mon, 20 Jul 2026 14:27:12 -0700
> > Josh Hilke <jrhilke@google.com> wrote:
> > 
> > > On Tue, Jul 14, 2026 at 2:12 PM <sashiko-bot@kernel.org> wrote:  
> > > >
> > > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > > - [Medium] Test flakiness due to fixed heuristic delay instead of polling on EAGAIN during VFIO_DEVICE_RESET
> > > > --
> > > >
> > > > --- Patch [5]: [PATCH v5 5/5] vfio: selftests: igb: Recover after DMA-read faults ---
> > > > commit a631c99ce1be37dbbdda0314b730b2c6bd947b50
> > > > Author: Alex Williamson <alex.williamson@nvidia.com>
> > > >
> > > > vfio: selftests: igb: Recover after DMA-read faults
> > > >
> > > > This commit adds recovery logic to the igb selftest when an intentional DMA
> > > > read fault causes the device to hang. It introduces a reset and re-init
> > > > sequence using VFIO_DEVICE_RESET, including a 10ms delay to allow kernel
> > > > error handlers to release the device lock.
> > > >    
> > > > > diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
> > > > > --- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
> > > > > +++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c    
> > > >
> > > > [ ... ]
> > > >    
> > > > > @@ -500,7 +522,28 @@ static int igb_memcpy_wait(struct vfio_pci_device *device)
> > > > >
> > > > >       igb_irq_enable(igb);
> > > > >
> > > > > -     return (status & 1) ? 0 : -ETIMEDOUT;
> > > > > +     if (status & 1)
> > > > > +             return 0;
> > > > > +
> > > > > +     /*
> > > > > +      * The descriptor never completed.  On real 82576 hardware this
> > > > > +      * typically follows a DMA-read fault from one of the intentional
> > > > > +      * unmapped-IOVA tests; the fault leaves the descriptor engine
> > > > > +      * unable to service subsequent valid descriptors.  CTRL.RST alone
> > > > > +      * reinitializes the queue registers but leaves the engine wedged
> > > > > +      * for the current process, so a broader VFIO_DEVICE_RESET (FLR)
> > > > > +      * is required.
> > > > > +      *
> > > > > +      * Delay before requesting reset so PCIe/IOMMU/AER error handling
> > > > > +      * triggered by the just-observed DMA fault can release the device
> > > > > +      * lock VFIO_DEVICE_RESET contends for.  The 10 ms value is
> > > > > +      * heuristic.  The current memcpy still fails with -ETIMEDOUT;
> > > > > +      * recovery only ensures the next memcpy starts from a usable state.
> > > > > +      */
> > > > > +     usleep(10000);
> > > > > +     igb_error_reset_and_reinit(device);    
> > > >
> > > > [Severity: Medium]
> > > > Will this fixed heuristic delay cause test flakiness under heavy load?
> > > >
> > > > If the kernel's PCIe/IOMMU/AER error handling takes longer than 10ms to
> > > > complete (for example, when KASAN or other heavy debugging options are
> > > > enabled), the device lock might still be held.
> > > >
> > > > Looking at the kernel side in drivers/vfio/pci/vfio_pci_core.c:
> > > > vfio_pci_ioctl_reset(), lock contention causes pci_try_reset_function() to
> > > > return -EAGAIN:
> > > >
> > > >         ret = pci_try_reset_function(vdev->pdev);
> > > >         if (__vfio_pci_memory_enabled(vdev))
> > > >                 vfio_pci_dma_buf_move(vdev, false);
> > > >         up_write(&vdev->memory_lock);
> > > >
> > > >         return ret;
> > > >
> > > > Since igb_error_reset_and_reinit() calls vfio_pci_device_reset(), which
> > > > asserts that the ioctl returns 0, would this lock contention cause an
> > > > immediate test suite failure?
> > > >
> > > > Should this code explicitly poll for -EAGAIN from the ioctl instead of
> > > > relying entirely on a fixed sleep?
> > > >    
> > > > > +     return -ETIMEDOUT;    
> > > 
> > > Alex, I'm guessing 10ms is what worked for you when testing with the
> > > physical hardware? If it's working fine, I don't think it needs to be
> > > changed.  
> > 
> > Yes, the delay was found empirically and indeed we could make this more
> > robust if we retried on -EAGAIN.  I'd be in favor of doing that as a
> > follow-up.  Thanks,
> 
> Oh, some further context, vfio_pci_device_reset() asserts the return is
> zero, which IIRC, is why I accepted the heuristic delay rather than
> expand the scope with a new reset callback within the framework.

Let's fix vfio_pci_device_reset() to retry on -EAGAIN. Josh can you apply
something like this on top in v6?

diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
index f50d450d3e94..25cac663de1d 100644
--- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
+++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
@@ -533,14 +533,7 @@ static int igb_memcpy_wait(struct vfio_pci_device *device)
         * reinitializes the queue registers but leaves the engine wedged
         * for the current process, so a broader VFIO_DEVICE_RESET (FLR)
         * is required.
-        *
-        * Delay before requesting reset so PCIe/IOMMU/AER error handling
-        * triggered by the just-observed DMA fault can release the device
-        * lock VFIO_DEVICE_RESET contends for.  The 10 ms value is
-        * heuristic.  The current memcpy still fails with -ETIMEDOUT;
-        * recovery only ensures the next memcpy starts from a usable state.
         */
-       usleep(10000);
        igb_error_reset_and_reinit(device);

        return -ETIMEDOUT;
diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index 2e67afc0d580..27bdf561925f 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -41,6 +41,7 @@ struct vfio_pci_device {
 struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iommu);
 void vfio_pci_device_cleanup(struct vfio_pci_device *device);

+int __vfio_pci_device_reset(struct vfio_pci_device *device);
 void vfio_pci_device_reset(struct vfio_pci_device *device);

 void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index 7b8394d0ac50..45704a2c9485 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -221,9 +221,23 @@ void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
                       write ? "write to" : "read from", config);
 }

+int __vfio_pci_device_reset(struct vfio_pci_device *device)
+{
+       if (ioctl(device->fd, VFIO_DEVICE_RESET))
+               return -errno;
+
+       return 0;
+}
+
 void vfio_pci_device_reset(struct vfio_pci_device *device)
 {
-       ioctl_assert(device->fd, VFIO_DEVICE_RESET, NULL);
+       int r;
+
+       do {
+               r = __vfio_pci_device_reset(device);
+       } while (r == -EAGAIN);
+
+       VFIO_ASSERT_EQ(r, 0, "ioctl(device->fd, VFIO_DEVICE_RESET) failed\n");
 }

 static unsigned int vfio_pci_get_group_from_dev(const char *bdf)

