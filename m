Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FB235E1D1
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 22:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778885320; cv=pass; b=Y24nr5jb3T3cHg3jW6TbOadIFoagdKwhap+KYAlz7ZM0fNiQoALImXe0CIADiPeb+PK0R6LCTA6LHdKhn1jV0NBg0V1r+KTE+/U3H88MYre5eE4Dv/hKKhkKKrndJSvmnFxtAQ6m0zKDEJiuMxSJkAJ+1VZKiY8O4ZqfeMHYnqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778885320; c=relaxed/simple;
	bh=emgqSdrgaH7tKJdLuU+Uw02nxDHreg2z8f1DQNj3AJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPnj0490DpHsCQdSGrh+Vt+ixBNkuAG8TGffwqhLs4Dou1vWmumSyLpYoT39GT5QpC/Vr6R6sEVKMuE+zKBPYVD2Tm6bo1hXelltGIdKrdPM8kWdzLNGxyDZNsQ6e1Yi+4IFpaHA498P2LFHEGx4z+Upf7BHAeqI4QOuIJgqva0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwsZnEVC; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwsZnEVC"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8016d642b2so704119a12.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 15:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778885318; cv=none;
        d=google.com; s=arc-20240605;
        b=bmsD5gpMorEjkQOyT94a4uItmdq0/3QjQYzJXhywqH7eGvkDRwB0yndp4y0It8aNBQ
         nu9mqngBPuXPb60bUJ8pDcAbq7jpjQDQ4OCNfzgIcOLr7vH+L/C7OZI0W3rTI0of8qzx
         d/APWWtWIEX5pmCozYowylFa24nxr0I9tOTmBgei5j+OOVv2ZStoJzezNTlyVswT9OlB
         rVg9Snrd5yK1vTgakeoWESmmkybrcvU/mP1S47WXd5eK2fAlgqD61mKSYjBtTR+bm4XW
         kskWw9ZG7XJT2ix6F/5vYo2WnTw4OPtOicsQflb6UqLfaDCvJ2Vm+UwzgiErMyCt3oqA
         +muQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ddJL9/JvVKOl4QVfhOJ331vWWsYvSvnzUzhysZJR6k=;
        fh=O7G2V36pfNrtg2U7Xpyb1+7Fmwbp/ZY8nQ15biqCkZI=;
        b=FZBI9n/gQ8G5+M61bl92r8Z4TjCQEVSwR3prYVLiAUskAsUc8zbSzH2vV1yN6EElWV
         aZNPqVBrqGj5PlrvMcQebNrczQgRqNOT/5NjlaU6j6MF9JZZs3dzJZbSaYif7bei36oH
         J0mPWuR7t82SBfNeVyaT6mMvBNm49E2d+U5gHxdYAAUJb2C+zt+l1Qh6bS+qtc1zDi1i
         8pYNVBePM05r56QQVAbcT27RUWe1F/LwercECZLvErsuyKVEQRx+dOD8cidalvANDaps
         +PaBpj6YEvdHjTQjMQ3BSTFeuHqcxHRV46IJMcvEQM4rUBVasb0T4J8vii6ga5wCM/9m
         AAtg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778885318; x=1779490118; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ddJL9/JvVKOl4QVfhOJ331vWWsYvSvnzUzhysZJR6k=;
        b=NwsZnEVCBfOBlkIi5kl5w9JWNYrmFJPgYd4SJvWklacWFV9tB6lsglVp/uHcKHXTK1
         CuU1klR7q90zf1MLvTHZqPtjfKdjdmrs+Jbt77+mEdpv9E5NenOm30tf83Jhwa0kcXXU
         4PfsULsNHp66dSi8y0W6N+2G+M8iTOiLfdhAqZFsGqS1/epoBTPbFnm1GS3lZr0Rmh/V
         XTKD4cejE7JNbd4B5UQUHTU2l6ZUi/cLlVUj/vVDX0JpCwh0kxy+q0uvTTKOogZv8elk
         OECq+jFCNo4rxCznrR5xSYVwbyvYFf8TC7dQTwaXpV5zt8rjIWbJZE76mgp3sq4eBDMU
         6q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778885318; x=1779490118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ddJL9/JvVKOl4QVfhOJ331vWWsYvSvnzUzhysZJR6k=;
        b=IwfMPRdE6LicFIoS9fc/LSjlIpQCobQh/KFNolC6Dwr+OSCd3rAJ24feg1suKnKJSa
         L8jf3iQUi19iKFVsaACzaoigxGtYsihvSg5Mefu1QR9mT7DSAHVE8fLA13ddkwx8mNbQ
         tNnAjl5qD88XUCyRSy693QW4mlfBYCscaEw3njrV5lgbG8y1l8E9LulTeZKZAUMKbv02
         5f4/XaMzMYpr6KuOcBToC/VeVDrH7X/9IaFkITModYbZnis6FONhM8iokfWs4+T3g/J7
         bC1aRiCRUCikAiJICLL2CPS9iqRSqzrpFyjYO8xH5OcPzVMtzc7h8tLqOGseGzl3mqhb
         QliQ==
X-Gm-Message-State: AOJu0YxzaZ3SSrzBxfmyEo7TSP5y6oDWWgPglpuLkOi5NzgdTe7DUxY6
	l+jdCsS4Bw2Tl8WT+Cqnjdx6BvUttwBr5toSJzXyHxveRHa+EJcRDaiAi2iFKE9vYgeFMF/7YcU
	iIRWKw8ucil5yhMDZviHUPKD09zkm/cs=
X-Gm-Gg: Acq92OEziiAV9H+bwB+FAI7nwf6500jP4G2j/KFMpjaHWLy5DZK8DVSJODqo/ewYm9O
	guIRAnkKXgpZ2cn0Il820TYYK38E+JaXts8KoH63abMfu04QJmtxG7icMn6G5jWhWCnAFRlYRF3
	lfYy0DW8R57qY1d3tlBq6kcGmbsWE/qoiGzuDPTtm6erwug7dBbxucjwiBB1RTG+P1t6yyQKIcA
	PVnVPTuZgA2r8OvCY1t+OUnPrGEArwpyiTAqrx4bOa8bUh5jPmh8FeV0ugzKGEM8a0no34FXFwI
	KGfEcumR6Y/s8WIFZif2sII=
X-Received: by 2002:a05:6a21:99a6:b0:3a2:d5b8:bfaf with SMTP id
 adf61e73a8af0-3b22d0c8e5bmr5941072637.2.1778885318138; Fri, 15 May 2026
 15:48:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515-generic_tracepoint-v1-2-aa619fa94132@meta.com>
 <20260515182509.A08E7C2BCC7@smtp.kernel.org> <24e10e8f-56b3-46fc-8537-fa677b2d2ddf@gmail.com>
In-Reply-To: <24e10e8f-56b3-46fc-8537-fa677b2d2ddf@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 15 May 2026 15:48:23 -0700
X-Gm-Features: AVHnY4JuVz5f1z8-5S0OkpN4BAbd_lg6epNLlbMlBhTDSjuOSwaVcIG5cFtgSBk
Message-ID: <CAEf4BzYLpEWXSnO=d5J-5-A7CUFd1oFB2XjxWrLCor4gJWWcTQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/3] tracing: Expose tracepoint BTF ids via tracefs
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 1:08=E2=80=AFPM Mykyta Yatsenko
<mykyta.yatsenko5@gmail.com> wrote:
>
>
>
> On 5/15/26 7:25 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] The global `event_mutex` is held across a `copy_to_user()` ope=
ration, creating a denial-of-service vulnerability and latency spikes.
> > --
> >
> > commit 5bcf593e0ef00b79b0e87af32e5fdb4e5481d768
> > Author: Mykyta Yatsenko <yatsenko@meta.com>
> >
> > tracing: Expose tracepoint BTF ids via tracefs
> >
> > This commit introduces a new tracefs file btf_ids for each event. It ex=
poses
> > the BTF object ID and tracepoint/raw BTF IDs populated by resolve_btfid=
s at
> > link time to allow raw_tp and tp_btf BPF programs to properly attach.
> >
> >> diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
> >> index c46e623e7e0de..d463fb44c790a 100644
> >> --- a/kernel/trace/trace_events.c
> >> +++ b/kernel/trace/trace_events.c
> >
> > [ ... ]
> >
> >> @@ -2200,6 +2201,62 @@ event_id_read(struct file *filp, char __user *u=
buf, size_t cnt, loff_t *ppos)
> >>  }
> >>  #endif
> >>
> >> +#ifdef CONFIG_BPF_EVENTS
> >> +static ssize_t
> >> +event_btf_ids_read(struct file *filp, char __user *ubuf, size_t cnt, =
loff_t *ppos)
> >> +{
> >> +    struct trace_event_file *file;
> >> +    struct trace_event_call *call;
> >> +    const struct btf_type *t;
> >> +    struct module *mod =3D NULL;
> >> +    u32 raw_id, tp_id;
> >> +    const u32 *ids;
> >> +    struct btf *btf;
> >> +    char buf[128];
> >> +    int len;
> >> +
> >> +    /* Module unload could free call->class and ids[] mid-read. */
> >> +    guard(mutex)(&event_mutex);
> >> +
> >> +    file =3D event_file_file(filp);
> >> +    if (!file)
> >> +            return -ENODEV;
> >
> > [ ... ]
> >
> >> +    len =3D scnprintf(buf, sizeof(buf),
> >> +                    "btf_obj_id: %u\nraw_btf_id: %u\ntp_btf_id: %u\n"=
,
> >> +                    btf_obj_id(btf), raw_id, tp_id);
> >> +    btf_put(btf);
> >> +
> >> +    return simple_read_from_buffer(ubuf, cnt, ppos, buf, len);
> >
> > Does this hold the global event_mutex during copy_to_user()?
> >
>
> Right, I don't need to hold mutext for that long, should drop it before
> scnprintf() call
>

please cc linux-trace-kernel@vger.kernel.org mailing list for v2

> > Because guard(mutex)(&event_mutex) holds the lock until the function re=
turns,
> > the mutex remains locked during simple_read_from_buffer(), which intern=
ally
> > calls copy_to_user().
> >
> > Could this allow a user to intentionally stall the global tracing subsy=
stem?
> >
> > If the user-space buffer is backed by userfaultfd or a slow FUSE mount,=
 the
> > page fault could block indefinitely while holding event_mutex, which pr=
otects
> > system-wide tracing operations (including module loading and unloading)=
.
> >
> > Looking at event_filter_read() nearby, it explicitly releases event_mut=
ex
> > before calling simple_read_from_buffer(). Would it be safer to use a si=
milar
> > pattern here by dropping the lock once the buffer string is populated?
> >
> >> +}
> >> +#endif
> >
>
>
