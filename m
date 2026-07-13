Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE693769FE
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 23:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985624; cv=pass; b=kV5jkN5OQKqiT/gxWAJwG0kSd7v2VrwVXNWUhxNGkZSQtz/khpMArL9YXaQg9mFD2UvIkDYAPw7S6LW6EtNrHGmcqm+B7Wwmmwo6TOw4ccTCScnQANIii5imxVDI/OxMPzB+d3TkGb/KxzojvIRh7Lky31Wu3mycijfFT1jEao8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985624; c=relaxed/simple;
	bh=hZrF5S3QhBMdU5APU243gVlQHnhbvgo7HqGiIL7AAh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sT5GN0usGfSGLwV3IOrnzrJ1CTCxcbwOfu0sdUpkgUPgJh28W53Hjp5XyPDUYpFGMHnmZNVsrdMMsjMuDiZyxiLSLawCvzraY6moTlk/GLJbnRQzNdXaNwkJuuUzJz72cbjRlX/d0smFfHZXC7VypOIPCPtx0Scdx3hmV2gZaRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GKuGEBpF; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GKuGEBpF"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c556ada3so24545e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 16:33:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783985621; cv=none;
        d=google.com; s=arc-20260327;
        b=PmIwondOiTFHSmo7burqV6dUcE1JeujKxS1WAYVBLElTFR+Zj+GgMIVczCMzluJBZm
         WO7ZfjDtAKXB8S3MK72rIRiLW7I4pkx8esSts6qmIR22a4VDXWuMO+KbQXs8cxMZsC4P
         eFCTlx0N564fdqibL3cuw0zuDMPkIeamlgIgVBmxQBK8dXcd8PV2AE1ikfYIX8IPb4iv
         oht0ExkUtA9Z6GSl0simvkwailowiDjdKuccb1TyU6w5vUiq6YBSZnUxDiqB2QwMeYIH
         dugzISrEL8/+UD5OmymktFUj7Dwwnta+KPRMtlP+AwONJtwt1UX5psBxlY9ZAAhCSMM9
         dfZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MhJXcRMH8N66F7+XzpKxCwXc3ej7YKBd+Nc2fID/XdY=;
        fh=/cDIxB4Vcf19YVslA4yoBQlqdvfSx8wwTom34ErAjxc=;
        b=blxDr2TWk+J5PAMHzo+qfF887YkXscLNnHuVBbOsH1lOX4ha9wlHlMjheCywhuFj/8
         cYtnfPhUbH0OiOOmSruZqROcFTOYBy5SNPXsyCmyFroHvDcJMMGhkU4IQjxb8p1ml/y0
         6S5jynZ40gocJc4wIkTDq57MgVj/0JTbzEZfVcZ1GzcNNfPxGTPFdmEOjbFCCqMRKLvd
         zvKnGGgKTV8nvnjHdK8lvmN09OHxmhHfaKdaivRE9KG4YGrRNgRA5FsXW9UhuF3O61Ch
         hzMmSnxvp48Ru7Z08CoOwvsj5BsH6fTu890fjyAJ8rhvZFpUNNVhaD76gfZgE1OSfZhJ
         xgAA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783985621; x=1784590421; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MhJXcRMH8N66F7+XzpKxCwXc3ej7YKBd+Nc2fID/XdY=;
        b=GKuGEBpFhZpiYBGc8G1krUGRlkpGZUEk5XuGf0ORmOnYr//bHm8ncdzAUNKXYJStou
         PiT6/FrZyZBdjo3AW6iXFY6ZsVs9hIG3Tk+VjH1CSostxzALxSwkK2snw2i0eGryEURj
         1HZpTU4WU3CXzSBu+L9L7H+FceEtXmuu9TtIWz+3ELCl/VVjNdBc0tre7C2nWoU+nTk/
         sVALxVSN5sUG15Hx8QHcbIdXwt6TfegKzVhjkcXU9C2+cU55/2WBD6QegjL0K4En+/GX
         W/g2VkcP/Vb5pUtjwatDBlY7rpocXxGaQNtmnZYhLxoEpL6D+wNXIG02b6yqUvNFGyW6
         Jppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783985621; x=1784590421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MhJXcRMH8N66F7+XzpKxCwXc3ej7YKBd+Nc2fID/XdY=;
        b=A393VIPAvnQ/4WhFIEBDonyRLx3EPTcqKs1KSb3FbOI+18YjrtZQnTNHf/JAaTK2Hd
         qQCtZ70J12GDtnySiAmRxlBHV0CxAF32zcjTi2bcUk8g41Zbv35bwQnGBfwv8aNTHEEa
         RvVkBhHrURsx1Ckod49wNDjRaK0S8C6dRWY+ThbGhNumwTsl4h6HDN16svJHrpwwyEpx
         lNag/ktUDs0JIIeHJqGqtDAX+A4IvdgyNZvhFxIsD9i9yEEN4ynyJ2nbMUARLPneETxh
         Rwk6UWJZbMi6fMXvNWQMsE/NZF2od2cGbjoMtLP+qbZVdArpD2DwqsVkbxgk0YRkfjdY
         cBbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFZY2EqYW5blt09tHr58B2ocNoAplEpmpmFnykUwe+AYbPnq3b2yU7/ccSNy80TblvKWRY2zoj5D3/lyANjIg=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywse4DgkVRRz1JoJ4FRfCyKpxDsjgcTgMA4Vah77xlS8abbAa+v
	2xR9Jt8MPN8Wpi5VMDhGzmaSo6mm59f8AVI3MAQpK+BLumPnsNrXGr1rt72TabPC//EaEHW0mPi
	h91BmKoKnW9x9dERFAMSBADmCz2snX2DE76OJwYGN
X-Gm-Gg: AfdE7clSS6m8oIBaH6zlanJ/X1Jpk64093EfyC5NpRzQUxEy1DmI0QM5XQ23b/a+oex
	AJ4DVMw+IzfB0OaIvY5SLHWk8ESqN/7UqKVz8qaNho/GeYaqLFVQOv6OIAzr1Gs+i/8NSy+xOAV
	+0MiudxibKxqEVCoO/FZGLahR25NzORsQlcIN0/KJajfbqvYT9yhSdfZLysBpzXUR8l7nds35s0
	7A+4QZAFcn+lzxg8j9Gdul72sm0xjZhMPDCDR3bL5VkcW3PiDweUomUNab0bIcXUG9ToXq1pO0k
	7BvxwPvzqpuBAPUIB7VICjAyqnA=
X-Received: by 2002:a05:600c:b48:b0:490:b2ae:44ca with SMTP id
 5b1f17b1804b1-4946215449cmr864595e9.5.1783985620885; Mon, 13 Jul 2026
 16:33:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703080922.1838362-1-shoubaineng@gmail.com>
 <20260710105740.3080070-1-shoubaineng@gmail.com> <20260710110645.079DC1F000E9@smtp.kernel.org>
 <CABdmKX2xt6diYwCs32E7HNL8ULepDfrDQ20iB+HVw5o-pCd0xg@mail.gmail.com> <CAGCp47yZ4fWbuAg7HPPS0bknaTk88dPOVfCzc8J+H7-u4wM7bQ@mail.gmail.com>
In-Reply-To: <CAGCp47yZ4fWbuAg7HPPS0bknaTk88dPOVfCzc8J+H7-u4wM7bQ@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 13 Jul 2026 16:33:29 -0700
X-Gm-Features: AUfX_my0yOr8TW87vRlRgOFPapFZNgD4NX0kk5EWNSKtxsDMxsrk5E5tdSr98o8
Message-ID: <CABdmKX21NHc2=9Sk2F-BFpu6is0vTg-QXLE+wiFNEPdsWWjvog@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: dma-heap: don't publish fd before
 copy_to_user() succeeds
To: =?UTF-8?B?5a+/5p+P6IO9?= <shoubaineng@gmail.com>
Cc: gaoxiang17@xiaomi.com, dri-devel@lists.freedesktop.org, 
	sashiko-reviews@lists.linux.dev, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Sandeep Patil <sspatil@android.com>, 
	"Andrew F . Davis" <afd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 9:18=E2=80=AFPM =E5=AF=BF=E6=9F=8F=E8=83=BD <shouba=
ineng@gmail.com> wrote:
>
> Hi T.J.,
>
> Thanks for the review.
>
> You are right, the export tracing was inadvertently lost when splitting
> dma_buf_fd() apart. I've fixed it in v3 by introducing a new
> dma_buf_fd_install() helper in dma-buf.c that wraps the DMA_BUF_TRACE
> call together with fd_install(), and using that in dma-heap.c instead
> of a bare fd_install(). The trace event fires after copy_to_user()
> succeeds, just before the fd becomes visible to userspace =E2=80=94 the s=
ame
> observable moment as before.
>
>
> Baineng

Thanks Baineng, that LGTM.  Please have my RB:
Reviewed-by: T.J. Mercier <tjmercier@google.com>

You'll probably want to resend this with a "[PATCH v3]" subject though.

Originally I wasn't sure if we really needed dma_buf_fd_install
exported, but I looked around and see that fastrpc_dmabuf_alloc
(drivers/misc/fastrpc.c), gntdev_ioctl_dmabuf_exp_from_refs
(drivers/xen/gntdev-dmabuf.c), and I think video_usercopy
(drivers/media/v4l2-core/v4l2-ioctl.c) also suffer from this same
problem. Want to take a stab at those too? :)

-T.J.


>
> T.J. Mercier <tjmercier@google.com> =E4=BA=8E2026=E5=B9=B47=E6=9C=8811=E6=
=97=A5=E5=91=A8=E5=85=AD 04:20=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Fri, Jul 10, 2026 at 4:06=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>> >
>> > Thank you for your contribution! Sashiko AI review found 1 potential i=
ssue(s) to consider:
>> > - [Medium] Bypassing the standard dma_buf_fd() API skips the emission =
of the trace_dma_buf_fd tracepoint.
>> > --
>> >
>> > --- Patch [1]: [PATCH v2] dma-buf: dma-heap: don't publish fd before c=
opy_to_user() succeeds ---
>> > commit 869904722955c74d0c6e8c974d3c64c6befabac6
>> > Author: Baineng Shou <shoubaineng@gmail.com>
>> >
>> > dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
>> >
>> > This commit restructures DMA_HEAP_IOCTL_ALLOC to delay publishing the
>> > file descriptor until after copy_to_user() succeeds. It open-codes the
>> > fd allocation and installation steps instead of using dma_buf_fd() to
>> > prevent an fd leak on copy_to_user() failure.
>> >
>> > Link: https://lore.kernel.org/dri-devel/175e98de-f414-47d7-81c1-c0fe0a=
8f7f62@amd.com/
>> >
>> > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
>> > > index 3937dd41bb0f6..983dee947c851 100644
>> > > --- a/drivers/dma-buf/dma-heap.c
>> > > +++ b/drivers/dma-buf/dma-heap.c
>> > [ ... ]
>> > > @@ -175,15 +162,28 @@ static long dma_heap_ioctl(struct file *file, =
unsigned int ucmd,
>> > >
>> > >       switch (kcmd) {
>> > >       case DMA_HEAP_IOCTL_ALLOC:
>> > > -             ret =3D dma_heap_ioctl_allocate(file, kdata);
>> > > +             dmabuf =3D dma_heap_ioctl_allocate(file, kdata);
>> > > +
>> > > +             if (IS_ERR(dmabuf)) {
>> > > +                     ret =3D PTR_ERR(dmabuf);
>> > > +                     break;
>> > > +             }
>> > > +
>> > > +             fd =3D ((struct dma_heap_allocation_data *)kdata)->fd;
>> > > +             if (copy_to_user((void __user *)arg, kdata, out_size) =
!=3D 0) {
>> > > +                     put_unused_fd(fd);
>> > > +                     dma_buf_put(dmabuf);
>> > > +                     ret =3D -EFAULT;
>> > > +             } else {
>> > > +                     fd_install(fd, dmabuf->file);
>> >
>> > [Severity: Medium]
>> > By open-coding the fd reservation and installation here instead of usi=
ng
>> > dma_buf_fd(), does this skip the emission of the trace_dma_buf_fd trac=
epoint?
>> >
>> > If so, observability tools, BPF scripts, and perf tracing relying on
>> > trace_dma_buf_fd to map dmabufs to file descriptors will silently miss=
 all
>> > allocations originating from the dma-heap subsystem.
>>
>> Hi Xiang Gao,
>>
>> It looks like this change in its current form breaks the export
>> tracing that you introduced. It looks fixable by adding a call to
>> DMA_BUF_TRACE in after copy_to_user in dma_heap_ioctl. However I'm
>> wondering if you're aware of the dmabuf iterator that traverses the
>> dmabuf_list? I've backported it to 5.10, so it's available on all our
>> kernels: https://r.android.com/q/Iaeda328f7693acc1506269c12cac5e7955e5c0=
91
>> Someone else from Xiaomi even helped with the 6.12 backport. So I
>> guess I'm wondering if the dmabuf iterator would work for you instead
>> of the tracepoints.
>>
>> Thanks,
>> T.J.
>>
>> > > +             }
>> > > +
>> > >               break;
>> > >       default:
>> > >               ret =3D -ENOTTY;
>> > >               goto err;
>> > >       }
>> >
>> > --
>> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710105740=
.3080070-1-shoubaineng@gmail.com?part=3D1
