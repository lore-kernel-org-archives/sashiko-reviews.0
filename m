Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794925626;
	b=jFVsTevSI9Sqdxsg2/KMrYBKjD1b/iR3b2nMMwW2j31VxgMXr8dvPcmbOmYPd6CLUwBx
	 XZ94MKh4YE3sJni0/CcZDtkICPOV1LtC/2XxBV64+mgLExR09mSZuLfLulNbwyuLy19jd
	 V2a90cYmpdnNG/NzspsQXckHfDuSOIdTDL9YuziZ/zyEF0QWz3oOkvHNC4vaptrxH7oYa
	 DIIRTqN8UuOsxGxzJfHdUOk97X4oUPtSj7Y2rKKNdA96DeYxNByHeO70OaSxckJ9JSAWv
	 k1HzVvqykB0mgIc8k+138RscX4MxDvkFoJF7b276l8+pOrHSB8xxYz9a7UsQmEOZn/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=PlBEz0/R/Ef87STf82uOLT7Vkt0DOzSXLhqXXnaUz/0=;
	b=2F3HlpdG2GCedB5Hgxg9vDsXvk99WOF2frFU3Y6j9D8taDFgo+hXkUBj4Vk7oaLs9Y+I
	 BKZFgdzrRAscg+B5M2jn+NusDXFBpiRrwiZBHMcm4IAtOX9dubr6LD3c3HBJMGHf6pyGL
	 GtJ4Huw9UVsrkTtMHLBHUD+dbXZ9WFQw2N8eWdTfvqO58SrTpsHArHEkl37Ul+43/gMTs
	 0OmcSkH2sgsDgZPjxfkbF7Z+TKETyX0LQme5hZVcIyp5jPK9Lesm9lLv7wJCK6XdyFnZf
	 BrhGbFgqsmzDTLuYI78nbm6xpH5U7S0fCLIF7IjOwQgXP0/y6Xy4O9UEg2lmfjOf9BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EU5vQqd+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782FE606A329
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 14:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 782FE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EU5vQqd+
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4d07494b0so12241877b3.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 06:27:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794925625; cv=none;
        d=google.com; s=arc-20260327;
        b=EkdqNxDeUVc0uYe27KoKTAV/cAId+cIVBvv3HL1QyFCaftNcX+5N3dgRD2Mu2vtS5D
         biSxhXHcKKtvpSFhL57xCuVRd+ebB7Z4m5pISafDUya18R9llzViM2VNBYaUCap4nPlM
         GZvgRaqLRdNevV82uMNBvNd6/A6x7oWDBi1ylbvGSji+5DMRKiegRadyy8nFV22N6wV5
         uEJzpO6iFpAlmQoUzF4+p8WgTSNkq/b+9NsBPgVF8NDZknKzIsy0Z1e9GLaxZlaDEz/U
         UA9+WAMRK6TzQV2aiURB00fJKzCQoOCKW1L9McJ7E27jFTbdck/QPMXigKS+kfwYdqM7
         UgwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PlBEz0/R/Ef87STf82uOLT7Vkt0DOzSXLhqXXnaUz/0=;
        fh=N6fJd9nwyHTVBviLWqin7n91Vn056emKV6TFjw1VhuE=;
        b=YB8VtItl5vHqQpIpjLOr2mcDMWsouEM2BnxFLrprMzzX8cQnfDn4ZnrybW+vRawB0l
         lTglO6u8F6WUosF71HgXlhpSxQlzJPp+IZZLT3gmLf/gbhS8yvo2I+ly/ERMH+CZK2KL
         pC+7VCdau1CKHT5JVpuxB+RrrH0KAtB0le0EBFf0W3omZOfHp5YW3lzZ+/N/u4nrjDeI
         on9xYQhHdAEravx7EfR+rVKIcM5KCpdqiSUI4Kq7K183PFAsmvIW0aruZtHarDqjnrJn
         lfcsFNadMcKtc5hqvOIVtNfgXDoQ+QXnnlX35POXH9Dgw+I28Nnik4RIxxJdhexPcvlk
         qiTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925625; x=1795530425; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PlBEz0/R/Ef87STf82uOLT7Vkt0DOzSXLhqXXnaUz/0=;
        b=EU5vQqd+sB2cpazV3ixpHQzq9WNqH4FKvsTguGISYHPS2jQI989ZZmWujQ3Qq2vD35
         er5VLNPQVln+pyNoSjdZD9IqYUsNGibOm1gYUFP0H1Jcvq1ox39g6oESZkv8twl0YKyx
         LTVgMXhwvBNbWu/j+nHGv2yzvwh4e0+70hVejI6hX1XFsQmYL4+jwbTD9s9MgId39y8L
         foekFgFvwk3RlUu1U7iOPUslScYUSVIlCmFBrMcPKdb1uN8pNEvtLk1YdKc28hd00IcX
         LmTrfkxpA0qWMcoQbefQozPBvBX2GgZe52cwRrJfwmHwr/zEc0dZHJAxe0osuUIDn1Hu
         0RRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925625; x=1795530425;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlBEz0/R/Ef87STf82uOLT7Vkt0DOzSXLhqXXnaUz/0=;
        b=gZV1O4Vy4kMEIHMAFmEg1kFMEn3xS3pkqSbu4aWCVwH6L90op4t80b/j1vrwHZuPBC
         daMVVA5sCKald194XsSFzuBjeyRYjua7P+wjZ3TCT5n33wceAgBZP4+G44jt78ZXVF/J
         JxmnQiMCEiPpnh871lCQ+j/x790n0B8L1UqVKTVYB9kOovxZtLBuouES8VKeP7z52dJz
         DSYkync2u0XjAxbNGy83ewWAFT/UHVqiPl8XwuNt2W2tqXEGPnmkaOovB6SqJvL4/KTv
         YSeLstSlGggBENQOwTwNuYrWp6RBbtoIfXcGTLbQp9puMfQCtZVuQgmIEdE9gyAz0eX5
         PshA==
X-Gm-Message-State: APuU4Z+Ffj8Ixv5g8eq+ygslRqVPcsPcQBcduiz7Q8oyWa7FxEbxeUQy
	/EwnaTgLZbiQn/YFyXR0BwX6ChT5G4uWS51FVr3vt6e/k685UjFP5U42Bg1naejwRwq3rlOT6mV
	cAl1CQzru5LlBekKhnyFxgrmLmjLjSvRStyoY9/s=
X-Gm-Gg: AZFdTZdOwugpjyQVZ9UsZ4CrGzVPuAwap6Xm1I7YHv/8veNVjYan7sJTdMj73A+cD7T
	2wsIt0euFwN0qnI/h8uFyARJfrw3vkCpCRtlBgjesywAo6Si9HEO8suFTaI8EPnXbwmut8KqRMn
	FAIgpTse37t8fEqO30P4yhSmqLywY3tv+npvmukQYZZojK9qscc0hKyASbq2H7AzOS2GTb7Ubiz
	0eO/SNTEPvhyHIBzarNd5axaOyiV6SasuVks8a2Pq9NCRDYynLfJikWrhjlkQrWtFJOJYHdPhsG
	sHZqvdRLhUdGEeDdGqS8wWrAynkTdfHZMmQUy2arR3TnvS+800U2cyNxGw11axUwPQy2C9G07Zm
	EkQjNAP0W1LuNZTCnLnrA1y6tbcLlg+8/2pkhOXCP0Z/TNq4X3z8inMCJquR7xoJbps0=
X-Received: by 2002:a05:690c:d88:b0:8b4:caa5:b52c with SMTP id
 00721157ae682-8b4ee2ecf97mr16817967b3.16.1794925625274; Tue, 17 Nov 2026
 06:27:05 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117130848.65142-1-laoar.shao@gmail.com> <sashiko-outbox-218879@kernel.org>
In-Reply-To: <sashiko-outbox-218879@kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 17 Nov 2026 22:26:28 +0800
X-Gm-Features: AclHuK_7XQx9S0WE2CpZmD-evuYnumi4dxDiypwlbCMDCB8JZKCbklSyo6UFzBU
Message-ID: <CALOAHbCL8oJpne15Y1-Meh2u-jnrMLEB=dDR=bNuJ0i29hBg5w@mail.gmail.com>
Subject: Re: [PATCH] livepatch: Avoid blocking tasklist_lock too long
To: sashiko-reviews@lists.linux.dev
Cc: jpoimboe@kernel.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, song@kernel.org, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 9:29=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] livepatch: race between klp_try_complete_transition() and
>   klp_copy_process()
> --
>
> commit ceb01fc48f77409ab4a5313629520f441760c90c
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> livepatch: Avoid blocking tasklist_lock too long
>
> This commit splits the task iteration in klp_try_complete_transition() in=
to
> a first pass under rcu_read_lock() and a second pass under tasklist_lock =
to
> reduce tasklist_lock hold times during livepatch transitions.
>
> Link: https://github.com/redis/redis [0]
> Link: https://lore.kernel.org/all/20250227024733.16989-1-laoar.shao@gmail=
.com/ [1]
> Link: https://lore.kernel.org/all/Z8CRXxfI24E9_IHC@pathway.suse.cz/ [2]
> Link: https://lore.kernel.org/all/20250213013603.i6uxtjvc3qxlsqwc@jpoimbo=
e/ [3]
>
> > diff --git a/kernel/livepatch/transition.c b/kernel/livepatch/transitio=
n.c
> > index 2351a19ac2a9e..e058d21d84b75 100644
> > --- a/kernel/livepatch/transition.c
> > +++ b/kernel/livepatch/transition.c
> > @@ -444,7 +444,27 @@ void klp_try_complete_transition(void)
> >        *
> >        * Usually this will transition most (or all) of the tasks on a s=
ystem
> >        * unless the patch includes changes to a very common function.
> > +      *
> > +      * To avoid holding the tasklist_lock for too long, we iterate ov=
er the
> > +      * tasks in two passes. In the first pass, we use the lightweight=
 RCU
> > +      * read lock to iterate through most tasks. This pass will cover =
the
> > +      * majority of tasks, except for some newly forked tasks which ma=
y be
> > +      * added into the tasklist concurrently. In the second pass, we a=
cquire
> > +      * the tasklist_lock to handle the tasks missed in the first pass=
.
> >        */
> > +
> > +     /* First pass: Iterate over tasks using the lightweight RCU read =
lock. */
> > +     rcu_read_lock();
> > +     for_each_process_thread(g, task) {
> > +             /* klp_check_stack() requires preemption to be disabled *=
/
> > +             if (task =3D=3D current)
> > +                     continue;
> > +
> > +             klp_try_switch_task(task);
> > +     }
> > +     rcu_read_unlock();
>
> [Severity: Medium]
> Can this RCU pass race with klp_copy_process() on CONFIG_PREEMPT_RT kerne=
ls
> and leave a newly forked child with TIF_PATCH_PENDING still set when the
> transition completes?
>
> klp_copy_process() relies on tasklist_lock to serialize against transitio=
n
> updates while copying TIF_PATCH_PENDING and patch_state from current to
> child:
>
> kernel/livepatch/transition.c:klp_copy_process() {
>         if (test_tsk_thread_flag(current, TIF_PATCH_PENDING))
>                 set_tsk_thread_flag(child, TIF_PATCH_PENDING);
>         else
>                 clear_tsk_thread_flag(child, TIF_PATCH_PENDING);
>
>         child->patch_state =3D current->patch_state;
> }
>
> On CONFIG_PREEMPT_RT, write_lock_irq(&tasklist_lock) in copy_process() is=
 a
> preemptible rtmutex lock, and unwinders such as x86_64 ORC unwind reliabl=
y
> across in-kernel preemption frames:
>
> CPU0 (parent in fork)             CPU1 (klp_try_complete_transition)
> copy_process()
>   write_lock_irq(&tasklist_lock)
>   klp_copy_process(child)
>     set_tsk_thread_flag(child,
>       TIF_PATCH_PENDING)
>     <preempted>
>                                   /* First pass under rcu_read_lock() */
>                                   klp_try_switch_task(parent)
>                                     ...
>                                     clear_tsk_thread_flag(parent,
>                                       TIF_PATCH_PENDING)
>                                     parent->patch_state =3D klp_target_st=
ate
>     child->patch_state =3D
>       current->patch_state
>   write_unlock_irq(&tasklist_lock)
>                                   /* Second pass under tasklist_lock */
>                                   klp_try_switch_task(child)
>                                     if (task->patch_state =3D=3D klp_targ=
et_state)
>                                       return true;
>                                   klp_complete_transition()
>                                     WARN_ON_ONCE(test_tsk_thread_flag(chi=
ld,
>                                       TIF_PATCH_PENDING))  <-- stale flag
>
> Because child->patch_state already matches klp_target_state, the second p=
ass
> under tasklist_lock returns early in klp_try_switch_task() without cleari=
ng
> TIF_PATCH_PENDING on child.  klp_complete_transition() then triggers
> WARN_ON_ONCE(test_tsk_thread_flag(task, TIF_PATCH_PENDING)) and leaves th=
e
> flag set on the child task.

Nice catch!

Perhaps it can be resolved by explicitly disabling the preemption?

diff --git a/kernel/livepatch/transition.c b/kernel/livepatch/transition.c
index e058d21d84b7..81c3afa69f03 100644
--- a/kernel/livepatch/transition.c
+++ b/kernel/livepatch/transition.c
@@ -706,12 +706,14 @@ void klp_copy_process(struct task_struct *child)
         * klp_update_patch_state(current) and __klp_sched_try_switch(), bu=
t we
         * cannot race with them because we are current.
         */
+       preempt_disable();
        if (test_tsk_thread_flag(current, TIF_PATCH_PENDING))
                set_tsk_thread_flag(child, TIF_PATCH_PENDING);
        else
                clear_tsk_thread_flag(child, TIF_PATCH_PENDING);

        child->patch_state =3D current->patch_state;
+       preempt_enable();
 }

 /*

--=20
Regards
Yafang
