Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9A833B6EF
	for <sashiko-reviews@lists.linux.dev>; Thu,  2 Jul 2026 05:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782970863; cv=pass; b=PrnAp1V1/pGAfSg0F23pRJVyjpUujZQ4NNfmDwclRd9vGsPaNbbhmLNejSeQvKBVH8SZqvs8pQueQ/fLSS8073eWNfHzZ/0bEw6Cl7OPlxSAy/TWv9mr78ZNilIeUoSVgekuZCl+T/rzE4eAtcvW1H3vE1zElGlP/GazT8uj1g8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782970863; c=relaxed/simple;
	bh=IQ/c8WVDoxQrhZvKSrnPQbv4b/9COlcR710Od8nu4tM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UErVa1l9geHJtyswjk4aJGXxrSkgU6vn8oQ9OUqH2hZRvzX2FTwT+m9QIiNvvSJlV0sXlxVv3SSlOwnkGcvfPIoqGvHEixsWOu0MQ0Qi+hN2Foikh5T+S44wOdoeep9UbXQcro5UKl8L4LxKfLhW2mMOyfEUEMSI9L6Sv5VsWmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GANuTgz9; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GANuTgz9"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8475eca3a66so1504182b3a.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 22:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782970860; cv=none;
        d=google.com; s=arc-20260327;
        b=sz1mtMsgjK0XJqSNpjWUjX9qvBcNK1XTKRPxeiAh/u9JMCsYxTZ/loYjgY1uo9dubH
         2cgV6dnQVFnMb17vVrZ5/NoIOegkiDjXpBQ8PSIgt1ejgL0sh9iSZTfv33HOoFJ2rqd/
         l+7o4nrBqdqKxVBBx2nm4Qds21GfqI81iyVf1+MPlH50QFkj19l4QqFj1Tzo7EwjthVL
         esXbQM1Yz768GK2rGt+fD1w0mBdwcBs6gKX6HNK2CjOGDjngSj8BJnXF4VkVfqvxjmvO
         /S5VIzwDNvIExoZpuT3iKtXBhWHIKbTW7U+MB8YwX2LtWnuWq3+4xdenb4YCT7k2eRPu
         gk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z5UfvAgJ8YjTczByfeidWqKA0EosDZTFgQFu0/uNWSo=;
        fh=i3bn+DTScpHnvfp4ETAU/Ft7080SsHijEpVezBQCSYY=;
        b=XrF2LA+D3yTSUW6SaOcGXc2n8sZIzNDW5tPWlxutIEA+0JVezyZnnvQmbmCimJf2Wl
         etDLdPVxPt8X5cZjT+0Z94hz7rVKeM3nTqqYIq3UcuWCpIQ7zx0FBcNjD7qNIBue02Lu
         +RSRFO3skx3VpToDeiFyxMiVrcOzNxwwYMpOveQl8fjzn6koyy+yu+0KmAt+7v7grrhJ
         ewrSpVGiZpFRtNWwLdHeFmxCCrhSMlEtQm1tEyBBxZef+V6gUkAYV62zzBKlGWnKWRIK
         K9T2KsPKDfQjK541gSJRZBHDq4uqLEp1+TEpi0Rh4c6EXoaiOGBH0OQnzzyYJb44JXgF
         gB5w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782970860; x=1783575660; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5UfvAgJ8YjTczByfeidWqKA0EosDZTFgQFu0/uNWSo=;
        b=GANuTgz94oAL4+4CETkOj1KTh10lJzTOOK8sX8EqDpIbnoiw5BPwIXlZoj4IPSATIS
         EAWq9VBJov94N5lCmGGb/gdVtXbrKuKTpxoJllPOPQPUhTH8FYmETzMt7Kyo9uObT0Me
         ws7sW3L0nIvu6BL0qtwl/HUghITjB4VKcrL5f9/FdscfSQqOu1iedrv7JfbUfXTMdlnl
         hyGuHrRKqXD3TLjGESXQunAdTkPoL7wfO/Ue82MTklJwEO79bTk69zuTB5VPZzsiCOUH
         xFzJPJsOFYwF0VMfcRrizoHrszzHLykY+NRDQnwnhkKGXxJ5X5I3TqRxOjSDeGFdwJOr
         4rJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782970860; x=1783575660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z5UfvAgJ8YjTczByfeidWqKA0EosDZTFgQFu0/uNWSo=;
        b=I/UaBrX+fs+Qmr1bZG0PTMD/U9Der4ZSXJmCKgMTPJ4xMrFHYeHMmDFSLye+wXuir6
         mj3STJBN+qP/LjX+gFypdBKfyslirpxAiGILpM2zAnDl1a5vNqrPUXyWdThAf6W8M4hF
         xEVKmALnTkMIh0r9z7lqF/hzUtcCwEVoCnVZJbmPfCpDHwVYsN8yAHo5tZDduKWastWl
         8BeW1YGzlCXrZhlrhM2jzGIBxgro8rRDBrzwQg7OIndgJQlcbnOY5mM1HdxlrKqQ0p6p
         YvgEXCJ5yFiRzX7XK7Gc5V8cGLL8auCR/hww3ulNvX1U+E0oWirQbjol3qI2SILxhNfR
         9oFA==
X-Forwarded-Encrypted: i=1; AFNElJ956eYkRmbDgxXCDg4NoGkxMzv3P/VZ3jjTVVa6iaVHfbQSWNat+vRySvrPQ8pJIjM2V7ypy5qcubn6ITjK3II=@lists.linux.dev
X-Gm-Message-State: AOJu0YxI51RaupIh2XLJLLj5GMDy4QD/W4zwX6uSr+CTkPqBYlJAYRuq
	05dTrPd5GtN3Q3vDy2QruM7E3Jezk0bZRLUondy3U/wD/ItrW/5op/VfqyBuPxlsYE05oszomaq
	7oNK0ApBvBXUljOOc2kS8KUiLl+JPvbY=
X-Gm-Gg: AfdE7ckRNwx/5TLJUpNBwfRrl69EQFYJyD5b8ByN7mUaqRqt0+IPBGtLp/uKWrqtZUs
	n4yY2aXG+slLA0CMLrO5J+n+ODhPUPdpJPOUy++YV0xYXNTErp7htJcas1XSUQCglxC/UY7+zQT
	ycNWAjrVs/kP8NHnP3AHvSs7+KnQ4ZCKFsIKDOp38LCdIttEyKgBIJ20mTIDi/1YkS9+MoXVfYa
	/Jap1/GTO9dh6h0nj7s3ZBFnBI94j+QohsO6oTEYiFPuuD+FsQKFdRlvNjKXMhjJcEaxUcNPqEn
	YmACdhf8ImjbOjhKyja+EsHEjDmEkVV4Aeog8GtTDneASF6waSbViP0NB26dcHMJuaL+O3Wz0u9
	uWnipjG3V8u43CQ==
X-Received: by 2002:a05:6a20:9f93:b0:3b3:fdb0:2295 with SMTP id
 adf61e73a8af0-3bff3ffaea9mr4293388637.6.1782970860276; Wed, 01 Jul 2026
 22:41:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEf4Bzb+OOrdGyxbzjh=7MUEbA5FC05E6_iwCjDXcnSO-HZ=ig@mail.gmail.com>
 <tencent_30FB52DFC6440984EEF0EEC70C90A7DAC606@qq.com>
In-Reply-To: <tencent_30FB52DFC6440984EEF0EEC70C90A7DAC606@qq.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 1 Jul 2026 22:40:48 -0700
X-Gm-Features: AVVi8Cd_Aydgpi6ybanaT5W1RYtoYBPVPSh1YD5O91Uma0-voa1CtKjxUtg_WYg
Message-ID: <CAADnVQKvNewGNAoiF8thaqaWuZCFxzeXU3QHg8jP8Dmqag6_JQ@mail.gmail.com>
Subject: Re: [PATCH v5] bpf: Fix smp_processor_id() call trace for preemptible kernels
To: Edward Adam Davis <eadavis@qq.com>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard <eddyz87@gmail.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Network Development <netdev@vger.kernel.org>, sashiko <sashiko-bot@kernel.org>, 
	sashiko-reviews@lists.linux.dev, Song Liu <song@kernel.org>, 
	syzkaller-bugs <syzkaller-bugs@googlegroups.com>, Yonghong Song <yonghong.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 9:35=E2=80=AFPM Edward Adam Davis <eadavis@qq.com> w=
rote:
>
> On Wed, 1 Jul 2026 12:57:52 -0700, Andrii Nakryiko wrote:
> > > bpf_mem_cache_free_rcu() maybe called in preemptible context, this
> > > will trigger the below warning message:
> > >
> > > BUG: using smp_processor_id() in preemptible [00000000] code: syz.0.1=
7/5820
> > > caller is bpf_mem_cache_free_rcu+0x48/0xc0 kernel/bpf/memalloc.c:954
> > > Call Trace:
> > >  check_preemption_disabled+0xd3/0xe0 lib/smp_processor_id.c:47
> > >  bpf_mem_cache_free_rcu+0x48/0xc0 kernel/bpf/memalloc.c:954
> > >  rhtab_delete_elem+0x185a/0x1b30 kernel/bpf/hashtab.c:2969
> > >  __rhtab_map_lookup_and_delete_batch+0x935/0xcb0 kernel/bpf/hashtab.c=
:3349
> > >  bpf_map_do_batch+0x445/0x630 kernel/bpf/syscall.c:-1
> > >  __sys_bpf+0x906/0xd90 kernel/bpf/syscall.c:-1
> > >
> > > this_cpu_ptr() requires the caller to prevent task migration.
> > > These helpers currently do not enforce that requirement and may
> > > be invoked from preemptible contexts, leading to accesses to another
> > > CPU's per-CPU cache after migration. Use get_cpu_ptr()/put_cpu_ptr()
> > > to pin the task while accessing the per-CPU allocator state.
> > >
> > > Fixes: 5af6807bdb10 ("bpf: Introduce bpf_mem_free_rcu() similar to kf=
ree_rcu().")
> > > Fixes: 7c8199e24fa0 ("bpf: Introduce any context BPF specific memory =
allocator.")
> > > Reported-by: syzbot+fd7e415d891073b83e1f@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=3Dfd7e415d891073b83e1=
f
> > > Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> > > ---
> >
> > from what I can see, bpf_mem_free() is called through bpf kfuncs only,
> > and all BPF programs run with migration disabled. So this seems like a
> > false positive. For per-cpu checking, it should probably check that
> > either preemption is disabled or migration is disabled. tl;dr, there
> > doesn't seem to be any
> Today, I researched the call sites of bpf_mem_free() in detail; it is
> called directly by bpf kfuns only.
>
> Different BPF program types execute in distinct kernel contexts: for
> instance, XDP and TC typically run in non-sleepable networking contexts,
> whereas `raw_tp`, `tracing`, `LSM`, `syscall` and especially sleepable
> BPF programs may run in contexts where preemption and migration are
> enabled. Consequently, any shared BPF code (such as a helper or kfunc)
> that accesses per-CPU data must not rely on the caller having disabled
> migration; instead, it must internally ensure that CPU migration does
> not occur during the access.
>
> Taking into account the CI reviewer's feedback [1] and my further
> investigation into BPF programs as described above, the adjustments
> related to bpf_mem_free() should be retained.
>
> [1]
> https://lore.kernel.org/all/20260630094823.897BD1F00A3D@smtp.kernel.org
> >
> > pw-bot: cr
> >
> > > v1 -> v2: using guard against preemption
> > > v2 -> v3: replace get/put_cpu() to bpf_disable/enable_instrumentation=
()
> > > v3 -> v4: disable preempt to make this_cpu_ptr() work
> > > v4 -> v5: in mem free disable preemption
> > >
> >
> > maybe throttle your patch resubmission spree a bit?..
> My earlier actions were driven by a desire to keep pace with the CI
> reviewer's response speed.
> Moving forward, I will slow down the cadence of new patch submissions,
> as you suggested.

Don't bother. You don't sound like a human.
Bots are not welcomed here.
