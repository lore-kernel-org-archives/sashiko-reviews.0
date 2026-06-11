Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC072175A7E
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 23:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781218960; cv=fail; b=jXTLBbHLAHbWX1hySerHWRK9aB3vHhAlrff84pQ99P+h/S8IRlKr0RmTb6uaM2r3PzfSVNjobmbFlVITdjPOIsbta64h+RFNqKEtzwnjeK5eUnvcbLsEXDWXKHHHQ6tRK6rCxZFoAcEYenUX6VeRmQmcmIom9AUNU9HS4YpzT/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781218960; c=relaxed/simple;
	bh=KmwjCJkcGhr9SpyfvITozRaH7etw0dkoyx0aMoQc8E4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+9On4AIn7Ic1sXXvf/co5Vd51qFRadJnnGvBev4sck97vwPnTWhuQr98zDtAypiRXXkO0NdPonwg6bsQHIeCUGYBcosII5lbsMjuqdXzN9ScDalfiF2hPoxkBuuV6dZ8eYas9WcFi1lGyKCWulXKS5yX17lRr/4njnS70tklrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=md1FMUhb; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="md1FMUhb"
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BLxADI2912596
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 16:02:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=ob92Tq2R57wAiMWenfqpV0H25NaZcFwlwctuc69C3Js=; b=md1FMUhbMLo8
	Fh894GG//O50My3HeLIl+N1moRtgU28J41XgC7IeNjtkXzdqb3Q4pJbloUb0sI57
	9jVz7NnQpwJ5bDPV4npoEbwYzhg4rgAl9HiKES6OFpGviFE4XpNWf6+El9J9dJ7B
	Yo/EOv0vO3lg0CKH0IeKIWviH2o6Ji1sS4icJbrVsodYNItHLNAjRW6ZraJMViyk
	n/FyvaceZSOsCn5SwSysZB4DgzxdCuNLNoHpkBe5q1vDh++JPpSH4eLPJhsKjRSE
	bq0UWdRUpM7b1KbePNQSfzI9YgeqCUP1xW5dgvSck3N00OzgCLYF3SsitjHsc7bI
	ag85db8yRw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4eqe7uha2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 16:02:38 -0700 (PDT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6db540d17so813940a34.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 16:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781218957; cv=none;
        d=google.com; s=arc-20240605;
        b=gadTKvrVvyIwo89qvjZNjOA5OVyas5Qg/fDGVou8e7A9pALhZwKXEDp3utbL12UGE7
         6JQuim/sPpnS3+hSCoP5yfBkEd6O4uZO+Tm2F5kzl4q5jF50vabitS6+UhSjkYMBlRSR
         Z9v20eXOxXdMGwUZKU5EZ2JzWE53psUoiTm2IKLtjwAk/yLbBcwn2CVBbVwHD2JaDlfZ
         g38rzCEfM3NLMcGti9xcWZSDuLQv1SLpeWhX4QqYXrUdNM6Iztecc/QlrQ/w+IZpPGMJ
         CVlNjUfrq8NYXYuqgCxkA5La3kH38ibNCICeGY1nf7VgrgSEkk53z+0OJOK17tQmtpHO
         vX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=WY5Yrlv2Sc7Wnv9jSySuWH/Jl8+9GO4Ig0Gi7133UjE=;
        fh=sImXpcRDPx5U58yDC/2Ri7tG8zC0m2k+SZgE0QR0TMU=;
        b=KxPkuk7pJBovK4xG68zukXQ4sX5BpKMLM9rZ4Pr+pEJ1QciBLou3vkVdRrUZxhGQM6
         vZMdyGCy1Rj/9BPtRrkm0wKrzHGz4TwDZH3f343esp/WpCB1mjtXCBpGxmpasDO04eU+
         esWa/MmqDMpzce0uDdry2GzSwen5QbBLSCOzyA29LoykNrVifUXGuo2POxPDsbrCdvbh
         Ab6L9NBzY5wOX7Uvh96UhIceNDBR5+YyXYhU3K1CAaXvvwdtfFyqYTzAdcAlQRa/QUO2
         Dd4yzzWZ1WQeZuzC+D6uI8p9V4Nd4KQR1oGloeg8F+fLRoI/w2cU2xuO/AtPs3i0tKVB
         85JQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781218957; x=1781823757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WY5Yrlv2Sc7Wnv9jSySuWH/Jl8+9GO4Ig0Gi7133UjE=;
        b=GDOxUwLsbQcB0FAfKIhSTYgPKdrHE1oR3bFASJQlUgkqxc9bLadEEwFsIR424aenxv
         LLDWr521ee0dTnsruQ59t6Zi8NsMHJoCkx6qyU8Ez4O4qv7WvOsEanI8QZ/V7/l3xIm6
         JBg0xS8/m8rya89r8KqlGU9F8xledJvew/yNcTPXksIWJ8FQWLNcFhZdYvVvvqrvjYSD
         AIY0maEUq9cF7O647uQ1PXa6hvo+Yw2o4vnVlVkQuIARu0UqkH4Sv26T4DnGD0AcwSG2
         uqjknoQo1606WTlP8zuvm5WnST7lQGPtMxOOxRWrqcXrWZrLe9SM5bIQlHLrf94l/UuJ
         g8Bg==
X-Gm-Message-State: AOJu0YwdM7ogvTlR3uJ0aT2T0fb4CPb4Tr3EYmwlikKEiNcOvcMpJ5Yx
	ChY5WZPZgeIJT7emKsRk90tsQQBxK4vN9T58efMWVjIMZGUxumOAdQ9i9t8tcZbb+a8MyGtTHml
	hR0+qWZJ4uprLHwIDbcv+tq4rX9lteZBL2Hjkg/wLljYZ05TDcznE05RjsjimQmMPrV6NxK5u38
	LXkfA7N5oTjuIfkdZ7dd7hZGGZEuuiJRqRSXP0WgHRJSWnh/WfRW2+3Q==
X-Gm-Gg: Acq92OGKU8RnG9O/j8nfZGOA6fi8QJEV//yr3jsmVlxb2uxN/mUKApi6uRXCbVUrfXE
	Bl0vaPZaerXgynhHRTwd5Zl7IB6HGBo6t2AxKaF8k4Tci5yLVi9CFL9FnEg0PqKNb/1W65I5Klv
	807VlMXkLdRLa2gwhrfJsXZSHTAtOtLHMiFbjeadEOD1tk0VA7nc7FQWQ735Izcd0QDzfi62xYr
	G3x1c4U9Hd1/S3Our6e4g==
X-Received: by 2002:a05:6830:4411:b0:7dc:cd0b:58bc with SMTP id 46e09a7af769-7e78473e9a9mr114903a34.7.1781218957176;
        Thu, 11 Jun 2026 16:02:37 -0700 (PDT)
X-Received: by 2002:a05:6830:4411:b0:7dc:cd0b:58bc with SMTP id
 46e09a7af769-7e78473e9a9mr114839a34.7.1781218956672; Thu, 11 Jun 2026
 16:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610193158.2614209-5-zhipingz@meta.com> <20260611202555.B0FE31F000E9@smtp.kernel.org>
In-Reply-To: <20260611202555.B0FE31F000E9@smtp.kernel.org>
From: Zhiping Zhang <zhipingz@meta.com>
Date: Thu, 11 Jun 2026 16:02:25 -0700
X-Gm-Features: AVVi8CelQJPHsRb_TsddVOxCGdtZJzAKJ67zmwHKr7MIkmqZ8rgse99DfYGSmhU
Message-ID: <CAH3zFs3FjiCfOceVRin0ytKNdZ7Pgyv4ds=Dd_GhrRC_XcbNOg@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] vfio/pci: implement get_tph and DMA_BUF_TPH feature
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, kvm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIzMSBTYWx0ZWRfXx2r6/dDlUcL5
 cpJxyqPGniz5A45NVIfatsueLJPo3d02qENwrQMhmV6T/S3zWdgsQc5p/XBkUxg81AITHAg737i
 LIWkMD5j2cNfpirWqfGQX4IEovHoH/0=
X-Authority-Analysis: v=2.4 cv=UK/t2ify c=1 sm=1 tr=0 ts=6a2b3e8e cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22
 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=vvh9Qk1aVFpNxidmG9UA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: ahGKTZI5eFPxX9PrryTgO4mKHzvdv8kt
X-Proofpoint-ORIG-GUID: ahGKTZI5eFPxX9PrryTgO4mKHzvdv8kt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIzMSBTYWx0ZWRfX/kaXBCv74oFs
 bbJiO/8+90XL1IEjFRl6yGD5yVPoUIIMiYXMuKcRUnkggMGtjljTK7pxHJjuxfHw1qzUOfcrRt8
 mVdoFWTFOMKLSbsUWe1SjABZW67E7NfgyWgtntMhBx6nVX/mwZE1X+qj2emCJhh2MfVjdeUw7mJ
 6f8OrhX4o78c6wDUSoZOHuGzXYuNg/yH4Div+UKZcA75OWM++Nayfw/DPxyOUOLXPccVeNdP9b9
 7b0wCE5BlrHl5o7YzQlLJ/YcUXdjT1cY70seriy97RN19JYNrTkIEcP3Q7GRDVsyniv5CMFlXi6
 w7Dpfo7lIRkuTMyKl68exMLexaLrOgMywO5LQufBYNpikxkbzBVFnMgSRfQ5HqVPmu1TDKJrb26
 CkAuh6h4VrHoVLNEctcA1wOySovdbMvXIMDGauz2OlNso5DHJcXB1fdIDiK89dq/4DeM3nQYgrA
 OSMSvpuOi5EypncK7rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01

On Thu, Jun 11, 2026 at 1:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> >
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Unconditional validation of the flag-gated 'ph' parameter can =
lead to spurious -EINVAL errors, breaking the syscall trust boundary.
> - [Medium] VFIO_DEVICE_FEATURE_PROBE falsely reports that VFIO_DEVICE_FEA=
TURE_DMA_BUF_TPH is supported even if the hardware lacks TPH support.
> --
>
> commit d57637d667ca6dc95def77a0a5bd339d62d4f506
> Author: Zhiping Zhang <zhipingz@meta.com>
>
> vfio/pci: implement get_tph and DMA_BUF_TPH feature
>
> This commit implements dma-buf get_tph for vfio-pci exported dma-bufs and
> adds the VFIO_DEVICE_FEATURE_DMA_BUF_TPH feature. This allows userspace to
> publish TPH metadata for a VFIO-owned device. It checks completer support
> and protects the metadata under dmabuf->resv.
>
> > diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio=
_pci_dmabuf.c
> > index 1a177ce7de546..0a0705c8dbea6 100644
> > --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> > +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
>
> [ ... ]
>
> > @@ -333,6 +360,71 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_=
core_device *vdev, u32 flags,
> >       return ret;
> >  }
> >
> > +int vfio_pci_core_feature_dma_buf_tph(struct vfio_pci_core_device *vde=
v,
> > +                                   u32 flags,
> > +                                   struct vfio_device_feature_dma_buf_=
tph __user *arg,
> > +                                   size_t argsz)
> > +{
> > +     struct vfio_device_feature_dma_buf_tph set_tph;
> > +     struct vfio_pci_dma_buf *priv;
> > +     struct dma_buf *dmabuf;
> > +     u8 comp;
> > +     int ret;
> > +
> > +     ret =3D vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_SET,
> > +                              sizeof(set_tph));
> > +     if (ret !=3D 1)
> > +             return ret;
>
> [Severity: Medium]
> vfio_check_feature() returns 0 for VFIO_DEVICE_FEATURE_PROBE, causing an
> early return of success.
>
> Should the hardware capability check (pcie_tph_completer_type) occur befo=
re
> checking the feature flags, to avoid falsely reporting that the feature is
> supported on devices that lack TPH?
>

Will fix it with a change like below:
 -     if (ret !=3D 1)
+     if (ret !=3D 1) {
+             if (ret =3D=3D 0 &&
+                 pcie_tph_completer_type(vdev->pdev) =3D=3D
+                     PCI_EXP_DEVCAP2_TPH_COMP_NONE)
+                     return -EOPNOTSUPP;
                return ret;
+     }

> > +
> > +     if (copy_from_user(&set_tph, arg, sizeof(set_tph)))
> > +             return -EFAULT;
> > +
> > +     if (set_tph.flags & ~(VFIO_DMA_BUF_TPH_ST | VFIO_DMA_BUF_TPH_ST_E=
XT))
> > +             return -EINVAL;
> > +
> > +     if (set_tph.ph & ~0x3)
> > +             return -EINVAL;
>
> [Severity: Medium]
> When userspace clears the TPH metadata by passing flags =3D=3D 0, is it r=
equired
> to zero-fill the unused ph field?
>

Not an issue.
