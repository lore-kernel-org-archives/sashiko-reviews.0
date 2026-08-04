Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CD7416878
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 18:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785869073; cv=pass; b=sLUBiwFjkN2p1LRWKIrLEYXBlRTMZcirOFdSOIVdaFSu+9Y05aBLWctjMaCzEScuP1iL71+3ZdIdezvnvNlJSmiU5S+yg3C5sVeE5DROUevyFTl4YJeQLAw/pO+5aDdoiuZNJC7FpwoDcfhFMSZ0HZ6NZ0A7kYf4KvSs1ialP50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785869073; c=relaxed/simple;
	bh=Bu2cU4ibqae3k58776JwLs54knMu3t9+XEkSXXc1FRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MvSr6ZJtnQCdNlmKOH7PUTaDNTFXmJnOYFogDYnIlTbef0zOomigctKD6LBi+0fQ5Dq/DYBS+Tt1YUgxOJTcL6KuJUzUrytVT2308l4s+QurB1mU96LLiKhJTFQFji+KjRxWkakH1q9W0J7zOMswvwyIl54V6PF2ruKwf7dXkMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=ZggmapVw; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="ZggmapVw"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15c1f1be0bso2703966b.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 11:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785869069; cv=none;
        d=google.com; s=arc-20260327;
        b=PS1ySjtCmsb/+bMulsNLQPQLWUUpcuyvDukk6MEu6jh8iEAWF9/Wbk31r0MCUGaYdE
         9y8zf0NKN6Zi5aJWTodLwi8MLKaC1amx30L0RNy9r86ypuIwGIQNipuoYWSN8+6aILqL
         0q7d/rW6JMkCkWfjv1IuJpj62mZ/K3dqrYfF/Yzo2UEOwWuD/cp1X5UUs9SeZn7/e0JL
         K6zBzDjIj114M9GP00I8C/jQ9acG5VfQ3XS/UbzrOxILL7wM4jXoyBQcejHpcSTaXijR
         G3zSMgKDeV2rDzk+1wWpiQB2Fb6diOwkO9BE3Ty8DdegCnw0E0waPGQNV92X6dzfg00e
         LlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yOcdgk1wdFj1Z6mmAZGKU5LAITNpPVAwHwOExpuoED4=;
        fh=R7ITYP0dP+GTNq1raVt0oZn7mapsqsrv19YFdFDXlX0=;
        b=ZqFGIXpfayMjVGncvbp/GRqp9jtw6HcFtaV+CSlrqG52xpKbCgb2iQ1jvnVhVRY1rT
         3Z7plSZRorGOcy2SuWhJMV6yhKNSw0sqjFUwKEc73+7RpebX2u3myAjwD2VlwtESKWi9
         Wex/Htdnz1jaiSFLmKJVl3bYFgTdZhIbwO/cAxb427UjUZBspsbDbdNWYJw2hwa8iPpj
         lrhYvR/R82hmpuumevl/7KB0wu7sybMhxbWPcGXghbX+QITk3uR58k2HfYeF+DRIJcZk
         WFPuwaCbaz8o0HJ3qw6qdKe+c35sACht4G3lxRS+EYzws6Ymr+8ZSptjKDhUvZvIGr8o
         D8zQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1785869069; x=1786473869; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yOcdgk1wdFj1Z6mmAZGKU5LAITNpPVAwHwOExpuoED4=;
        b=ZggmapVw2yXvaCVE2OuKMh0SrZA48F9aOqcoyQY4xzRoaBiUPFZS9aJQnkZkP9usxE
         AXWnmTfR5X+qdMyb9Eg4ATJjKiMZq/WQwo/ejwioMwZGOTKDi7e43rvU9c560ntmNI2s
         NcBY09U9dJ9LrHDr0Zox2pVw7eKjsAP3k8HWqgL2D8UfoSAGAaDDbCIubPbiu3xvoZ1v
         moDrEB7HNcVCXUsctap/lLd6vPRvDzJXvvFE9DKo1yyR979YBVsa1EFqU0XqYMmwMJY+
         fkwEBfSjWk0S4sy1nMDZL87g+EObmR6MqlfPFqe7GiBkt3nnZv16XeBNHX50oY+uHeoc
         AhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785869069; x=1786473869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yOcdgk1wdFj1Z6mmAZGKU5LAITNpPVAwHwOExpuoED4=;
        b=b8Dt3J7exv2CJOFn57vqbkpb+wi2DPrvncIm/ncJCHsr9QhfNxWPeIciUnIytOXZof
         PrmRNjj2zOOoNMlNVsNtGLnU2iN6rZrPhVcm4y9V2S9ZhCvCtnov3IZNihaxUxU60fXs
         /D82p67zmUBr6awDfbtQptBGA4ClWg+SV3JTkrPFiZKbKuTO8nOVvHJrL1+gnK7QI2Qd
         ZSXOj+8ta8OborcFPKcLC11eCZpneQGVDqAyvjlbAWG4AcxZyvgckuQW87JuyTGdi4lI
         NSPTYPB5u7JUUNzQFyDGuPczUCHvM1XK/J5LFAC5QU64eckoFq56fgKzS2TttQT7pi+V
         BqnQ==
X-Gm-Message-State: AOJu0YzyPmsSuv91cyQx5YXFNEhTMYWjENixgQ/Cwa4tboj9s5F8Rc6p
	4gDQOLKqzgxO5yDyJVZG5jfke+TF/h725vhNkSpqOrWelL6LhJ1LtyomY8/lVwA446pa6mmyTMC
	4ZGNLSTxSs9RXOMuE/9jE6dXQ4uMvBWbLRX6RKe3uXTeLmUF2B+Yinjg=
X-Gm-Gg: AR+sD13ddqTudyzwuu2LXJG2zHBg7N9gGlTFCmG+0EJzyvsep6sKp+Zxjrf/kRRGXfi
	QdHZDISO9JYMa3MCjeGHBF4dPjyxMBXOe0lPXC/zEPna06a8ljOuxuFm3f+CRxoZ5JlqN+aRBBi
	a9cUZnW+BT4Uy7egQVjSeOkUEgSYiJga4cnoPM9svFpY8fRVb/lervs9lG6wsQAnC//xTuLtP3S
	9kZhGQTyIPmkpg6J90f897pj+zybhDcQdbNQjhJndmoIM6j7U6Pod2oBNUwbk5ykkKalHt7kDqb
	CJffPXLpY1RfrFQM1MQ9LtBrhUK+5ckQAbFF/foSZRvKzMdfuaLBaccge5tig+T/7rKcwO5hn7M
	sMqPNb7tkV88e
X-Received: by 2002:a17:907:c386:b0:c20:38e2:b355 with SMTP id
 a640c23a62f3a-c2039f6e614mr14509566b.4.1785869068883; Tue, 04 Aug 2026
 11:44:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717051233.383373-1-jinpu.wang@ionos.com> <20260717052537.611431F000E9@smtp.kernel.org>
In-Reply-To: <20260717052537.611431F000E9@smtp.kernel.org>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Tue, 4 Aug 2026 20:44:17 +0200
X-Gm-Features: AUfX_myONWp2_qNE5Gm8c2FQvZV2SEBhEWxgv1arpWXFMYsv0UFPyK3w759S4lo
Message-ID: <CAMGffE=gipMNJkTLoSBj26mGWsTmp2aiFKM3yRe12BdjwWftBw@mail.gmail.com>
Subject: Re: [PATCHv2] md: clear MD_CLOSING when array_state_store() bails on
 interrupted lock
To: sashiko-reviews@lists.linux.dev
Cc: yukuai@fygo.io, linux-raid@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Regarding the pre-existing issue reported by the bot, it is not
related to this fix and cannot be triggered in normal cases, so I will
skip it for now.

Linux RAID folks, do you have a chance to check this patch? It fixes a
problem we hit by chance.

Thanks,
Jinpu

On Fri, Jul 17, 2026 at 7:25=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Calling `restart_array()` with the `mddev->lock` spinlock held c=
an sleep because it clears the disk read-only flag, which triggers a `GFP_K=
ERNEL` memory allocation for a uevent.
> --
>
> --- Patch [1]: [PATCHv2] md: clear MD_CLOSING when array_state_store() ba=
ils on interrupted lock ---
> commit 3ae9b81fbeee45b412994652c2c3b3ac1b35d177
> Author: Jack Wang <jinpu.wang@cloud.ionos.com>
>
> md: clear MD_CLOSING when array_state_store() bails on interrupted lock
>
> This commit ensures that MD_CLOSING is correctly cleared if
> mutex_lock_interruptible() fails while writing to array_state. It introdu=
ces
> a common exit label and a boolean flag to track whether the flag was actu=
ally
> set by the current thread.
>
> > diff --git a/drivers/md/md.c b/drivers/md/md.c
> > index d1465bcd86c81..7b7a4d9259079 100644
> > --- a/drivers/md/md.c
> > +++ b/drivers/md/md.c
> [ ... ]
> > @@ -4696,7 +4698,7 @@ array_state_store(struct mddev *mddev, const char=
 *buf, size_t len)
> >       }
> >       err =3D mddev_lock(mddev);
> >       if (err)
> > -             return err;
> > +             goto out_clear_closing;
>
> [Severity: High]
> This is a pre-existing issue, but just above this code in array_state_sto=
re(),
> there is a fast path that can sleep while holding a spinlock.
>
> If a privileged user sets the md device to read-only using
> blockdev --setro /dev/md0 and then writes 'active' to
> /sys/block/md0/md/array_state, the code acquires the mddev->lock spinlock
> and calls restart_array():
>
> drivers/md/md.c:array_state_store() {
>     ...
>     spin_lock(&mddev->lock);
>     if (st =3D=3D active) {
>         restart_array(mddev);
>     ...
> }
>
> restart_array() unconditionally calls set_disk_ro() to ensure the disk is
> read-write:
>
> drivers/md/md.c:restart_array() {
>     ...
>     set_disk_ro(disk, 0);
>     ...
> }
>
> Because the disk was set to read-only, set_disk_ro() clears the flag and
> triggers a uevent:
>
> block/genhd.c:set_disk_ro() {
>     ...
>     set_disk_ro_uevent(disk, read_only);
>     ...
> }
>
> This calls into kobject_uevent_env(), which performs an unconditional
> GFP_KERNEL allocation:
>
> lib/kobject_uevent.c:kobject_uevent_env() {
>     ...
>     devpath =3D kobject_get_path(kobj, GFP_KERNEL);
>     ...
> }
>
> Can this sequence cause a sleep-in-atomic bug and potentially lead to a
> deadlock or panic?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717051233.38=
3373-1-jinpu.wang@ionos.com?part=3D1
