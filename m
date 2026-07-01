Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC49614B959
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 19:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782935886; cv=pass; b=dQA9DvNYCIvv5HyCF8YQJMBSrEBPTizmN+M4g73VtBP7tUUkxqbTRBm6RtP2ZgO3UENFP5zYetoZZpeOa7o5o2+GK+lqo6sNjreEqLCpgzeMtPm6VzJ1uSNccYs6MTKfV0xYnuNWntSfCQf0J2VvnbirnJiP68hjL02cm9sw6iA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782935886; c=relaxed/simple;
	bh=i60NZHFAr/h3m8g1ycLBjS67V/ddDkK/sHBzOunEesE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gpWdE4aH7sIKUQh3WUIuM1ywsLkFcFfsgjYQ2uRd8gOHoaoyZqyTIV3Qh868SKVY78TM7RBwbsGYTa6txYUczbQT3aeeK3cxXP2QQcSg2aiYVhnXkKGwXVm2sdc94RhvuISwaoGTUioeK08yxoFsPk4VHMCn1Xy7rdqOkrgL3P4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5FyKSGX; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5FyKSGX"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c82538b6b0so8122015ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 12:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782935885; cv=none;
        d=google.com; s=arc-20260327;
        b=i3Nh6DRjNDGJWo8p+LOTxRAU1FcDa9jPsR/gwei5OJDQSpKZsT6Tv7ogobEh1JwpTK
         Ke4QjY8uct+6scizeEeBFFShXiHzLXjLBfatkBC64yQp6x5sWh6svrCva3jAHBw7WHHE
         BRvbfxaGlEkDDYvsDHM+YmOepXUorJuORpfN8ECUV32eJpUodlO/6SLgihaGyKtLeCro
         pLgI8ReWCkRS+YYvQk9oQA6bT/IoE6fS+GJtL8+83q0LnLBV82aIWeIHVWfKwXEetOYN
         +eY7ZXfGQ03zIkleh04LzISbKywi5DgrzMdXkayMQXYLZc2XIRC0LraHVJtGPvbSYeUs
         iUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z/jk7CuiaTeF+7fFe7FXnvT1Gom1hwgxaJqMwyCP2ak=;
        fh=zNLoYHTH0gj8yuT2Aas5ZgDAeQVIABi5gaGibZ4HPwo=;
        b=YQYA2L+u3dTqQspc7BMdRdzkDihiyficQ69hKL9yLUhfhEBVwxbwWkN3xEj2P2l2G3
         39qnXDsTSTnPYNAa8Kf0WnyjEbw0DtRtpLp9Ea9euv06Bfh3hew8v6x8muppZYr9exXt
         bLMawJgwH7bQZu4lH6U6TJZNuyD64MvVYOsGbj0ozEWCUhOdIehirD2bdu3UTxfW0cu3
         bYnm1T9H8yuQKsT8FeORJILcuhBcm7IqKBSDXMnKNJcCXSIISlemlJgr/Zm1D2GK7Oco
         eMdRvw4urIuxt7i4HHSgck9mMmJQCOeMd2zT5q6V3NR00i/y+YkK+L4BFlZ+FtkVGiyd
         dX7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782935885; x=1783540685; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/jk7CuiaTeF+7fFe7FXnvT1Gom1hwgxaJqMwyCP2ak=;
        b=K5FyKSGXwlA9+NirVffDmWN7OZiMi9OK82Rk8O6bgn1WANqeNPVXs4me7QptEyMAIl
         TWJfkMLQ//wXa/4PYnDnYu2gf+CzxzLbkWkA66/F+N8kvFCOnJZ2c6vT/fm7sQ+eSMBg
         O2bL5mW6+R2pc4iPrJ24tQ5qwaIInhPB8jfMWW9VtTD3BVu1aWxNe+GvTlQLGD+V8mc0
         zzL9RTK8i/58FsXKDpLdDW3QXl9IcX3astKyixG/wwbNCdkg7MFyeRHlSuGWm+Krjk4A
         DSdxgDxFiuPEmVwDiEvI6SbKi4ecpBYqWJxJZUtUlOjlHu6nQrmAaisCGm4mXYqMWGP1
         TSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782935885; x=1783540685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z/jk7CuiaTeF+7fFe7FXnvT1Gom1hwgxaJqMwyCP2ak=;
        b=sORHQjVVSxJQ4KM0CxOwpIdUtpwuXCNJ3izim6vh9m6VNVGUxF0/5ZPsyLUibqqaVo
         R/TdE6+RgbKMQXIA9AmKS+mQsfeOEGIUOvNbzUpzULmaQrapVl9KpHZpLwc3NlKJdZzI
         vynkTRpLQp/4YJ3nb7/kpElRhr1K7GFjQxz0pJAYXLZG+4Z1yWhyrHPzY8ILMMWppD9L
         2YIe8GKdDVG1vsJz4samRTniXpamoNiVfKJDklNKHeZeq+FjkkzLxpFpduxQNAc0hq5/
         15e+8leUVKzbWAwa32dG0YPO5yWG1ghxWGoEIpuP1Lwfr1JHuzSdUznWn77OcXeTdJv4
         AIuw==
X-Forwarded-Encrypted: i=1; AHgh+RqNThXdxKEDoNPRRAZLKVgrVyE7XfOlVszS2kDyVnkvM9iKPIIBIG8AnWlV/IVH+o6NV17zEl8E0byFrW9nujw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVG8vSqkFQTv/oQg/GIPVD1XssttfOn1AOFNazWzgwlrBJE0FJ
	Vo8GPRt5+5C4BF6SA2nORwc1QJVFbxUCfpj+CQK59YTEFRG1lski1qJxOwGhzidO81PZFn5esi0
	B4PLC2FpgqNncA3jL8eXRvHDX1Vv3kro=
X-Gm-Gg: AfdE7cmn69Qw2r6bHp+t6pI4Wl7v6XkA4G5SCfTK9xUc4QD1rlniH9Si+vf41M96YvN
	I7t8acSvjD5Wdy9br4zX4uf8IpP+IwrYdkhK0D04/hUuvz6oL/XECPhppPaP1n/2cyrVGcWXVDW
	MPh2JT8wqNehfz/3nD80yGW+oYl/oKNQcem+J0v1Osy3QpsrSSDsamfbaFNChXVP90Hkpj5Sygr
	88d1pPnztf4phAhMjKhE1s+Xn79xKyj5+7EVk7zH9QbH4tx9BmWF7VUS4sRJaL53ZXv9bdrdTtN
	WEUk4LtByb0si+OL6FfLYvT4754ZWMRkGPN8IhvklNEfmECvFKtWjA==
X-Received: by 2002:a17:902:e5c1:b0:2ca:c68:c554 with SMTP id
 d9443c01a7336-2ca7e90cea8mr33779245ad.38.1782935885043; Wed, 01 Jul 2026
 12:58:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630132226.C44601F000E9@smtp.kernel.org> <tencent_70F825FB8D959232DDCB5DDC991ACFB40D07@qq.com>
In-Reply-To: <tencent_70F825FB8D959232DDCB5DDC991ACFB40D07@qq.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 1 Jul 2026 12:57:52 -0700
X-Gm-Features: AVVi8CcmJQesiAwvYWGQKOoBWRdGLDKvlSi6L3ILgPYvpbdBIlalI7TmabXmhhc
Message-ID: <CAEf4Bzb+OOrdGyxbzjh=7MUEbA5FC05E6_iwCjDXcnSO-HZ=ig@mail.gmail.com>
Subject: Re: [PATCH v5] bpf: Fix smp_processor_id() call trace for preemptible kernels
To: Edward Adam Davis <eadavis@qq.com>
Cc: sashiko-bot@kernel.org, jiayuan.chen@linux.dev, 
	sashiko-reviews@lists.linux.dev, andrii@kernel.org, ast@kernel.org, 
	bpf@vger.kernel.org, daniel@iogearbox.net, eddyz87@gmail.com, 
	emil@etsalapatis.com, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	martin.lau@linux.dev, memxor@gmail.com, netdev@vger.kernel.org, 
	song@kernel.org, syzkaller-bugs@googlegroups.com, yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 5:27=E2=80=AFPM Edward Adam Davis <eadavis@qq.com> =
wrote:
>
> bpf_mem_cache_free_rcu() maybe called in preemptible context, this
> will trigger the below warning message:
>
> BUG: using smp_processor_id() in preemptible [00000000] code: syz.0.17/58=
20
> caller is bpf_mem_cache_free_rcu+0x48/0xc0 kernel/bpf/memalloc.c:954
> Call Trace:
>  check_preemption_disabled+0xd3/0xe0 lib/smp_processor_id.c:47
>  bpf_mem_cache_free_rcu+0x48/0xc0 kernel/bpf/memalloc.c:954
>  rhtab_delete_elem+0x185a/0x1b30 kernel/bpf/hashtab.c:2969
>  __rhtab_map_lookup_and_delete_batch+0x935/0xcb0 kernel/bpf/hashtab.c:334=
9
>  bpf_map_do_batch+0x445/0x630 kernel/bpf/syscall.c:-1
>  __sys_bpf+0x906/0xd90 kernel/bpf/syscall.c:-1
>
> this_cpu_ptr() requires the caller to prevent task migration.
> These helpers currently do not enforce that requirement and may
> be invoked from preemptible contexts, leading to accesses to another
> CPU's per-CPU cache after migration. Use get_cpu_ptr()/put_cpu_ptr()
> to pin the task while accessing the per-CPU allocator state.
>
> Fixes: 5af6807bdb10 ("bpf: Introduce bpf_mem_free_rcu() similar to kfree_=
rcu().")
> Fixes: 7c8199e24fa0 ("bpf: Introduce any context BPF specific memory allo=
cator.")
> Reported-by: syzbot+fd7e415d891073b83e1f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dfd7e415d891073b83e1f
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---

from what I can see, bpf_mem_free() is called through bpf kfuncs only,
and all BPF programs run with migration disabled. So this seems like a
false positive. For per-cpu checking, it should probably check that
either preemption is disabled or migration is disabled. tl;dr, there
doesn't seem to be any

pw-bot: cr

> v1 -> v2: using guard against preemption
> v2 -> v3: replace get/put_cpu() to bpf_disable/enable_instrumentation()
> v3 -> v4: disable preempt to make this_cpu_ptr() work
> v4 -> v5: in mem free disable preemption
>

maybe throttle your patch resubmission spree a bit?..
