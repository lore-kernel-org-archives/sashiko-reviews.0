Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2FB4DB568
	for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 17:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691737; cv=pass; b=BcVCOGwnI1ns/lvRXzzU+GuOvYBa2xfFPWlbP98KbCSqsnZkwekHh/we2TDBb2c21JdJiyemptxZ1NIl9tEWfP+t5d2GX83Q/dTShCgQl2lVLw95NyUK3MmUr7UODX+GAXGgeccpiKUpQWYh80AdvTUVQVk2mOegrA0pDdcZ+Us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691737; c=relaxed/simple;
	bh=G3BGz1JY36/f65EsXPbcHpzUvA0Vvm09vuJzP0AFG1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MlQTYhRcGSe/GeHyc7NuCcluX0zsTNkj1gYhj4V2MNxsQpyr0QCAgstHOXPvLMTqouELNjRb/17oX7baSnDuh8dTt+VxQFc0bRU+ZX6iqRSEOtImtkJrgzVE1lLowOlmXQHc+gh4SsNNeRdRQIlI8tV5odD2Q6LPBbMmFQPTPcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IoH4997l; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoH4997l"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so5196659f8f.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 10:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778691734; cv=none;
        d=google.com; s=arc-20240605;
        b=jjUQffnbPaQxkh5fSIqkPc4xKPdHxer/PlPyIiUNSumeql5Q1prWLiq7W75wgF1fXU
         nG7M9n3kdyZ0VvZvGfn3U1hTILX3K0IRIjx70XfVo59v5Qmb5Kcq2IrhOH0a/BgKO1Na
         Nieq4w+TdamfM7TP6IOARgoyAzHrIB0jIEIB0RTbB260k8I5QtxzI0hFanpqSjFl/gZc
         8ouOT/5LxTr06fgCwVHxl9LouXz6e47AyujXO24hwxsGt4d5CK4heCo45OJUEuMdBIfI
         RSrHYLwU7EfluSsP0LWSSi7Tg6qfUrC3DyWenJmakg0seBQRKSn4zwiiGkctjo4TBR/V
         cUGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pm/7AQT70Af1uVrKb0OGWSpkbiaJBc8xDYGjxSqDigQ=;
        fh=KeJufwMIREYvL08VN3hv4ACWs8Jc6TJ2nFmBL1zkymg=;
        b=lmxoWXFmNNAHadLjjusxi5mAOvspmRe7j+m1CXBSazljqSi+kWnk3flyHtavetwt0Q
         RBaMxKV4brTAbazd0nKKT8W/xSSTRTP4gsDiBuFpfV4gz7A7ViJHMJ+PrvjeiCRWI8Yd
         FVUn8PCS545Nyd3jewXY4TfkZJ/X0qfrk5CPOWQSP1SMDkBx5So39ZdwZie7wMoeAUKx
         4vXSFzXabMIgFtkHptMxmnqUcZ4TGomTcrxu1oXiYFAfYuTyM1aWrV90dlC4aZ2yod5S
         Ob8nghrSdFbWZuYa+/oxzJfMRzWAS0k80P/iBVVEL3S5thWJtxL2PNUXJmUHquiszVp3
         vqHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778691734; x=1779296534; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm/7AQT70Af1uVrKb0OGWSpkbiaJBc8xDYGjxSqDigQ=;
        b=IoH4997lNDpZx8tqgFLFJhn5YPSzMsHkeGMcntA7YyBefHNRmtUIQvmPk27EWlWIkj
         lQrdr4cnaySuA0IN1zpWTfzrlIVzWLYCthlREvsy7jrbn8gsat/BxLS+zYO1HZ87Ya0L
         FrxD7VsrpziI6B2eDwVyxlyW07LwnXeYotmNUZZrIRqWMAoRbGTukg++DdqSHojKy7Md
         oud0ZhhgTZzu5ah9bsr9hQJRvQWmh/HKUxc5UlLvWVQ92nW4DBL5rP5cZxN6vGfZjV3H
         DUUpC/ZPLqNRnmLxMTN/ZzW/I5Sc6o3ZPXPR6eTMmdWvreSXgwIuGmiteQUx3gy3/AlR
         dnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691734; x=1779296534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pm/7AQT70Af1uVrKb0OGWSpkbiaJBc8xDYGjxSqDigQ=;
        b=Jvsm9tfDuV8Zo5lXjB8VHLS3FrMPHew2L7YHC3nDkq8b3qkuBI711u4MTmJVdQW1jl
         z6DMwNbXbY8rCHr/sQMSOK+t+kVGjhO3o72QFj/r7wwyBqxN87gw9J6ZEs0Kh+yUlEet
         EqdDqLhDSibqpa0X/9kQEOc+UCpOUjlxfpvMizetCQ6Xz1d3NolxueCrIxA2ZQ7G7xGi
         CrwbTO6pDVHP5Pa2O3DUw8ywoz17LYEKcXVtSj2lhxZEMtYNKaPPsmgboUN494gm+Hpu
         Q2PzGiF8HRITfXpnkBwGfhaYhewmCMaYnAI5a8x19XL+ZN2sizw1IA6uXvy3fvQmenBW
         2xhw==
X-Gm-Message-State: AOJu0YzrZ215mXiY3fjm3lNvHPd51OLEPRUvL7kVa5JR6yeMwdgODvPG
	tGLAVfDRi+OCcJ0OPbosjDAWMYCTNT3HvwrXBAANUYTEmvc7evKA/jsbZFFdTWUrmIx6jxCiNW2
	R8eZwpKs3LXYec2WBvVO/XDxDMzmGBvKcoUL0
X-Gm-Gg: Acq92OGxzOA2hlEj91tHzuFaPvI5Cz4zXbEwP2RsFLEx9Zfq8ecAFYVFYxO/NbjT9Ol
	OaeFhQ65j3NcycyFm7O7vlH11bZVJFEYXBysi6Ev605vy9h9+kj20dTDJckayVXT0IMESUx3Pkl
	S/+6+iMdIz4iE6Fg6aO+1nzXFz9xnYw9EShKnevomBW7biJWVUg5WW1vYqiDNRz4HVLFlfeBRsY
	ct2s60Qxz78xEmJGIEw3qSA54HZ5az71hknVaJM99UjouAMBDnI25a1dWo2UiFTYJ4lbfpvSdP1
	L3grxCqMfpuPxqR4eTEjp0VtY8R0dpDkIuL5NRR04XE6lliJLZfDIPMgqRtDwixibtIN11SJuH2
	ZME8TAfvFmpdFGDbeS+DMhzB8Eg==
X-Received: by 2002:a5d:5f47:0:b0:457:ff13:b2a4 with SMTP id
 ffacd0b85a97d-45d8fe08569mr610172f8f.3.1778691733599; Wed, 13 May 2026
 10:02:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511152817.89191-7-leon.hwang@linux.dev> <20260512233658.CEED7C2BCB0@smtp.kernel.org>
 <3c9b4ff0-7a62-4053-83c7-23151905c742@linux.dev>
In-Reply-To: <3c9b4ff0-7a62-4053-83c7-23151905c742@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 13 May 2026 10:02:01 -0700
X-Gm-Features: AVHnY4IGmVwWcavbw6OvXdhM0kl3pI1g8o_zFUpbYMtujiX0hcFEhJgHmWBpXKk
Message-ID: <CAADnVQ+XR3kyqizGgGhtG5xiBu3oK3O+COUMfPDQDBSJbm=56A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v13 6/8] bpf: Add syscall common attributes
 support for map_create
To: Leon Hwang <leon.hwang@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 3:50=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> On 13/5/26 07:36, sashiko-bot@kernel.org wrote:
> [...]
> >> +
> >> +    err =3D __map_create(attr, uattr, log);
> >> +
> >> +    ret =3D bpf_log_attr_finalize(&attr_log, log);
> >> +    if (ret) {
> >> +            if (err >=3D 0)
> >> +                    close_fd(err);
> >
> > Is it safe to call close_fd() here? Since __map_create() uses
> > bpf_map_new_fd() to allocate and publish the file descriptor via
> > fd_install(), the file descriptor is already visible to userspace.
> >
>
> I think it is acceptable to close_fd() here, that the duration between
> fd_install() and close_fd() is short.

bot is correct. Let's avoid these races.
Pls move bpf_log_attr_finalize() into map_create and do it
before security_bpf_map_create.
