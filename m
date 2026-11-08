Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794109495;
	b=vojiFjpAOAQdW0ZnnzdA/dic4wf6ijivocgdyrJ4BFmQ8Gjumih/jXA0UjHn/Q/3HbOc
	 zBjKJ4c5blzswNynAnJ65sISY0ou+M5UZhkvn18BHI7kNy1Jd5a0mPVCLV6N6qU5xiRVR
	 iaBvGUZF9MKwGV36NQyBpj9diQPdrg1Z0vF0btS61ZWnV/ZT7nLGwuZpP8W7noS+DPWm+
	 3UB+/zLa4wT1KByGx0XIpGBzischqBVUWfKcgOnFoBOVumknnOGWxGjdsa1RJ3o7ZqMZx
	 bYIzZ9mjUJYdrKOX3aAnaanFrPl7oCBlQ6ZFjYfkkkCvClJn48yssFVZxP692g+d2Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794109495;
	h=DMARC-Filter:DKIM-Signature:Reply-To:Mime-Version:User-Agent:
	 X-Original-From:To:From:Message-Id:Received:Subject:References:
	 In-Reply-To:X-Lms-Return-Path:Cc:Date:Content-Type:
	 Content-Transfer-Encoding;
	bh=Gns9NuyPJW8Qd4KoenqTC/Kcz0odn77rzN1RDlI4pnE=;
	b=2F0T/nQdPVaaD5kYIGQ4Z3sh+GDL4qYDScvrZ8R77eR7nrDorOCmnMa22+/Q0qd5n6Ey
	 UzR2vKtukKaFoHvG4pLoFjG3yN6j83X4+dvQt2WapGg0m7z41hXUc/4HKfGfpPza4f/GZ
	 tbDoAokjb5M3Za+bpXBmf/HErf6TJFfIWTsPX7Q4uAYEz1jlK2sHzqYuLua2BssDilO5Z
	 BAffqoW+qbV3E/zxSVQKUlRr/VszFt4HCjnN/6cYCasY8StNX1lCgoy4YQaLbWi5BKytH
	 adxkLmDNvY58tqgPsKconRmqGgA4ary2kHgZOQxbyBcgbG87veAmr8kwYChVBZ1krrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fygo.io;
	spf=pass smtp.mailfrom=fygo.io;
	dkim=pass header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=BpW7W4LE;
	arc=none smtp.remote-ip=209.127.231.18
Received: from va-2-18.ptr.blmpb.com (va-2-18.ptr.blmpb.com [209.127.231.18])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78703606A31C
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 03:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78703606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=BpW7W4LE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1794109488;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Gns9NuyPJW8Qd4KoenqTC/Kcz0odn77rzN1RDlI4pnE=;
 b=BpW7W4LEBZ63a0oCZbHmG+vTtXho/70H8ylTGDFu1uSKZoIeYGxmjsGp9qYqKWNI9W7G/U
 IF14IFTMCnMnu9DQwFO8amc8u7WhsXZTRMF5h+lQ3oIl171M0wlUPxjes+h+rw4UiMdKBL
 OE1+5YvKY3aC8gfWvOwp+d08UiGRryEfaqrKMkoKeETjxZFcU+bgv09Y2v6amYC//luB6C
 LzgAEfB5EaaOgx2hBKY8n3eBa64OYgxpdm4/AG0GOy42LT3JXwuz0Iq4v8Mh/bzyTEILld
 bVuTeCLyvTETyn32kRZtwOBWw/ugc/LfCbSwmScs9eE2/+2ci99i3vC5p6uGEg==
Reply-To: yukuai@fygo.io
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
X-Original-From: yu kuai <yukuai@fygo.io>
To: "Jinpu Wang" <jinpu.wang@cloud.ionos.com>, 
	<sashiko-reviews@lists.linux.dev>, "yu kuai" <yukuai@fygo.io>
From: "yu kuai" <yukuai@fygo.io>
Message-Id: <eec58ab2-3283-4296-82cc-eba8baaeec8b@fygo.io>
Received: from [192.168.1.104] ([39.182.0.55]) by smtp.larksuite.com with ESMTPS; Sun, 08 Nov 2026 03:44:47 +0000
Subject: Re: [PATCH v3 1/1] md: freeze the queue in mddev_suspend()
References: <20261102154847.198472-1-jinpu.wang@ionos.com> <20261102154847.198472-2-jinpu.wang@ionos.com> <sashiko-outbox-193747@kernel.org> <CAMGffEmyXYooOq9b8=eyzmrsdVQJhogEKWPCvyVXecX9JN-C+Q@mail.gmail.com>
In-Reply-To: <CAMGffEmyXYooOq9b8=eyzmrsdVQJhogEKWPCvyVXecX9JN-C+Q@mail.gmail.com>
X-Lms-Return-Path: <lba+26aeff030+877ac5+lists.linux.dev+yukuai@fygo.io>
Cc: <linux-raid@vger.kernel.org>, "Christoph Hellwig" <hch@lst.de>
Date: Sun, 8 Nov 2026 11:44:44 +0800
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

=E5=9C=A8 2026/11/3 18:03, Jinpu Wang =E5=86=99=E9=81=93:
> On Mon, Nov 2, 2026 at 5:20=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential iss=
ue(s) to consider:
>> - [High] md: deadlock in raid1d() and raid10d() due to queue freeze in m=
ddev_suspend()
>> - [High] md: deadlock in mddev_freeze_queue() when reshape is interrupte=
d during wait
>> --
> Hi Kuai,
>
> Sashiko flagged two issues with this patch, and I think both are valid:
>
> 1) mddev_freeze_queue() checks reshape_interrupted() only once. If a
>     raid456 reshape is interrupted or frozen while we wait for
>     q_usage_counter to drain, a bio already in md_handle_request() loops
>     back to check_suspended without dropping its q_usage_counter
>     reference. The wait never ends, because active_io is not killed yet
>     and prepare_suspend() has not been called.
>
> 2) Freezing the queue before killing active_io deadlocks with
>     raid1d/raid10d. If a read error makes raid1_read_request() split an
>     md_io_clone bio, the remainder is resubmitted from the md thread
>     through bio_queue_enter(). That blocks on the frozen queue, so the
>     md_cloned_bio() bypass in md_handle_request() is never reached and
>     active_io never drains.
>
> For (1) I plan to re-evaluate the skip conditions periodically in the
> wait. For (2) I don't see a small fix. The options are:
>    a) have the raid1/raid10 read-error path submit the split remainder
>       directly to md_handle_request() and skip bio_queue_enter(), or
>    b) drop the freeze from mddev_suspend() and fix the original
>       queue_attr_store()/limits_lock vs reconfig_mutex deadlock on the
>       other side.
>
> Which do you prefer, or do you see another approach?

I feel this is too complex and it's not worth it.

Since the reason to freeze queue in queue_attr_store() is to avoid updating
limits with I/O inflight, and call blk_mq_freeze_queue() for bio-based disk=
s
is useless, which means there is still real problem for bio-based disks tha=
t
queue_attr_store() can update limits with bios inflight.

Christoph, how about adding a new suspend bio disk ops, and replace blk_mq_=
freeze_queue()
with the new ops for bio-based disks in queue_limits_commit_update_frozen()=
?

>
> Thanks,
>
>
>> commit bc4b2b2abc71e036c550ab67e56cbc50b4eb867f
>> Author: Jack Wang <jinpu.wang@cloud.ionos.com>
>>
>> md: freeze the queue in mddev_suspend()
>>
>> This commit freezes the request queue in mddev_suspend() and unfreezes i=
t in
>> __mddev_resume() so that bios submitted while the array is suspended blo=
ck in
>> bio_queue_enter() without holding q_usage_counter, avoiding a deadlock w=
ith
>> concurrent queue_attr_store() limits updates.
>>
>>> diff --git a/drivers/md/md.c b/drivers/md/md.c
>>> index 03e35386a8028..29737a624844a 100644
>>> --- a/drivers/md/md.c
>>> +++ b/drivers/md/md.c
>>> @@ -472,6 +472,42 @@ static void md_submit_bio(struct bio *bio)
>>>        md_handle_request(mddev, bio);
>>>   }
>>>
>>> +/*
>>> + * Freeze the queue so a concurrent blk_mq_freeze_queue() (e.g. a limi=
ts
>>> + * update) can't wait on a bio parked in md_handle_request() while sus=
pended.
>>> + * Skip the drain wait when parked bios hold a reference and only prog=
ress
>>> + * after suspend: the suspend_lo/hi window, or an interrupted raid456 =
reshape.
>>> + * Resume may run in another task, hence the non_owner variants.
>>> + */
>>> +static int mddev_freeze_queue(struct mddev *mddev, bool interruptible)
>>> +{
>>> +     struct request_queue *q;
>>> +
>>> +     if (mddev_is_dm(mddev))
>>> +             return 0;
>>> +
>>> +     q =3D mddev->gendisk->queue;
>>> +     blk_freeze_queue_start_non_owner(q);
>>> +
>>> +     if (READ_ONCE(mddev->suspend_lo) < READ_ONCE(mddev->suspend_hi) |=
|
>>> +         (mddev->pers && mddev->pers->prepare_suspend &&
>>> +          reshape_interrupted(mddev)))
>>> +             return 0;
>>> +
>>> +     if (!interruptible) {
>>> +             blk_mq_freeze_queue_wait(q);
>>> +             return 0;
>>> +     }
>>> +     return wait_event_interruptible(q->mq_freeze_wq,
>>> +                     percpu_ref_is_zero(&q->q_usage_counter));
>>> +}
>> [Severity: High]
>> Could this wait in mddev_freeze_queue() deadlock if a RAID456 reshape is
>> interrupted or frozen after the initial reshape_interrupted(mddev) check
>> passes, while an unsplit bio is already inside md_handle_request()?
>>
>> Consider an active RAID456 reshape where reshape_interrupted(mddev) is
>> initially false and an unsplit bio enters:
>>
>> __submit_bio()
>>    bio_queue_enter() /* acquires q->q_usage_counter */
>>    md_submit_bio()
>>      md_handle_request()
>>        raid5_make_request()
>>
>> If mddev_suspend() runs concurrently (for example via suspend_lo_store()=
 or
>> suspend_hi_store(), which do not hold reconfig_mutex), mddev_freeze_queu=
e()
>> sees reshape_interrupted(mddev) =3D=3D false and blocks waiting for
>> q->q_usage_counter to reach zero before mddev_suspend() reaches
>> percpu_ref_kill(&mddev->active_io) or mddev->pers->prepare_suspend(mddev=
).
>>
>> If the reshape is then interrupted or frozen while mddev_freeze_queue() =
is
>> waiting (for example via action_store() setting MD_RECOVERY_FROZEN or
>> MD_RECOVERY_INTR, or md_error() setting MD_RECOVERY_INTR on a disk failu=
re),
>> make_stripe_request() sees reshape_interrupted(mddev) =3D=3D true and re=
turns
>> STRIPE_WAIT_RESHAPE:
>>
>> drivers/md/raid5.c:raid5_make_request() {
>>          ...
>>          if (res =3D=3D STRIPE_WAIT_RESHAPE) {
>>                  ...
>>                  if (split) {
>>                          submit_bio_noacct(front_bio);
>>                          return true;
>>                  }
>>                  return false;
>>          }
>> }
>>
>> For an unsplit bio, raid5_make_request() returns false to md_handle_requ=
est():
>>
>> drivers/md/md.c:md_handle_request() {
>>          ...
>>          if (!mddev->pers->make_request(mddev, bio)) {
>>                  percpu_ref_put(&mddev->active_io);
>>                  if (mddev_is_dm(mddev) && mddev->pers->prepare_suspend)
>>                          return false;
>>                  goto check_suspended;
>>          }
>> }
>>
>> Previously, mddev_suspend() killed mddev->active_io first, so dropping
>> mddev->active_io allowed mddev_suspend() to finish while the bio parked =
in
>> check_suspended. With the queue freeze wait happening first, the bio loo=
ps
>> back to check_suspended inside md_handle_request() without exiting
>> md_submit_bio() or dropping q->q_usage_counter (and busy-loops because
>> mddev->active_io has not been killed yet), or sleeps in conf->wait_for_r=
eshape
>> because prepare_suspend() has not been called, so q->q_usage_counter nev=
er
>> drains.
>>
>>> +
>>> +static void mddev_unfreeze_queue(struct mddev *mddev)
>>> +{
>>> +     if (!mddev_is_dm(mddev))
>>> +             blk_mq_unfreeze_queue_non_owner(mddev->gendisk->queue);
>>> +}
>>> +
>>>   /*
>>>    * Make sure no new requests are submitted to the device, and any req=
uests that
>>>    * have been submitted are completely handled.
>>> @@ -500,6 +536,13 @@ int mddev_suspend(struct mddev *mddev, bool interr=
uptible)
>>>                return 0;
>>>        }
>>>
>>> +     err =3D mddev_freeze_queue(mddev, interruptible);
>>> +     if (err) {
>>> +             mddev_unfreeze_queue(mddev);
>>> +             mutex_unlock(&mddev->suspend_mutex);
>>> +             return err;
>>> +     }
>>> +
>>>        percpu_ref_kill(&mddev->active_io);
>> [Severity: High]
>> Does freezing mddev->gendisk->queue before mddev->active_io drains cause=
 a
>> deadlock with raid1d() and raid10d() when handling read errors?
>>
>> For bio-based MD devices, __submit_bio() drops q->q_usage_counter in
>> blk_queue_exit() as soon as md_submit_bio() returns, while the cloned
>> r1_bio->master_bio or r10_bio->master_bio (allocated from mddev->io_clon=
e_set
>> by md_account_bio()) keeps holding a reference on mddev->active_io until=
 the
>> underlying member-disk read completes.
>>
>> If mddev_suspend() is called while a read bio is in flight on a member d=
isk:
>> 1. mddev_freeze_queue() sees q->q_usage_counter is already zero and retu=
rns
>>     with mddev->gendisk->queue frozen.
>> 2. mddev_suspend() kills mddev->active_io and blocks in wait_event() wai=
ting
>>     for percpu_ref_is_zero(&mddev->active_io).
>> 3. The member-disk read fails, and raid1d() or raid10d() runs
>>     handle_read_error() -> raid1_read_request() / raid10_read_request() =
using
>>     the md_io_clone master_bio:
>>
>> drivers/md/raid1.c:raid1_read_request() {
>>          ...
>>          if (max_sectors < bio_sectors(bio)) {
>>                  bio =3D bio_submit_split_bioset(bio, max_sectors,
>>                                                &conf->bio_split);
>>          ...
>> }
>>
>> If the surviving mirror has a smaller max_sectors (for example, due to b=
ad
>> blocks), bio_submit_split_bioset() splits the md_io_clone bio and calls
>> submit_bio_noacct_nocheck() on the remainder targeting the MD device.
>>
>> Commit 7b15c24f8053 ("md: don't hang mddev_suspend() on resubmitted bios=
")
>> added the md_cloned_bio() check in md_handle_request() so that resubmitt=
ed
>> md_io_clone bios from raid1d() or raid10d() would bypass the suspend wai=
t and
>> allow mddev->active_io to drain:
>>
>> drivers/md/md.c:md_handle_request() {
>> check_suspended:
>>          if (unlikely(md_cloned_bio(mddev, bio))) {
>>                  /*
>>                   * This bio is an MD cloned bio and already holds an
>>                   * active_io reference, so percpu_ref_get() is safe her=
e.
>>                   */
>>                  percpu_ref_get(&mddev->active_io);
>>          } else {
>>          ...
>> }
>>
>> However, because raid1d() and raid10d() run with current->bio_list =3D=
=3D NULL,
>> submit_bio_noacct_nocheck() synchronously calls __submit_bio() ->
>> bio_queue_enter() on the frozen MD queue and blocks on q->mq_freeze_wq b=
efore
>> reaching md_submit_bio() and md_handle_request(). Won't raid1d() or raid=
10d()
>> wait forever for the queue to be unfrozen by __mddev_resume(), while
>> mddev_suspend() waits forever for the split md_io_clone bio to complete =
and
>> drop mddev->active_io?
>>
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102154847.1=
98472-1-jinpu.wang@ionos.com?part=3D1

--=20
Thanks,
Kuai
