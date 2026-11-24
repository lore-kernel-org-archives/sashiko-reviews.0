Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795517015;
	b=Jgq1pt/z+B9guSRqVOh072R1d3p5vu1LvNbHxX5HncyWORYh45f7B3+KQwLTIvlc2/TG
	 p/rsaE+faseFUYpvqSPNMKD2wSHNGFCEWDyUTQYtEy70iTp1amAsRcbGwiEvMB4p2dW2/
	 wzfm5kwtL6A/SVq0uB+QIMg+r1xk4jMg1cNJUyeYxJcYomyYZogsc9RNyEd48XDir5BIF
	 AbA6lM6TEBhKQgfhr9COApzrk/j+QfJrGS3Ez2Y3Ko4/NPbZjHB3wluWD8LJmN3P3x3ZY
	 hPlBFv661pL+NyTSByXD+KpeeKURKC2SK57IGBYYPsGWpyRj546tfO27QrBag7mKvAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=zw8MhdrCRw4Anjf2J55DnBkyqIRRMXumfxb086Ftrkk=;
	b=MYpRqrNNCxybbOb7wlLgFJDM2GeG1baUGRm2Yjz1W2nUOJQLJ/WjWWcJCLSDSqeqFrvl
	 pUJ6Bw0c+A2SnWRLAQ2vkgjI4XhiZ21A/kSLjNmBZfpLgvJGyRwKyZQ4nX3ZvzNVRJcQ3
	 senmyhTmtU/tHTFURYG0McJ0LHVG0ImXYI+USQ1b1b7iWUgo88ogU0Ilus81a/qEEn4Mo
	 fKD0X2/bzgC9rX3YDFDiS504+/5dClEupSqGaltVmelsZ+I0gy+LBDjB2yy/dLGSBtasG
	 AURgRgDB/nvQD+rQFR4RYM6bQp5VqQ9V98aCwIOMuA557dwdDdBQrjTIWuOySjUn/YQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvaBVVae;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF7D606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 10:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DF7D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvaBVVae
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so3171179b3a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 02:43:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795517014; cv=none;
        d=google.com; s=arc-20260327;
        b=czbQHQ5FsAelL8paGpyq9t778b9MEhIzt/I/5hng1j6EkoJPrcgQ1B4RglwKiH89eh
         v/BDm9/eT/N7TMD2uqYAUtPhtXybGfWVal68uRK406AYA046r2lGS1YFwwfBjhqeYjWr
         3fEMrjG1aWTbLWsRmK/VDOvxUID2Li6v9y3Fab6mffaaLtPvbFFU3FG/bydNjEBSW/sH
         hjwOl7brfeT+HVp2+XjCgKpLj0SS2yrdCnA4vMppldOWsXWN5FS2GqmqJl4b3TzbM00H
         h6bwI2yc8D1D1Yfr/wf/hI9e+a60xF6T+fHTlbi/eMJwdacMlb5wFaaEKLaily2P5Y3+
         yKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zw8MhdrCRw4Anjf2J55DnBkyqIRRMXumfxb086Ftrkk=;
        fh=uNrDyZ4Z0PwcDlJzyXftuy6IP6LYjoQtMYJ2TsASHpo=;
        b=JHj+VueSvYFLEOzqkT+YvJo2+vbPdIv3XrRSDFyiODXw5Khhe2o9ZaZII5F2kw/Nqo
         6BebZ+RvSSrjhVvr1t3a/ofjVbl8ao5O753Xqm89JSDTwtHaSIJZDL023yRitTCVXOzB
         pIsDa2hU7u3hoGWE7nQ5G94X5qp7V1QzG6Cj4HDD1DJSPxPUghMS6ux7JVFKvGJ5sFBz
         K6Q4kpLRJRjbtwCBB3bB1l4G/q/Btz4xdXbwcayth/0IQAkbyFGNZDoRaKcndIvMFlOX
         4XMFPyTQpRyDfjbWYetugMmpCmLD16LtyPTwIcAzBP2C9z2OZ5bnuUdW5gonN7a8ZPfK
         pOOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795517014; x=1796121814; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zw8MhdrCRw4Anjf2J55DnBkyqIRRMXumfxb086Ftrkk=;
        b=qvaBVVaenrfF1FBnQLCnvAVcgTKo/1RNBi/aYdwaQz0HIDLKsDD3HvRrdedxOXrTZe
         Gex6mKOvarKYvoEYtH/+t3+uqdosuiJ3XtMZNhYuZkIvHL5VfYOYQpjQEfMAW2Gz0UZl
         sbRgrrzLfoxhX5SYi/Ae3bWNi1uLzaE0y+zOmQfIi+7kKM6vufYi0MFIWLfhk43nb0o4
         /oLHcsE1f0C6eu5pryxwwfjLxTgN5/jpPb4v6MHmq8iRl12THP5x20pHz6+BxaSWXoh8
         YEuEAgEP0aKJP61k6EXsk+Y4otTAgSuMdU5NdykimPPxwvqYjNWlXpx2s9QyTOxi8s2F
         puKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517014; x=1796121814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zw8MhdrCRw4Anjf2J55DnBkyqIRRMXumfxb086Ftrkk=;
        b=lu7h6ZEDuaUmOh2XCfAyaOKUUq+/5EncI3g4KjuMlk5SVkYUeLpacRVGPmHhosgq25
         9m0rujwBjw/yimuQ3XqIyt/JtBxRnibyEHqs2wgKASK6VCivrbM4DnJioF4sDXv3n/Xi
         kWzJ2s7xJfIB3PsjhGsw60Yk8o5AGYaGEwl1vo+B/CPQlzqUcbqmk4NVwBZEgWMjYwUY
         dl976pNt4+EmOc26s273inCHvDNW5PjyExu1M+EBjvIa49PsUFcNhj3xWo41KD5TeY2y
         UR1/jAiDdK22eoPgncYLfakK21u5fLA4xWbnAzZxAhsz8Gm6aZAuHEgjHqEHzsw4BVzl
         IlFQ==
X-Gm-Message-State: APuU4Z/GE3/Tjuddh+tchRTMXkwNFlHfOos1lMxDld4ev4y6vnzzUoxN
	qpQi81nL37Vzlklnqn0n3pMrRmuvSPubwswRH8XpCXCrei1a4azxV9VYzA6UL/e6IZUYQnOLBIo
	0dmEqZkZ4EIkhuvshxEyGIBw7PJqz/vBKg5/sy18=
X-Gm-Gg: AZFdTZfjVbW8N94dyL/nEvvCRvVjx5BQyMz1XSXF8SnOLhs/Qe4pOp5+QOXwERTUizW
	RyRXb2uZqEgS5QsKtKA29QQhHB8qbJaD/9eXwddtUdaS1M2a+pj/Yv3mt4rPKHuw3LJB/6NI+pE
	oJMIVMHYUlXNqRWWH3E0hMHiDIVJzMQFcNzCcyWcxLZpKXXltE6qOKJTn5VjsutZd9rH6gRt7YE
	wl/r/4Po98I9br+RgjLDZNPn2+r3lXfOzTHLFJUFrypxi7+HvaBNH6k50//RB0qPnb5LyneF51G
	2NjE2iZGxxtVgS1ZHdwKpKk51KGbSKxHDyG0ZDILNBsJx8VMBqeXqldbxR+8nGFC4L03vaFj1Fw
	LONvkS9aduTkbb4a98wIXQh9HSStw9yDWvsEeLmcf77YrfL9Exe+Xm/sOfQNw/fjh91meH4ROjS
	pMYyszeHBrBG0rGkGDvl6NguH4
X-Received: by 2002:a05:6300:6bdc:b0:3e2:86b6:9beb with SMTP id
 adf61e73a8af0-4014e06961emr11677858637.74.1795517014565; Tue, 24 Nov 2026
 02:43:34 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1795482456.git.arisa.snowbell@gmail.com>
 <2ba4e27796fb1777481bd91d8467439a85542a42.1795482456.git.arisa.snowbell@gmail.com>
 <sashiko-outbox-230755@kernel.org>
In-Reply-To: <sashiko-outbox-230755@kernel.org>
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Tue, 24 Nov 2026 11:43:23 +0100
X-Gm-Features: Aa3M54qP-NAC3_Km_uflhMRaAjWtVrFKLmGDZhabjv91y7rOlkT9jOilb95geBc
Message-ID: <CABpa4MCdAqTFmThGHjcDt+7RuJuH=iTJ-ccUvNEfjCNoY6NyoA@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu/userq: don't restore user queues during
 system sleep
To: sashiko-reviews@lists.linux.dev
Cc: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It needs ensure_ev_fence() to return an error to its ioctl callers. I
can look at it as a separate patch.

On Tue, Nov 24, 2026 at 9:56=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [High] drm/amdgpu: infinite retry loop in
>   amdgpu_userq_ensure_ev_fence() [1]
> --
>
> commit 1073e972cefe081a3547954bcb099da6f1184516
> Author: Arisa Snowbell <arisa.snowbell@gmail.com>
>
> drm/amdgpu/userq: don't restore user queues during system sleep
>
> This commit blocks user queue restore work from being scheduled during
> system sleep preparation and moves the restore worker to
> system_freezable_wq so restores do not race with VRAM eviction.
>
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_userq.c
> > index ed6f3b67e8720..7960341f7f84f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
>
> [ ... ]
>
> > @@ -453,7 +464,7 @@ amdgpu_userq_ensure_ev_fence(struct amdgpu_userq_mg=
r *uq_mgr,
> >                * Looks like there was no pending resume work,
> >                * add one now to create a valid eviction fence
> >                */
> > -             schedule_delayed_work(&uq_mgr->resume_work, 0);
> > +             amdgpu_userq_queue_restore(uq_mgr);
> >               goto retry;
>
> [Severity: High]
> This problem wasn't introduced by this patch, but can
> amdgpu_userq_ensure_ev_fence() loop forever [1] if
> amdgpu_userq_restore_worker() fails to install a new eviction fence?
>
> When amdgpu_userq_vm_validate_and_restore_queue() fails (for example
> with -ENOMEM), amdgpu_userq_restore_worker() exits without replacing
> the signaled eviction fence:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:amdgpu_userq_restore_worker() {
>     ...
>         ret =3D amdgpu_userq_vm_validate_and_restore_queue(uq_mgr);
>         if (ret) {
>                 drm_file_err(uq_mgr->file, "Failed to validate BOs to res=
tore ret=3D%d\n", ret);
>                 goto put_fence;
>         }
>     ...
> }
>
> amdgpu_userq_ensure_ev_fence() then sees the same signaled fence on the
> next iteration and re-queues resume_work in an unkillable loop.
>
> [1] https://sashiko.dev/#/bug/linux-d9fc724f-ccb0-417c-8973-b83fdfc48280
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795482456.=
git.arisa.snowbell@gmail.com?part=3D1
