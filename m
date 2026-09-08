Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7715233BBD7
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 04:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788842524; cv=pass; b=rpvfUZniaC/SgmljpA8VgJvQJW8Ec1UavVfEJkaCf7Mod7VWa0gs6iIdjrvxjPxXzWNSkwrU+v8vYisMkcYIQM++g4F66J8j8BVq+rheToebPGN6jll58NB84lMnW2r8MnXGJ0Gvhq13F+KOfIUSg9brVZaWrXiM+j8GTZFbSzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788842524; c=relaxed/simple;
	bh=f1XqeoAEip/DeuKd9XScQmPGW2xcgntQWIHluZz8cS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HaQJnAtb2DTb7BLei4UTJEZhs4bXRLwHDZtYC3nlFP1YaVIPbqbKpX4wLVAaKqMEj7ZvllUNyXeYsSZGlAYAtORNXww73Mpu30QT9arx6VoURXy///xD6ex5td+Cd3OcNaPf7MHBHaBTgD4Ch6De6Qci7lwVlfRoR+iS4JLI+S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=PeXfO1Ey; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="PeXfO1Ey"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c25331b31e8so53220166b.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 21:42:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788842519; cv=none;
        d=google.com; s=arc-20260327;
        b=LkChufOMFNDX6gVgG0y7zdOEcckwjGmqq98IbQlZ7U/G6wwwcNGmF5RaWU3By4DvCH
         HQU6wSc5BRVVctnsflXZiDfoCth4P31fa+iLXuD70u10G1PXRDrZa0zZUNrpyqe0SgnB
         t7QMHVqgHePjYdeBl+SzEh6XvYfAIG4/UppecFK6jGySSmTX0FTwmSpF3Ihkz1jrKZAk
         GDtn4YjGq0rUVShrV7oyRYdptiTQVg+71sckCJZscd0Ylq+ilIa1eatosBIyI+DfYZXr
         llwPgSOIQ6/L+yv2PjYuOibWyLYHvUzntUgB3bZsN7pQJi0Cx2uyDE3EYkqXy9Pd48zR
         TiOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ue0jLKQ+Hf10sAp2yxQnkGsowZkX0lyRhEiw2uRiGi8=;
        fh=mTP6TkWV1IhQRgyhsEpYqIpiXvhDlZKdHAfNRdOTDjk=;
        b=mN7eQMkZBxS3lpTveeePGm489E6FgpJav6azNRe8zDT4SaRABJ4a5Gq9hcMc/XS+7E
         3xDeye3H87B4R1HsA7pHyjSqZfahkXcoKBmVdgilFqv+2jOdwx5e3HJwCETt5wZ++OVI
         r7m1GbFY3FhICCCeCk89k+DLS9+D7fMDE1ojsY5J+gQe5JThNCY0veJan4LRyMGmuxgB
         07r2Z0MfFoHPsX+LvcuIeiwPAXhPy7kc/vme3xmZqbqnhFVLrxDBxjObu5DzysSkhMyq
         ZEOaVj/XJie8xoWK71DSkDYwqk6mBb8dfNX2Z5JV4uG2ah81cv/ak3k6j5KeiWm51Abq
         UgqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1788842519; x=1789447319; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ue0jLKQ+Hf10sAp2yxQnkGsowZkX0lyRhEiw2uRiGi8=;
        b=PeXfO1EygVqR/yQ0xAxWR9bLD1m3Ip5JDN63oQ/8cylsmOpUL8J9T8SpYaGTqkgGJw
         SBID/VoBdNPZhIVFXe6aP6zXJQApiyEjR7KFom22NORpWY5xmwsiXqGKYa/frj7hJQV3
         pnGI3UtgVK2U3IBw3OFLm+Ai+0BFRg35VgIKP53RBS/7yoOq/z4vMfvaBLiMvb3WvOGD
         XTf1DHIsDo35PfhCrQ+9WL/ef8swd8UsIgcmV0dXw2cPeKwavDrjCDszRCUJiMePdOW+
         K1usBUrTz1BOGsFw4yGs9+c2ms3EXv5H+30D6JzizsfVOCJbtKc3GzH+aEv/p8u9iqgN
         I6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788842519; x=1789447319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ue0jLKQ+Hf10sAp2yxQnkGsowZkX0lyRhEiw2uRiGi8=;
        b=D1SxrK8CBc61HIouaNNPFAFUd+3qx+RP2eg0CD2j1XERcPnU0MXoam62FrcQOMTZer
         fYPnM8SamkjpvgVE0de/kJ1w4Ma1Ievih4kdGVB/VkXOKDZ1DU7r3ZvcSWCZkkEAV0Za
         PcffgdEJPcbml1x5gJ87rmdhsU3Efgp6YXaxdSqS+7B7obui/b1CAYTP7C1C5aQZtmk/
         0WgZ+40D4a4lJukR3lm5nwMBdmHrMDQB1uL+og9QWcv0EwtpMD7GePNaZQrneJB9UZiS
         wJHvulazIZH5Mwll2IWoQlRzEUV3aRXc+Ij2BJQ2ucX29Y0/UTq40L3h1nK9FzleDk5F
         TjTA==
X-Gm-Message-State: AFuF++kHEBy9cfSrjX66SFw9mTLIBoAIZObKzkziiqjVkde9zVPbIOWg
	MwdT+5TsZx/HwW1sU5pbf9tToqd+vqU91ptJUGIh48pf4v/db2614wDtIq8qdhF0ImaJGth9zfr
	6oT24lXofMKMgGa6gFz0LcVLBZyw55/YByTj4l4idwW61F21n/UCC4YU=
X-Gm-Gg: AYBFou3qGFVAWjZPSMjNT30XOhPcc4/80JMSCsGIhA/J/S4qnQZNtkdU8MoZSPd5cg6
	YCOuKMbh+d++deB2HmHZ7JmMhlWKS5dZa+ycPYP3lWgUtGVvgHT/K9taT5QLftofp8xrLT0vota
	XeaCFTxE4B/VhlI1TxMeoCQFCXnDpc7BtdIeVBW0kTPp8AdgvRV6OT454Gq2Xe2u28EifhVf/sl
	SilbxMlawyXp82gAtE772rtvj9cK2q3FfLVazrTMQNkKqk66BCclDWkMoDEOicDgATcQJqeRXj4
	xBfet/xU/70Ld+OK1SlXGiFDnjj5nrmtOffqNB1HAMowaITwlCG93xluv4ERx/FGs8wwmYX2hsQ
	FKw==
X-Received: by 2002:a17:907:1c24:b0:c12:6db4:4bf4 with SMTP id
 a640c23a62f3a-c2624cfedbemr665568666b.0.1788842519398; Mon, 07 Sep 2026
 21:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907133929.1081540-1-jinpu.wang@ionos.com>
 <20260907133929.1081540-4-jinpu.wang@ionos.com> <20260907135639.E94091F00A3F@smtp.kernel.org>
In-Reply-To: <20260907135639.E94091F00A3F@smtp.kernel.org>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Tue, 8 Sep 2026 06:41:47 +0200
X-Gm-Features: AcwNN1U9WnkAtjej4J11dl3FcyV5-KnldfWFEEgJbRa0FZLwPFjZ_6PMto2EQHw
Message-ID: <CAMGffEnqEZhZuVJc4vBG6fzDiFBbwx3w0Dv_UEqeS+_80f3eXw@mail.gmail.com>
Subject: Re: [PATCH 3/6] md: don't wait for q->limits_lock in check_sb_changes()
To: sashiko-reviews@lists.linux.dev
Cc: linux-raid@vger.kernel.org, yukuai@fygo.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 3:56=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The return value of queue_limits_commit_update() is ignored, all=
owing a disk to be permanently added to the array even if its queue limits =
are rejected.
will fix in newer version
> --
>
> commit 9dfb5955d3bac2bdadfd9671f084d71c343b76e2
> Author: Jack Wang <jinpu.wang@cloud.ionos.com>
>
> md: don't wait for q->limits_lock in check_sb_changes()
>
> This patch updates check_sb_changes() to use a non-blocking trylock when
> stacking queue limits for a newly added spare. If the lock is acquired, t=
he
> limits are stacked inline to avoid blocking on I/O while holding the
> reconfig_mutex.
>
> > diff --git a/drivers/md/md.c b/drivers/md/md.c
> > --- a/drivers/md/md.c
> > +++ b/drivers/md/md.c
> [ ... ]
> > @@ -10885,7 +10900,24 @@ static void check_sb_changes(struct mddev *mdd=
ev, struct md_rdev *rdev)
> [ ... ]
> >                                       rdev2->saved_raid_disk =3D -1;
> >                               else
> >                                       rdev2->saved_raid_disk =3D role;
> > -                             ret =3D remove_and_add_spares(mddev, rdev=
2, NULL);
> > +                             /*
> > +                              * reconfig_mutex is held, so don't wait =
for
> > +                              * q->limits_lock; MD_RECOVERY_NEEDED bel=
ow
> > +                              * leaves a skipped add to md_start_sync(=
).
> > +                              */
> > +                             if (mddev_stack_limits_trylock(mddev, &li=
m)) {
> > +                                     struct request_queue *q =3D
> > +                                             mddev->gendisk->queue;
> > +
> > +                                     ret =3D remove_and_add_spares(mdd=
ev,
> > +                                                                 rdev2=
, &lim);
> > +                                     queue_limits_commit_update(q, &li=
m);
>
> [Severity: High]
> Is it safe to ignore the return value of queue_limits_commit_update() her=
e?
>
> If blk_validate_limits() fails inside queue_limits_commit_update(), it re=
turns
> an error and the limits are not applied. Because the return value is igno=
red
> here, the disk could still be permanently added to the array even if its =
queue
> limits (such as incompatible integrity profiles or alignments) were rejec=
ted.
>
> Previously, a failure when committing limits would abort the disk additio=
n
> (for example, in mddev_stack_new_rdev()). Does splitting the limit stacki=
ng
> from the commit and dropping the return value bypass this safety check?
>
> > +                             } else if (mddev_is_dm(mddev)) {
> > +                                     ret =3D remove_and_add_spares(mdd=
ev,
> > +                                                                 rdev2=
, NULL);
> > +                             } else {
> > +                                     ret =3D remove_spares(mddev, rdev=
2);
> > +                             }
> >                               pr_info("Activated spare: %pg\n",
> >                                       rdev2->bdev);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907133929.10=
81540-1-jinpu.wang@ionos.com?part=3D3
