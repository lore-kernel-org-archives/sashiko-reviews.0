Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BF3212566
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 16:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779725779; cv=pass; b=Q5shivPv4ksILRTJ2hQjntJ8Dur4NUwMMfsrAtwpc5F53ADOinE2TUFw4s4A82LXHKvNVf4bLB4OomMq3hcUrKar58VNXcXzKvYEGwn+r1fN6HtB/bnJ75eM0TzOuim067gcQfcWQDw+OwFKCXn24LU2SEIN5URLPq7pZGqh81Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779725779; c=relaxed/simple;
	bh=vk+6eDvwIl07903w3YMl6z5OxqgLvPImTgb/9qmFn54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dLSsOeYKkwezX0tVCg5xuCT1MXXomueTxcbhJLcZw4wJNbMtfHsu80EtAh5RLpg+ixuSKG8pokfgZmnBAc/Xsuw/MLN8DYgXeSbkNrDjK+bTkfo8G8+eMoXO59yyA6X4RKBYMXMlQwd0NTqqyQjLwCeRcV889FZglZpmd91K9Us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmN3wIj0; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmN3wIj0"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67cac5ece75so17686317a12.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 09:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779725776; cv=none;
        d=google.com; s=arc-20240605;
        b=jBPgucbmrSFgcoLZ5AuOlYHHHjav6RTFu9vzXeD4U2RCy/FqK0vtOPpa/AQD1RTXHT
         HIg2TDXLeNidUbpkWWrKisXwKY0bqWRuuDr+idYKfxExvCG2UmUvb42ic0uxyiN5Qk60
         UZOSXkCTqGC33wb28I8Xn2KucyX8Km73fHolAx8NYdvdsghxpMWJ6zig1kheHVqWYZ/r
         BRKeBEhw08VV1gvSNRof4j/h5XJ3ZteerfhP63wMEZ3BGCnyft+Z+TT4MKJLnj4A5tnM
         TGhc8qdHtBfmyirHKIqtkr6XiBIAGMYsva13Y+08HTHU7Ixn3Rqe7uRr3o5xaJK9+JkA
         xdVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8/SOUgIW+PBGWqgmJXDGl03TtxW7cgumZ0tCc+7Z14k=;
        fh=ouXvSjf5SmEmNeimx6xyG+CKjdQvC3UxbsGBNR8v92o=;
        b=lqXG27vmWXA62hbvprYcbP94JFFsI/h3JHd3LIRnxVb5zLLWT9pN2hruaff5V8MhAk
         sC0G5qPR2N1NoMwdAoebaRo2NeTunLd+Ft2jATsf5pCCGrvZgE9UOUQt1KUh0IqSUClf
         WYe0vbBWrh+8Y9aJgX9QNL8QAlFheOKXQPU7N0V3sGmkiC4enatFdsIMdaU9uaxYccer
         uXWzli9V2MZEXtB2h2wt5WVdMwb8J7SdTIJwjX+SJytzikEdXUvepZ/vd3OBzgqNNQ/4
         wg4v1BxCXx7JklGqPbloQQ5WUtsb29OGgm6b2oAQxJCeqYAthSeSNg4Ks/kJYH5nRDEo
         AfYw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779725776; x=1780330576; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/SOUgIW+PBGWqgmJXDGl03TtxW7cgumZ0tCc+7Z14k=;
        b=nmN3wIj0jePbVhV3L7ySlL0oa3D7yi9IzPRXUZemQcwjflI7578kk5u1WTWGM/8FI5
         tZXHFQMrmSZIeyPDXbaPSAnTWbJQKec+ysqLolgnemRvyfpM95AmTTJvXt0hSpcR9cEX
         G5tISIUazfaqTb+0Lgk6H7CHyxH10fL5WEJpis4bm2fYyFTN8iVn+I6RpqLplN6dvEJv
         DSmtXbEQQO8f2kalVfpDWWIGpA9PExBsIC0FnfhlHf/TvjFje0l3AiAkewD115ObtMIh
         Q/f8bbpyNtBi3DD6cKI7SyiM+fw0sfH5B+hfKR5d8393WJ8fOvWBgMoO4dEME6LKU9Ed
         UQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779725776; x=1780330576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8/SOUgIW+PBGWqgmJXDGl03TtxW7cgumZ0tCc+7Z14k=;
        b=e8Nti8wDRupOI5WzUApcoQWvPZliYn4pGY+fYSb6/I2sB9vXGZBK1xfFl6LoOw6ZQt
         EZ9XQE2sGKRiXmDuatH8BMi+YynsbBcHeZPLSRNDP4EC+kIg1GEQ7xcMCxL8F+eiZztQ
         hceo8FEmi6sqqooFyk7N4ML+A7RdvT/6c+gGoyVYi4+pCNpkGBwrrw+eOqU6ex++94df
         0+UDckqsJ/NZS5eNeSoLYJEh9KJJzwdFj9f7kh/oG9wGVKu4qrPLu9uT4WRSv+UWpGez
         m8WxrpI6LbDIQnvfw2+OoCM/J1Ag3+zvLw+X0Lf1YQvhzPDwFlHFngjW7QpYGmvUhU/h
         dsnA==
X-Gm-Message-State: AOJu0YzW83+y43zT6YD0MCSwopLdbFD9JUZvo2thbY+bnoM3aXzObBk9
	jVfOf9BSsrxH245ZdsJOKrS7GSi0ttDI+IPiYxIGw+z0F9tADpS7jB0VNYzb0bJjTBljDzXXXG/
	RzHzKlzQRuN2kDI6Rt4l4CNlQAN+Kqzys7Far
X-Gm-Gg: Acq92OFtfSzEnCU036gIi+r4t4HYm3wo3HUw3Jjk+tChIQNpEDa8cmpLpscHNFtFvVR
	AVvQUFI99ApOm/2FsCFuRQqET23eTL10ZojZ4NLKMWjYw1NhfBT9t7O/SGrQTLKRprU6pN+7deF
	ZCIRnDwqMi2Fn6EHFym3dmLLQRTMJxy/jg7iRhUwyr4+fTnD0cddaN5JN2mhC0i4GkrFgcCozhV
	+sTFCYyNY2TNWqHNl+jznfpN5T9wi7A3KumvSX+KnqQ8jmG/AQxgQeqRTB+OzP0ncH+GrUFJGSb
	thRfKw==
X-Received: by 2002:a05:6402:43c5:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-6889c42ccb8mr7409311a12.1.1779725775469; Mon, 25 May 2026
 09:16:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525095216.12078-2-linux.amoon@gmail.com> <20260525102746.B58861F00A3D@smtp.kernel.org>
In-Reply-To: <20260525102746.B58861F00A3D@smtp.kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 25 May 2026 21:45:57 +0530
X-Gm-Features: AVHnY4JnD3B5friicBByosla9N5iCWds37tvjlupqHMwJjZjvEE5EbdckMdNRm4
Message-ID: <CANAwSgTQQPDQjc1S4o1g9F+Uc2Fr6SYM6fm9DHB=mMR7eD6WFw@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] media: meson: vdec: Fix memory leak in error path
 of vdec_open
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

Thanks for your review comments

On Mon, 25 May 2026 at 15:57, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] Allocating and destroying a V4L2 m2m_dev on every session op=
en/close causes a Use-After-Free within the V4L2 M2M core.
> - [High] The hardware interrupt handler vdec_isr() dereferences core->cur=
_sess without checking if it is NULL.
> --
>
> commit bde68706fa632effa876c30cef33b3528cd917da
> Author: Anand Moon <linux.amoon@gmail.com>
>
> media: meson: vdec: Fix memory leak in error path of vdec_open
>
> This commit introduces an err_m2m_ctx_release label in vdec_open() to
> prevent a resource leak when vdec_init_ctrls() fails. It also frees the
> v4l2 control handler memory in vdec_close().
>
> Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kern=
el.org/#t
>
> > diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/=
media/meson/vdec/vdec.c
> > index 4b77ec1af5a76..18a22b79e835e 100644
> > --- a/drivers/staging/media/meson/vdec/vdec.c
> > +++ b/drivers/staging/media/meson/vdec/vdec.c
> [ ... ]
> > @@ -913,6 +913,8 @@ static int vdec_open(struct file *file)
> >
> >       return 0;
> >
> > +err_m2m_ctx_release:
> > +     v4l2_m2m_ctx_release(sess->m2m_ctx);
> >  err_m2m_release:
> >       v4l2_m2m_release(sess->m2m_dev);
>
> [Severity: Critical]
> This is a pre-existing issue, but does allocating and destroying the m2m_=
dev
> on every session open and close cause a use-after-free?
>
> Since the v4l2 m2m core schedules jobs via a work struct, if a job is
> scheduled just before the file descriptor is closed:
>
> vdec_close()
>     v4l2_m2m_release(sess->m2m_dev);
>         kfree(m2m_dev);
>
> Could the system worker later execute v4l2_m2m_device_run_work() on the
> freed m2m_dev, as pending background work isn't cancelled during release?
>
> Should m2m_dev be allocated globally once in probe() instead?
>
> [ ... ]
>
> [Severity: High]
> This is a pre-existing issue, but looking at vdec_isr(), sess is initiali=
zed
> from core->cur_sess and immediately dereferenced:
>
> vdec_isr()
>     sess =3D core->cur_sess;
>     sess->last_irq_jiffies =3D get_jiffies_64();
>
> If a spurious interrupt fires while the device is idle or immediately aft=
er
> streaming stops, could core->cur_sess be NULL here?
>
> Should there be a check before dereferencing sess?
Apologies, let me check. Every time I try to fix a bug, I seem to
create a new one.
>
Thanks
-Anand
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525095216.12=
078-1-linux.amoon@gmail.com?part=3D1
