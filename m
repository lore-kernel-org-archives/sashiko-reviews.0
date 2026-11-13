Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794559882;
	b=fajnzhyka8h8Y883FKF1iZILObzSAOrHpmlAP3iuKY3Ay3pQQcythOSNqf4oKuk+W34D
	 GTt43pZql9BZVbb8wI8oLGxHFn7yfgRZ96/yBKs0QDd3E16dibmdSHF91KEn8JwjXLB+k
	 hweeOl23zKxFLSQZOfYx4qRF9+VOElLRUhZWKqd6DJK4n3mHau33/TZnIQEoIQncPWSE2
	 bKkVVN54Jx610+b2Kw990ypx5m9IsQXkuzT2+O5ZbfeXkYmJcMX6O9Z3UkhHpDlQbGtBj
	 w/h7+dtfScmhEHtbaIpTIA7Gt9E40Qf+JMpyd0TilQZkDVVvCnKaFWtXD9U0/vZS18g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=c5yfwfHf+asJs6SrRY3FRltZS6t5SdBG+HqpZbiOuiQ=;
	b=CGSVE3M4o5Wrsu/YfD/RIS9KHfCl5aVAXzLB5jL/dYtIwF29iHEhce1JgQAPTBltxBog
	 zInZ6fb4PMgm4ECmxpK4m5ZXdHAF59b9QJD1V1LOM9OhKAHudANReASdgCcolW+rDWHZB
	 AoRJ/ubobVfiBEAoBe7uvjId2tYcPJCnA0g/SF8Ixw5XEL4IBEA5Zdm+dF2W0kAveXL/O
	 gs51RWQ0DONu2DgbNYtidhjTjr5rF8537MsA4+iFPC2jan0Bqh+5PxLDXDqK47mJYHnzL
	 ENH/zruk7wprn0kpHsAxPXh2l+QfIofOlfk4D0f65QTzuFrbWWXkmaFHHJ9DbEJeQ5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloud.ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=dwNb019h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B44B606A33B
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 08:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B44B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=dwNb019h
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c154a41f8aso77444e87.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 00:51:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794559879; cv=none;
        d=google.com; s=arc-20260327;
        b=AZNhIcYmzvLGNO6Z8rCFbOAw4LNkssqUMLBoZMG5sKDMk5NJWrHMQhNc2y9JJ1e3Na
         d8s6eMlREr5KDhnmNYyAk/Ppe4S0nkeBNzh+Gb+OirmjGv4aKFfLlbCy1qwRp3fVn7fs
         mRvEXP1QWlrcHdggGL4B7rzpaNCyK1ffHQJGo3uJ/p5va2loYZm3gxMfzrA/XVk2JCkB
         Qn753v7sFIpClgWC50jkr9R3kLqnQdD46pMeI4uEj7pN6LeaM4uyiKKk4ghsUIYez59Q
         bDNP/VMOaXwxew/ptqfTXwlZ+V6GQj7z09vN6KPk7qkNGQsWIf8h0FvOOd/kbkBPKK9v
         KEgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c5yfwfHf+asJs6SrRY3FRltZS6t5SdBG+HqpZbiOuiQ=;
        fh=xfEf4U3/mTbTuvmAFNM+6rjXDb1SWxgWWQhBpEiSzjY=;
        b=EX6ZO7QVG3JXbGd3YuCDIcpCuPgwVhggpVLWRiASEqNw9CDYfKrrDTWB4tT/Ea10CT
         5qxNjOF6Aaa8kAVpN1alJcxpPyzrMd4Z+RQW7Nhj36bBGV7ov2qowjpE1nKE3hBzRr3i
         W7s0yXVzI+vK8An44xcnGJ5UUhyOYFn25KPA2zpm9vMLf9wjnhUfOhy/GOG/7kTgIxzD
         2xgScbzZuVTN0Rntzfgty6+SfVuh+VGhPVX/pMT8xRR/sj53/WCfuLFctRWWdsZXprZ/
         gwWWRzvv+BIcokEtOJEE019w96uBinNjIt0msgiqrqAj5DfLjPf+wa9JV6jNWkr6+cyn
         wmvQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1794559879; x=1795164679; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c5yfwfHf+asJs6SrRY3FRltZS6t5SdBG+HqpZbiOuiQ=;
        b=dwNb019hpxUi02IPtXQD0v1x4QJBmqhISypD+NE1+rvfV115J9XQwniuCdcXRSTg3u
         inJHhh9+c3B4ypQtin0w9AH8l+WaoJ1Fl/ryTVkpAEgeVtM0HawsdGkvZWMVya7wFxDG
         c75RZCnVZ3ddXeV6gfthkoQKnC8n/sW734yOIDBaisS844KWC4/AHHiCmGL5VizI5QN4
         I4YocLua9g+b4Wh/ff0C/cnmuwWZ4+omgVbDX3nQwftv2jhSuPSdGL6XS+NDgLJdvdV+
         mk1Rp5tpl72Xb0DMqbtMfgbTHS3vMHwHCfgsah98MNhaVvzR1/LxH/KxsAUgED2PsBdM
         W5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559879; x=1795164679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c5yfwfHf+asJs6SrRY3FRltZS6t5SdBG+HqpZbiOuiQ=;
        b=wOgZsfqLd5mIiNP7tLu0QdedEfTYwMHx0+UdTXfiPbbjs6RJ4od7RhUquPn8KjrCHQ
         GZpAraivsA+RmdxkH7aVq3K29/12Kqta+YkyjeAS1lL+BtjniCAnYrgl/d5tcWI/YG5F
         iMUZo9Kg/PUD2zp6CLiHI6M/ffS79mJdsvqIyBDGav6NrZOk8A8iOhhRZljXBxN2VeR2
         /DrrfzLiNUbPKHAucrIo/qtPA8UY8LnLwC+3cfTG/cG8WQModJFr1PzUMTu/6Z/LtHdP
         A2wsD/MkfY1rSs5ub9FI9p8vR7wZpgRs4wL/J6+9nVdPnnZ4DqxOQ5yJcIDvUxZ6/Jce
         zroA==
X-Gm-Message-State: APuU4Z+g3Uon47fW57RY+xK8o7l5asNRbeFbKv4wGTT4jliNeZoGzM/k
	r/pzxMl67diBrh0BqRQfHAzOvVDAAc8neMME/ojgcbhi+Zjr7m5p18d/a+n4RqROpaUDzDp9q2T
	wr8KEUz21b8yrX7DY0rirkbfCDYEHsTOR2is3iQtCNLf+xYrwSTqZ5OVKEw==
X-Gm-Gg: AYBFou2rz4iykP2kNKPlnc4JTrLviI45M0wV/bx4b68vIkv0vWQv0o1EJIN0T8YJhnQ
	ZIEoHV1dABIPSg1h7tlE65w6VRkwUGkQWyapOmB0ThcvlVLCPbO0VFBTnoYjFtXLWJa7I09m5K2
	semh2dHobnIloPx68NI42dhD5T5cdhyqFKcanVKZqq8LbG6XIpj6EO8vghjkzPLbL0Kgz1vj6FT
	1N6y0ofrAIaehEdgZiS11hztrmz1qGF4Z8VFjgRK2Ivb4SbPZ6yb9gDnSVtcH9IJMp+nTruh9lW
	WFrg5ZokMpizy2OsTfhC3xyZ30KiqxVAFW5mN/pLAi50KnIyjXeCo2abrTh3pVV4pvmjKPbOzmP
	4vlOXI2PZ1RC//f5ssDQ9baHmIgeoDMfKVH1JIJfQ8Q2dzjKc/O/18p4QE9dWz0ru50UzhQ==
X-Received: by 2002:a05:6512:108a:b0:5c0:b5c:4084 with SMTP id
 2adb3069b0e04-5c1705d663fmr750666e87.1.1794559879287; Fri, 13 Nov 2026
 00:51:19 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102154847.198472-1-jinpu.wang@ionos.com> <20261102154847.198472-2-jinpu.wang@ionos.com>
 <sashiko-outbox-193747@kernel.org> <CAMGffEmyXYooOq9b8=eyzmrsdVQJhogEKWPCvyVXecX9JN-C+Q@mail.gmail.com>
 <eec58ab2-3283-4296-82cc-eba8baaeec8b@fygo.io>
In-Reply-To: <eec58ab2-3283-4296-82cc-eba8baaeec8b@fygo.io>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Fri, 13 Nov 2026 09:51:07 +0100
X-Gm-Features: AclHuK-YWofwpGFGyk9vj7B4Lax9xn3pMwXf0YWSTn2EV7mRAR_Emyti5wjkn_A
Message-ID: <CAMGffEk0qFnPMv8RAdSSVqaJvDFcip4ktTP7uHYqRhTaZDK=Hg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] md: freeze the queue in mddev_suspend()
To: yukuai@fygo.io
Cc: sashiko-reviews@lists.linux.dev, linux-raid@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 4:44=E2=80=AFAM yu kuai <yukuai@fygo.io> wrote:
>
> Hi,
>
> =E5=9C=A8 2026/11/3 18:03, Jinpu Wang =E5=86=99=E9=81=93:
> > On Mon, Nov 2, 2026 at 5:20=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >> Thank you for your contribution! Sashiko AI review found 2 potential i=
ssue(s) to consider:
> >> - [High] md: deadlock in raid1d() and raid10d() due to queue freeze in=
 mddev_suspend()
> >> - [High] md: deadlock in mddev_freeze_queue() when reshape is interrup=
ted during wait
> >> --
> > Hi Kuai,
> >
> > Sashiko flagged two issues with this patch, and I think both are valid:
> >
> > 1) mddev_freeze_queue() checks reshape_interrupted() only once. If a
> >     raid456 reshape is interrupted or frozen while we wait for
> >     q_usage_counter to drain, a bio already in md_handle_request() loop=
s
> >     back to check_suspended without dropping its q_usage_counter
> >     reference. The wait never ends, because active_io is not killed yet
> >     and prepare_suspend() has not been called.
> >
> > 2) Freezing the queue before killing active_io deadlocks with
> >     raid1d/raid10d. If a read error makes raid1_read_request() split an
> >     md_io_clone bio, the remainder is resubmitted from the md thread
> >     through bio_queue_enter(). That blocks on the frozen queue, so the
> >     md_cloned_bio() bypass in md_handle_request() is never reached and
> >     active_io never drains.
> >
> > For (1) I plan to re-evaluate the skip conditions periodically in the
> > wait. For (2) I don't see a small fix. The options are:
> >    a) have the raid1/raid10 read-error path submit the split remainder
> >       directly to md_handle_request() and skip bio_queue_enter(), or
> >    b) drop the freeze from mddev_suspend() and fix the original
> >       queue_attr_store()/limits_lock vs reconfig_mutex deadlock on the
> >       other side.
> >
> > Which do you prefer, or do you see another approach?
>
> I feel this is too complex and it's not worth it.
>
> Since the reason to freeze queue in queue_attr_store() is to avoid updati=
ng
> limits with I/O inflight, and call blk_mq_freeze_queue() for bio-based di=
sks
> is useless, which means there is still real problem for bio-based disks t=
hat
> queue_attr_store() can update limits with bios inflight.
>
> Christoph, how about adding a new suspend bio disk ops, and replace blk_m=
q_freeze_queue()
> with the new ops for bio-based disks in queue_limits_commit_update_frozen=
()?
Hi Kuai, hi Christoph,

Based on this suggestion, I've posted v4 patchset here:
https://lore.kernel.org/linux-raid/20261112134700.372702-1-jinpu.wang@cloud=
.ionos.com/T/#t

Please have a look!

Thx!
>
> >
> > Thanks,
> >
> >
> >> commit bc4b2b2abc71e036c550ab67e56cbc50b4eb867f
> >> Author: Jack Wang <jinpu.wang@cloud.ionos.com>
> >>
> >> md: freeze the queue in mddev_suspend()
> >>
> >> This commit freezes the request queue in mddev_suspend() and unfreezes=
 it in
> >> __mddev_resume() so that bios submitted while the array is suspended b=
lock in
> >> bio_queue_enter() without holding q_usage_counter, avoiding a deadlock=
 with
> >> concurrent queue_attr_store() limits updates.
> >>
> >>> diff --git a/drivers/md/md.c b/drivers/md/md.c
> >>> index 03e35386a8028..29737a624844a 100644
> >>> --- a/drivers/md/md.c
> >>> +++ b/drivers/md/md.c
> >>> @@ -472,6 +472,42 @@ static void md_submit_bio(struct bio *bio)
> >>>        md_handle_request(mddev, bio);
> >>>   }
> >>>
> >>> +/*
> >>> + * Freeze the queue so a concurrent blk_mq_freeze_queue() (e.g. a li=
mits
> >>> + * update) can't wait on a bio parked in md_handle_request() while s=
uspended.
> >>> + * Skip the drain wait when parked bios hold a reference and only pr=
ogress
> >>> + * after suspend: the suspend_lo/hi window, or an interrupted raid45=
6 reshape.
> >>> + * Resume may run in another task, hence the non_owner variants.
> >>> + */
> >>> +static int mddev_freeze_queue(struct mddev *mddev, bool interruptibl=
e)
> >>> +{
> >>> +     struct request_queue *q;
> >>> +
> >>> +     if (mddev_is_dm(mddev))
> >>> +             return 0;
> >>> +
> >>> +     q =3D mddev->gendisk->queue;
> >>> +     blk_freeze_queue_start_non_owner(q);
> >>> +
> >>> +     if (READ_ONCE(mddev->suspend_lo) < READ_ONCE(mddev->suspend_hi)=
 ||
> >>> +         (mddev->pers && mddev->pers->prepare_suspend &&
> >>> +          reshape_interrupted(mddev)))
> >>> +             return 0;
> >>> +
> >>> +     if (!interruptible) {
> >>> +             blk_mq_freeze_queue_wait(q);
> >>> +             return 0;
> >>> +     }
> >>> +     return wait_event_interruptible(q->mq_freeze_wq,
> >>> +                     percpu_ref_is_zero(&q->q_usage_counter));
> >>> +}
> >> [Severity: High]
> >> Could this wait in mddev_freeze_queue() deadlock if a RAID456 reshape =
is
> >> interrupted or frozen after the initial reshape_interrupted(mddev) che=
ck
> >> passes, while an unsplit bio is already inside md_handle_request()?
> >>
> >> Consider an active RAID456 reshape where reshape_interrupted(mddev) is
> >> initially false and an unsplit bio enters:
> >>
> >> __submit_bio()
> >>    bio_queue_enter() /* acquires q->q_usage_counter */
> >>    md_submit_bio()
> >>      md_handle_request()
> >>        raid5_make_request()
> >>
> >> If mddev_suspend() runs concurrently (for example via suspend_lo_store=
() or
> >> suspend_hi_store(), which do not hold reconfig_mutex), mddev_freeze_qu=
eue()
> >> sees reshape_interrupted(mddev) =3D=3D false and blocks waiting for
> >> q->q_usage_counter to reach zero before mddev_suspend() reaches
> >> percpu_ref_kill(&mddev->active_io) or mddev->pers->prepare_suspend(mdd=
ev).
> >>
> >> If the reshape is then interrupted or frozen while mddev_freeze_queue(=
) is
> >> waiting (for example via action_store() setting MD_RECOVERY_FROZEN or
> >> MD_RECOVERY_INTR, or md_error() setting MD_RECOVERY_INTR on a disk fai=
lure),
> >> make_stripe_request() sees reshape_interrupted(mddev) =3D=3D true and =
returns
> >> STRIPE_WAIT_RESHAPE:
> >>
> >> drivers/md/raid5.c:raid5_make_request() {
> >>          ...
> >>          if (res =3D=3D STRIPE_WAIT_RESHAPE) {
> >>                  ...
> >>                  if (split) {
> >>                          submit_bio_noacct(front_bio);
> >>                          return true;
> >>                  }
> >>                  return false;
> >>          }
> >> }
> >>
> >> For an unsplit bio, raid5_make_request() returns false to md_handle_re=
quest():
> >>
> >> drivers/md/md.c:md_handle_request() {
> >>          ...
> >>          if (!mddev->pers->make_request(mddev, bio)) {
> >>                  percpu_ref_put(&mddev->active_io);
> >>                  if (mddev_is_dm(mddev) && mddev->pers->prepare_suspen=
d)
> >>                          return false;
> >>                  goto check_suspended;
> >>          }
> >> }
> >>
> >> Previously, mddev_suspend() killed mddev->active_io first, so dropping
> >> mddev->active_io allowed mddev_suspend() to finish while the bio parke=
d in
> >> check_suspended. With the queue freeze wait happening first, the bio l=
oops
> >> back to check_suspended inside md_handle_request() without exiting
> >> md_submit_bio() or dropping q->q_usage_counter (and busy-loops because
> >> mddev->active_io has not been killed yet), or sleeps in conf->wait_for=
_reshape
> >> because prepare_suspend() has not been called, so q->q_usage_counter n=
ever
> >> drains.
> >>
> >>> +
> >>> +static void mddev_unfreeze_queue(struct mddev *mddev)
> >>> +{
> >>> +     if (!mddev_is_dm(mddev))
> >>> +             blk_mq_unfreeze_queue_non_owner(mddev->gendisk->queue);
> >>> +}
> >>> +
> >>>   /*
> >>>    * Make sure no new requests are submitted to the device, and any r=
equests that
> >>>    * have been submitted are completely handled.
> >>> @@ -500,6 +536,13 @@ int mddev_suspend(struct mddev *mddev, bool inte=
rruptible)
> >>>                return 0;
> >>>        }
> >>>
> >>> +     err =3D mddev_freeze_queue(mddev, interruptible);
> >>> +     if (err) {
> >>> +             mddev_unfreeze_queue(mddev);
> >>> +             mutex_unlock(&mddev->suspend_mutex);
> >>> +             return err;
> >>> +     }
> >>> +
> >>>        percpu_ref_kill(&mddev->active_io);
> >> [Severity: High]
> >> Does freezing mddev->gendisk->queue before mddev->active_io drains cau=
se a
> >> deadlock with raid1d() and raid10d() when handling read errors?
> >>
> >> For bio-based MD devices, __submit_bio() drops q->q_usage_counter in
> >> blk_queue_exit() as soon as md_submit_bio() returns, while the cloned
> >> r1_bio->master_bio or r10_bio->master_bio (allocated from mddev->io_cl=
one_set
> >> by md_account_bio()) keeps holding a reference on mddev->active_io unt=
il the
> >> underlying member-disk read completes.
> >>
> >> If mddev_suspend() is called while a read bio is in flight on a member=
 disk:
> >> 1. mddev_freeze_queue() sees q->q_usage_counter is already zero and re=
turns
> >>     with mddev->gendisk->queue frozen.
> >> 2. mddev_suspend() kills mddev->active_io and blocks in wait_event() w=
aiting
> >>     for percpu_ref_is_zero(&mddev->active_io).
> >> 3. The member-disk read fails, and raid1d() or raid10d() runs
> >>     handle_read_error() -> raid1_read_request() / raid10_read_request(=
) using
> >>     the md_io_clone master_bio:
> >>
> >> drivers/md/raid1.c:raid1_read_request() {
> >>          ...
> >>          if (max_sectors < bio_sectors(bio)) {
> >>                  bio =3D bio_submit_split_bioset(bio, max_sectors,
> >>                                                &conf->bio_split);
> >>          ...
> >> }
> >>
> >> If the surviving mirror has a smaller max_sectors (for example, due to=
 bad
> >> blocks), bio_submit_split_bioset() splits the md_io_clone bio and call=
s
> >> submit_bio_noacct_nocheck() on the remainder targeting the MD device.
> >>
> >> Commit 7b15c24f8053 ("md: don't hang mddev_suspend() on resubmitted bi=
os")
> >> added the md_cloned_bio() check in md_handle_request() so that resubmi=
tted
> >> md_io_clone bios from raid1d() or raid10d() would bypass the suspend w=
ait and
> >> allow mddev->active_io to drain:
> >>
> >> drivers/md/md.c:md_handle_request() {
> >> check_suspended:
> >>          if (unlikely(md_cloned_bio(mddev, bio))) {
> >>                  /*
> >>                   * This bio is an MD cloned bio and already holds an
> >>                   * active_io reference, so percpu_ref_get() is safe h=
ere.
> >>                   */
> >>                  percpu_ref_get(&mddev->active_io);
> >>          } else {
> >>          ...
> >> }
> >>
> >> However, because raid1d() and raid10d() run with current->bio_list =3D=
=3D NULL,
> >> submit_bio_noacct_nocheck() synchronously calls __submit_bio() ->
> >> bio_queue_enter() on the frozen MD queue and blocks on q->mq_freeze_wq=
 before
> >> reaching md_submit_bio() and md_handle_request(). Won't raid1d() or ra=
id10d()
> >> wait forever for the queue to be unfrozen by __mddev_resume(), while
> >> mddev_suspend() waits forever for the split md_io_clone bio to complet=
e and
> >> drop mddev->active_io?
> >>
> >> --
> >> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102154847=
.198472-1-jinpu.wang@ionos.com?part=3D1
>
> --
> Thanks,
> Kuai
