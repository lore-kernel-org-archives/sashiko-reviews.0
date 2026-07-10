Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F140A395AFC
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 20:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783714861; cv=pass; b=UMO/GtWTdQekUleBGffcDNGJRKhb8j62KeARJ7DqJ7Q/BKXlnXDVS/G6NqXV5eH00QBy9ZEAriiLFGFgtAHgw9g9rXLmTR7LxZdB0g1DVJmpcbGvmbUoS0OlbKHrl+6l2V90zAwQHs12qaJFvFPVcmNlllQNawDQFW3RtwXoc7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783714861; c=relaxed/simple;
	bh=HhZy4i9AMa5naIz0S+3IF++cavkTQiw1Sr1NjePdxUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNeWrNJfCQqipiwI5TS4MEfDrTa/AaU68WzZNbJKwiZIN5uBjY0cR+FhgRlKpKAZ9zIDygwGqMDDXyLNto135q7C/Wn0rDRTX9amd1dZpjxmv6482JBiysUQJ6fOeWw5LgZQmwgf2tShGY1cW+FghvjnlM+6SUojwsUW1DTGYjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CnIUKg82; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CnIUKg82"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b8d99342so1785e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 13:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783714858; cv=none;
        d=google.com; s=arc-20260327;
        b=IenNa8AHwi6Lx2pZ0fdHAfH0tM71x96BCzziFTY6bHx5sOi81h+YIjmRXufay++F0d
         uJAgs9hY6yeOLuFjmlrV3OfBKJPhjbpyjm3bzFrAFxRYNGsB390j6PmpAG+4xxt3u4lm
         dhu9/CiUSg5DWrX0HUq2ZcOZmihHtGh2EhVkHyJLAOChk2qfngMLQMXtsP4WpTm0WgVW
         d/DH9PDxiJUux17jCgVJMIZBQEiPg58ZJ3oGAiWcLrHxclU75O49NKxSfyQ2v2UnZqwY
         Bw7/X3RTRUb8PMjgRY9i/MMmXOzYCFchKGG7OlqDadIKCvBl7OzijFRxkYa4rdz0vnMO
         iL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tkBhvVXb0hd5Otr/cjZP7Js0wsG7Wez2ww0OpDh742M=;
        fh=DhgcVQpaufsfF7eBVoMb3sgMdDsUCiITglua3IGlA0Y=;
        b=SB3Y1hs6wocVGjKNR03cTbmZjwWACVQZsMMVkajHVW5aO6Ps+ifEd0qXL+pAAe0ulZ
         kr4XpHP1s7MyveIDJfQKC/qwLuQUFNQ8jX1eanv9iX3g6Ql+HtpQEoji6TjdMu3KmnA+
         /GrF9wprFZgppJK6dk8QS3S16xOminYzAMws5IueDt7swSHa2MUvV5CAsBkTdy+e3eI8
         X9G7BnRsFtg10T3Wb5jd7ZvB1WeJEAiLcsxNpKwRw09s4tWa4tmXUOi/G9VawB82zxrG
         qB3RveGP4jUnQHWn4vTrx+n8FZkGU+UsAixyfjqtm9de7BdR0OgDu7TRZMbKlhEJ6ZrQ
         Ddyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783714858; x=1784319658; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tkBhvVXb0hd5Otr/cjZP7Js0wsG7Wez2ww0OpDh742M=;
        b=CnIUKg82/g5oQIbCGlODs1n1Tsm80HAzk53GwV5wtVO3TapgFk2f9KiuAHFmMb8pEp
         Irdqh4e90MShEnQ2HT+3nE9fqiACTRDWuuqmSR2gx+OVO0gWgmxv1u973uXtPWSvymqk
         6BbC/mxenwhOv0InFc9C2V5rKLqarEF2BtuRN/Mi6YiNhA/gXQacN0QCIKdR94XhAfu+
         1VA3J/Wn1zCoGNgfSG38oAbPetV9Q61VDmRW/pVmLEQeTRebUypvwAeAUAbe3ZUfK5W5
         StsV/nEQChvuK4muFLpmRqI5bE7pnWl83iyHoYu7f38bibK9s6e8c1iXFpxLpTKxlB6q
         1Xuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783714858; x=1784319658;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tkBhvVXb0hd5Otr/cjZP7Js0wsG7Wez2ww0OpDh742M=;
        b=VBOlhlOY6Qkq/m2sgs4rurecYWaA5RF4Ce3Iq5m4xqdgstN0A7H3VDd+rs6vboeklu
         XZDlClgpyZzoHdJoR44ZZOTGb4rNoEONVO5gR9vsiuK5jHOZppI5ILPJKsHlXPDIiZB/
         dveN61egi87qsMcrm4suqIekAjRK3A91Sy6AWfQtzfzdWb1c/J29ub9dK0m2kEUHJGBS
         Hi2Czg21uwvwehfSGwaqCymB3QUTFeibQwm30Dg0EZvki7qbDqYq0a4iPyKwU3aHT30x
         7PjbSAaSIEN25EvFZClDoW+iYAu2dSDdBs9MgoZU6YiEstMqj50xQq3j8rZpiJ1xCd5w
         vHYA==
X-Forwarded-Encrypted: i=1; AHgh+RrGlB4XKjbVu3Lxiq9VIBsDflUizqlLCk2BIew+2qD7mxekLrFRfTB4c3HVPfcpW7MZOklu8XANsI1yn9um4Ig=@lists.linux.dev
X-Gm-Message-State: AOJu0YxaTMQR+lpf+vtBB5dJKJfczj7FDqRQBK2KQs4CKDHjyM402itK
	Qyf63Xz5SBGe7XxzOY/rcL4twrAgbRJ0GKzlujv0Sz4OdrPRuDi+O3hVYMwjwfe9Ni/SCmu6V2p
	eT/h2k5g+3QoqQhFUpT+GU864m2UNNXoCNDFse2Bc
X-Gm-Gg: AfdE7clLCpUw6ChxpfGVi6HvxtKx1KG7OoxUSog3+mnLmzpiGvBIWT8kRtGlp8q2Y+O
	GY+533sdLgXkPdUxIs9Eb4o9MYQRuKRpMbGhpfncmFqpTuUky4ZeflhkC7U7gfJFdZmpzZYPayU
	e3/lhps+vT0BCY5gfYXMYK+se0dF918fYRHdVj1JeZO72/3g8tElIRU9mxa+oPPNSaEJHd+csmE
	CyKJKiNMzKjvnOQehvKZzG3fhf8bp94Hv41Q4Z4OKtGCAC+Hvay/30f4loMkATnxmStFtGpcad4
	GpJoqr5B2/GWGpCEJzAGitmMyLG1oDP+a0lu2nfh1jSpdHPfLHVvSDk46iui0fl8plU=
X-Received: by 2002:a05:600c:acd:b0:493:aed4:8d03 with SMTP id
 5b1f17b1804b1-493f8cc96d9mr46995e9.9.1783714857850; Fri, 10 Jul 2026 13:20:57
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703080922.1838362-1-shoubaineng@gmail.com>
 <20260710105740.3080070-1-shoubaineng@gmail.com> <20260710110645.079DC1F000E9@smtp.kernel.org>
In-Reply-To: <20260710110645.079DC1F000E9@smtp.kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 10 Jul 2026 13:20:45 -0700
X-Gm-Features: AUfX_mypyPGgExDDJXAywI8JQ2oLCreBAwcnKgV8wHGRnZ462d4mBALgKCvqqyQ
Message-ID: <CABdmKX2xt6diYwCs32E7HNL8ULepDfrDQ20iB+HVw5o-pCd0xg@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: dma-heap: don't publish fd before
 copy_to_user() succeeds
To: gaoxiang17@xiaomi.com
Cc: Baineng Shou <shoubaineng@gmail.com>, dri-devel@lists.freedesktop.org, 
	sashiko-reviews@lists.linux.dev, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Sandeep Patil <sspatil@android.com>, "Andrew F . Davis" <afd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 4:06=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Bypassing the standard dma_buf_fd() API skips the emission of =
the trace_dma_buf_fd tracepoint.
> --
>
> --- Patch [1]: [PATCH v2] dma-buf: dma-heap: don't publish fd before copy=
_to_user() succeeds ---
> commit 869904722955c74d0c6e8c974d3c64c6befabac6
> Author: Baineng Shou <shoubaineng@gmail.com>
>
> dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
>
> This commit restructures DMA_HEAP_IOCTL_ALLOC to delay publishing the
> file descriptor until after copy_to_user() succeeds. It open-codes the
> fd allocation and installation steps instead of using dma_buf_fd() to
> prevent an fd leak on copy_to_user() failure.
>
> Link: https://lore.kernel.org/dri-devel/175e98de-f414-47d7-81c1-c0fe0a8f7=
f62@amd.com/
>
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 3937dd41bb0f6..983dee947c851 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> [ ... ]
> > @@ -175,15 +162,28 @@ static long dma_heap_ioctl(struct file *file, uns=
igned int ucmd,
> >
> >       switch (kcmd) {
> >       case DMA_HEAP_IOCTL_ALLOC:
> > -             ret =3D dma_heap_ioctl_allocate(file, kdata);
> > +             dmabuf =3D dma_heap_ioctl_allocate(file, kdata);
> > +
> > +             if (IS_ERR(dmabuf)) {
> > +                     ret =3D PTR_ERR(dmabuf);
> > +                     break;
> > +             }
> > +
> > +             fd =3D ((struct dma_heap_allocation_data *)kdata)->fd;
> > +             if (copy_to_user((void __user *)arg, kdata, out_size) !=
=3D 0) {
> > +                     put_unused_fd(fd);
> > +                     dma_buf_put(dmabuf);
> > +                     ret =3D -EFAULT;
> > +             } else {
> > +                     fd_install(fd, dmabuf->file);
>
> [Severity: Medium]
> By open-coding the fd reservation and installation here instead of using
> dma_buf_fd(), does this skip the emission of the trace_dma_buf_fd tracepo=
int?
>
> If so, observability tools, BPF scripts, and perf tracing relying on
> trace_dma_buf_fd to map dmabufs to file descriptors will silently miss al=
l
> allocations originating from the dma-heap subsystem.

Hi Xiang Gao,

It looks like this change in its current form breaks the export
tracing that you introduced. It looks fixable by adding a call to
DMA_BUF_TRACE in after copy_to_user in dma_heap_ioctl. However I'm
wondering if you're aware of the dmabuf iterator that traverses the
dmabuf_list? I've backported it to 5.10, so it's available on all our
kernels: https://r.android.com/q/Iaeda328f7693acc1506269c12cac5e7955e5c091
Someone else from Xiaomi even helped with the 6.12 backport. So I
guess I'm wondering if the dmabuf iterator would work for you instead
of the tracepoints.

Thanks,
T.J.

> > +             }
> > +
> >               break;
> >       default:
> >               ret =3D -ENOTTY;
> >               goto err;
> >       }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710105740.30=
80070-1-shoubaineng@gmail.com?part=3D1
