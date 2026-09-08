Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC4E3537C8
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 04:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788842635; cv=pass; b=GM8vBA6ZxPNbLiR3rKLGsp+SNvKZtFAAkL3XSA6k2zCLfoDg9aQ4QhqVfkNdpQawb2IJTv79JA0NCHYuLMw1zA5lyyKv82hjZDdiaq+FCS13Dze5NTyptLysyo5AyxteKE2WSxwvrKrk275iSvkGTjG7WJPiPO8u7yBU6Aje0yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788842635; c=relaxed/simple;
	bh=8vsteFJKg7AwDfREPOwh3IZlj+5W2Opz5jTY9fZZN+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zo3GKncRl9M6mDMMn2K/tJwFFYmpc1WJ7aXNzdvD6sxoe3zCzLIwZJbOkPAJPiHbimNYqX2qzk93a9/m18m/UXn7hHB70Q4o4qDFep5M75gQDlF3Rm68/9Ha04AMgp0B7Pqa4DY5ZrZMIHqsww5a0G3Xmq0cLCgzNVVPAgp6s54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=fLqwh66T; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="fLqwh66T"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c262898a2e4so34261466b.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 21:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788842632; cv=none;
        d=google.com; s=arc-20260327;
        b=WcyNbgjNY1Lfb4ll1E2C3qzEHpOy6BVJnw7XGk3u6O3RoOuGQ3c7t5XMh4T3rzCWWg
         OaRSKQ+n1EChHjjP1IcaX0KBMXAlHw3x55UCtMtT8NKmUutt9iOrv7gw4nPN3V4wlf+W
         Z5p/AaqlWgdtFWk/4svQQDV1erL2bTFaw98aL6qvptlSQNKCUkWMElcHNJH6/h4sFfhn
         I140jl7aLzLlGbQzAEvwjxAwx9pVdvzYounIQT0hXBKEEvTqO2UaNW2jaExlC/UuZmcM
         xGxzf26BHOTp22OOu99XK/8EAGjZt7FIIvIGmbT9SQpc4XQHqNYL8cUUv3/+fU3nTeus
         QVTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DPxar+zPdGaJ5HhOGiKhNQM3J7uOCr+14/bCQzXtVzc=;
        fh=mTP6TkWV1IhQRgyhsEpYqIpiXvhDlZKdHAfNRdOTDjk=;
        b=YGo2OvHbgYyeLIz44Ihbun7RL/AhOdGe+ZOPC3NrFiljCJP/luTs9zubZHhOv/Pim9
         snrpzxNhCHXWreXHtKhqU5KiZ/EdQI9qgnbjplcO7eSZhw1cDfVFmlCmQOERS5FKC65f
         BSf7bgqFyTC7dSCAj0LVBRfoZ7AmhEk5Cbsd4z3hR/QSDFI/SAcBldt6kCWIMm82GS+0
         La+YMVPsMqCq0Q90zWJ08CbmpHAPk9J8tiXSX8wc5N2M7yWN61dEVluXpmF87pypJXtu
         5kfCfegOckTvV0/D4iMJ0B5uGAkspXu5m71KXEo/na5w+oP2Q6oVl6oT3yYErpBCK9wV
         +E+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1788842632; x=1789447432; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DPxar+zPdGaJ5HhOGiKhNQM3J7uOCr+14/bCQzXtVzc=;
        b=fLqwh66TemSE7fyZx9r9QiZC0lE/82pnMK6fl8LryT0BnrGVuJRQ7cd3IXDb5YQzTp
         qD1f8oK9XpMmPYRDYS+XexS0P3V3E/X6zsFkCGPzdksWEYmdU0IrKO5KeoOwq5dHAE+y
         qL+hzfmw64+uJWzoGP4ZvjeSs6r7EVFejQLhuZo68JgT+f1WRRKMJ0bIMj2TF/70I8+r
         ZoctVGWNMLi+GHBE+9a9fPfvLCXRB9yB1qCtnS+Cy3YGEp5xwJyw+8cvwvG3ZCXR7FEt
         D75oFUhwxNGBL8G9piRaIsIpTYIv/h4veLuM9Hw9FXjI3TX5CHic9v3GMG22XOtx/hxa
         MnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788842632; x=1789447432;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPxar+zPdGaJ5HhOGiKhNQM3J7uOCr+14/bCQzXtVzc=;
        b=YxOUoD5sKgtZQJo5m23Bck19cqZWeU1jkAzdrwI2ZU0W0AhVjOxkWPwpm1ryvSFxtR
         CATSTlsTXEerePutH4f/qzKLU/nzVQ/7DZmiSgHLesaW/qtrxBxHMH1l/Cv9nbmvB3oA
         QEamVCphC0Kv7ObySJrBVW0E/TgN5kgMErsrxIWepo67UYb6eqLlep7I1dwc7ycUj1gF
         UQDGCF8TrNAxhYxyWRP2nDOGAMfYL0Rxe2CM5dV7qxklqpZ5FYsnh0ZvxacDV5CcdGgK
         3ADgnX4jR+UGMhO/oAHp5ZXvN3V4rZMxogcdxWke98goMcZQoWedktKzhB0nlvC7tI+F
         CQgg==
X-Gm-Message-State: AFuF++kiou2LpEs9/dRg2LoqvteBLNYXd16HNJHZtassw7M1yxIM3RRo
	lZJcvLWJ5xJ4RDtE5lXUEGbizZVJbt+q0XG93ZsanMF9emFJvC4Ov20rnpONO1odh4aKkdxeNbO
	wRet1VdnCMy/k5Zo4/Glf2S0llH+9BZZEusOuu5Ps83+ANDm33eaJM7c=
X-Gm-Gg: AYBFou3l5vfUmh3Z6F66VWTObSeCcQe3AnltoD2FLK4yB7UxDrbC1mtBOklznCbgtC8
	rcj8viu6YB57H+jHlSrgy+6vIEHK4VLoWcD2eif8FSViMekLSyLw79jBNa+zduFBFXQkKlOS6gY
	8bJ38L/fnZA3K/9JH57i+SGKAi6UVlbxbDth9AUdfyTwVYlYR6xq/FRNFRhB5D/wJ5nu/j5sVoj
	OPXVKQ5L7segVbACdB1Pik9T48B9QUmDgGlw2tlFlyy+EiNuG8MzFpuca7Za4+FQiAl/+0uVr7O
	TeQYp4k/+YUO0/NLdKgHHNEYfivrP4PKSIl7ccCQUlKCxw28kEO3g9JlU4Qk2EhZsoUnikLBWHN
	5fQ==
X-Received: by 2002:a17:907:c1b:b0:c15:ccda:26d5 with SMTP id
 a640c23a62f3a-c2612b8e83fmr1061905366b.4.1788842631880; Mon, 07 Sep 2026
 21:43:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907133929.1081540-1-jinpu.wang@ionos.com>
 <20260907133929.1081540-3-jinpu.wang@ionos.com> <20260907135604.280C41F00A3D@smtp.kernel.org>
In-Reply-To: <20260907135604.280C41F00A3D@smtp.kernel.org>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Tue, 8 Sep 2026 06:43:38 +0200
X-Gm-Features: AcwNN1WZMVuMvqYmLR--l9kFxspZma9xmdbpzkfECQwjUT0fbxCOEuZeQejf8gs
Message-ID: <CAMGffEmU4HovbTB=E12kw-HFa2EgKQmf30-cbG8tBvpi0cD5fg@mail.gmail.com>
Subject: Re: [PATCH 2/6] md: pass a queue_limits down to ->hot_add_disk()
To: sashiko-reviews@lists.linux.dev
Cc: linux-raid@vger.kernel.org, yukuai@fygo.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 3:56=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [High] `linear_add()` ignores the new `lim` argument and unconditionall=
y calls `queue_limits_set()`, which will cause a deadlock.

Will fix in newer version.
>
> Pre-existing issues:
> - [High] Missing limit check and queue limit stacking for replacement dis=
ks in `raid1_add_disk()`.
> - [High] Missing limits update and stacking when hot-adding a disk in `ra=
id5_add_disk()`.
> --
>
> commit 37bd7159af00deb7b9d45549d34775a10b587170
> Author: Jack Wang <jinpu.wang@cloud.ionos.com>
>
>     md: pass a queue_limits down to ->hot_add_disk()
>
>     Adding a leg stacks its queue limits, which mddev_stack_new_rdev() do=
es
>     by taking q->limits_lock itself.  Callers that hold reconfig_mutex, o=
r
>     have the array suspended, must not do that: the lock's holder waits f=
or
>     I/O they are blocking.  They need to own the update instead.
>
>     Give ->hot_add_disk(), remove_and_add_spares() and
>     md_choose_sync_action() a queue_limits argument, and add
>     mddev_stack_rdev_into() to stack into a caller-owned update.  Every
>     caller passes NULL, so no functional change; the users follow.
>
> > diff --git a/drivers/md/md-linear.c b/drivers/md/md-linear.c
> > index 73b367b61b873..1f44c2d7db93d 100644
> > --- a/drivers/md/md-linear.c
> > +++ b/drivers/md/md-linear.c
> > @@ -186,7 +186,8 @@ static int linear_run(struct mddev *mddev)
> >       return ret;
> >  }
> >
> > -static int linear_add(struct mddev *mddev, struct md_rdev *rdev)
> > +static int linear_add(struct mddev *mddev, struct md_rdev *rdev,
> > +                   struct queue_limits *lim)
> >  {
> >       /* Adding a drive to a linear array allows the array to grow.
> >        * It is permitted if the new drive has a matching superblock
>
> [Severity: High]
> Does linear_add() miss using the new lim argument?
>
> Looking at the body of linear_add(), it unconditionally calls linear_conf=
()
> without passing the limits down. In the final state of this patch series,=
 when
> the caller already holds q->limits_lock, linear_conf() will eventually ca=
ll
> queue_limits_set() which tries to take the lock again. Could this lead to=
 a
> deadlock on q->limits_lock when hot-adding a disk?
>
> [ ... ]
> > diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
> > index f0646fb24371f..dd348b5695d06 100644
> > --- a/drivers/md/raid1.c
> > +++ b/drivers/md/raid1.c
> > @@ -1898,7 +1898,8 @@ static bool raid1_remove_conf(struct r1conf *conf=
, int disk)
> >       return true;
> >  }
> >
> > -static int raid1_add_disk(struct mddev *mddev, struct md_rdev *rdev)
> > +static int raid1_add_disk(struct mddev *mddev, struct md_rdev *rdev,
> > +                       struct queue_limits *lim)
> >  {
> >       struct r1conf *conf =3D mddev->private;
> >       int err =3D -EEXIST;
> > @@ -1923,7 +1924,10 @@ static int raid1_add_disk(struct mddev *mddev, s=
truct md_rdev *rdev)
> >       for (mirror =3D first; mirror <=3D last; mirror++) {
> >               p =3D conf->mirrors + mirror;
> >               if (!p->rdev) {
> > -                     err =3D mddev_stack_new_rdev(mddev, rdev);
> > +                     if (lim)
> > +                             err =3D mddev_stack_rdev_into(mddev, rdev=
, lim);
> > +                     else
> > +                             err =3D mddev_stack_new_rdev(mddev, rdev)=
;
> >                       if (err)
> >                               return err;
>
> [Severity: High]
> This is a pre-existing issue, but I noticed that further down in
> raid1_add_disk(), we add a replacement disk but omit any limit checks:
>
>         if (err && repl_slot >=3D 0) {
>                 /* Add this device as a replacement */
>                 clear_bit(In_sync, &rdev->flags);
>                 set_bit(Replacement, &rdev->flags);
>                 raid1_add_conf(conf, rdev, repl_slot, true);
>                 err =3D 0;
>                 conf->fullsync =3D 1;
>         }
>
> Since mddev_stack_new_rdev() or mddev_stack_rdev_into() is skipped for th=
is
> path, could this allow a replacement disk with incompatible queue limits
> (such as differing integrity profiles or larger logical block sizes) to j=
oin
> the array, resulting in data corruption or I/O failures?
>
> [ ... ]
> > diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
> > index b91545ce090de..0ec555ada64a0 100644
> > --- a/drivers/md/raid5.c
> > +++ b/drivers/md/raid5.c
> > @@ -8441,7 +8441,8 @@ static int raid5_remove_disk(struct mddev *mddev,=
 struct md_rdev *rdev)
> >       return err;
> >  }
> >
> > -static int raid5_add_disk(struct mddev *mddev, struct md_rdev *rdev)
> > +static int raid5_add_disk(struct mddev *mddev, struct md_rdev *rdev,
> > +                       struct queue_limits *lim)
> >  {
> >       struct r5conf *conf =3D mddev->private;
> >       int ret, err =3D -EEXIST;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but I noticed that raid5_add_d=
isk()
> does not stack or check queue limits at all when hot-adding a disk:
>
>         for (disk =3D first; disk <=3D last; disk++) {
>                 p =3D conf->disks + disk;
>                 if (p->rdev =3D=3D NULL) {
>                         clear_bit(In_sync, &rdev->flags);
>                         rdev->raid_disk =3D disk;
>                         if (rdev->saved_raid_disk !=3D disk)
>                                 conf->fullsync =3D 1;
>                         WRITE_ONCE(p->rdev, rdev);
>
>                         err =3D log_modify(conf, rdev, true);
>
>                         goto out;
>                 }
>         }
>
> Because mddev_stack_new_rdev() or mddev_stack_rdev_into() are not called
> here, and the new lim argument is ignored, could this allow disks with
> incompatible limits to be successfully added to the array?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907133929.10=
81540-1-jinpu.wang@ionos.com?part=3D2
