Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795406210;
	b=kCmNBxl8kWA1A/UVAE8jresi2f5iccGiteNQQ59ubKnv5Nd9q7gzjb6E2HXt5bSqAjgJ
	 XC9QC5/YDivkXC+4Ur+HUst7FpAqtDDAV4oMGyzqnwWxux7a6olOD/gv0rRHZ05bqBGYf
	 wWLbIYwN/zWFL0LOYnG7TWK/Y8Od7wmOrKdt3f1RctVwEXvlse4+ivX7Sskr3LGRKxtOX
	 wtHOj6mpMXds14fUdk0LFmbdzmJAev76GMLYckN9QUT4qQu7i/vTOB+jmUf6AwOLQYa7/
	 m36u28tdABf6KXInRMhHJmMNX+9fSn4Unkv1op4oZj2werDTXF2wPeJ2im45tZP0KPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795406210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=0XAlSRVn/qzq3PpDz35l2bOFmo6OtmXUHT+w0KVC5so=;
	b=X3EQMBW2oKMEKBmIluW6ITsNxfKizzqXZzJjNkpWfV0zZE/YoEhn5I4kBhoSeCGRjLCV
	 L6/RG6BbfLpoEuzPIRiNZfnUmM3RrezeG9Ex2qNd7g3TQDWtdDjS8O2mPAusnJXMue7Ys
	 qquSTe/vkJ61qWgvMMX6OklsbxzbsHDGqD405IyiQJhO6lMPnDHRcSq4a6KEFNucGsMil
	 GbOWgQDIhzUyi519Rr/CyuYmxmp2vuQ6cS+Kan4MGMcjWLRBxtnbYntwm6BkYMVcBFaYh
	 6td0CSg/D1yuEuurmWndnBpMHpOtEPOdCvLUFBNEdG8evzTaS/NmEFto92v+sVYW4fA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sGKgeT9v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A960606A31E
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 03:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A960606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sGKgeT9v
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b30cbfa628so18523237b3.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 19:56:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795406209; cv=none;
        d=google.com; s=arc-20260327;
        b=XBmIAT89z8rc7EbnsNrbNwateJz2Q3iDLz3OKFtcSHU6PU+R4vmVnXlg58f90I8fm+
         /QM8sGv8ey/T72fFnwcNdRAMOe7CnRQFlfdM1Ypdu+bEPQCbzJkSRrms6v2D1l5IDaAj
         ehSbHZYyFhWqKVNTvlu7/LubCtxbLR2HVcdCPDdIQtyXKCQwuhTGkwqBQPb3g9DJVmUM
         1oAg9unHwZmkUgVXYTY6kqieDwsGdpeFVE+YdaLJvKMJYxNgzcm4GoNJ4LP2jtJiBQ5y
         +OUZPnGBZYd4138KU6sNLRYVtk+7E+BSK4bl0RSS3XCInxgeZi6MepLp6qMCqjf/c9yT
         SVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0XAlSRVn/qzq3PpDz35l2bOFmo6OtmXUHT+w0KVC5so=;
        fh=N6fJd9nwyHTVBviLWqin7n91Vn056emKV6TFjw1VhuE=;
        b=aIXe0CubM3BgkIOS9EIkXfy2EH+6vCMo9sDGg1euHjXons52zVFBjJvEbbbbwo1RfI
         V4APi8yDc7vi3KWj+XFHyoYUTmEziGRhpZldHUtj+8DgkdpISVx/Z4+HaCvZocUdCsJC
         ImGw1UUrI6vkxxnsJ3iTRZM/0nrdOL1rYywa3Wft+slhcgx9VleFuXMMZu3G2V47pqPF
         2yeibUywDaP+3e31U3k0idaPAdG3ipuYPkZu2TBmx51cahaZHCn3Nf3YyWkXQsUdRc2r
         XPPauzqFyhhnxozJqd5V8y7mpxNoRMmNDorn6u2nJEnPJ2VjHbX2VIu2LUedAbuQzrdK
         VN9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795406209; x=1796011009; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0XAlSRVn/qzq3PpDz35l2bOFmo6OtmXUHT+w0KVC5so=;
        b=sGKgeT9vBCjBYGlHzA7R75eEOlnVxc/c11bjUeIa8AJGMdygP6Id/W6iNxcFFpHVSX
         2o9RNAM9U/JMx2IW2nSgBLjfxUKNvBNXF1efjtlfI1yLyTmi85Pp2ITZU75sccvdGaYK
         yArrHe/MP3w+7GYUo9Vqp0+VX1tlJjkU3j18r8VCUPGR/f+24tzwAkN10X7JReNLg2ku
         gBJcVFc6xFN1iQr9y/yzqT3dup0Ry8oCyfVl32iP1iwqmyZpejQxst/OuzM19H6OOZPr
         TmKooTaIDKZPsmO4W5iuG/53uXTqogc+vpCxhOxQPryQM2e5F7tIaSQFVzw246PvZj7X
         Y9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795406209; x=1796011009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0XAlSRVn/qzq3PpDz35l2bOFmo6OtmXUHT+w0KVC5so=;
        b=QpiJ5f+ejPqcJA7XkiKW7/6+7kL7Fk0HqOZoHBrFZdVM1wjMKyEm2TmDYl1sSdsln1
         jkcE3kKSpNXAz7rGt+WeLv6P2yGUj4lXeTpbB2rh2nuf9ZAmu1Ic42Xk0WCFC7SAsa3L
         0ZwUUK8/Cw7ftcdAIRr7HUaN9YFRO+Oa9oaaBLiNYW4eeL3T9WbD27h/Jw85B7/+pcMs
         ANvVAUgDrIZqoKLuwxLf1naUFNchxqXv3JomRXzwTHTsEhjoAMuRDkx5kQb2XDsGkiR7
         XccoX0P7a3NfMcxnnZq1iLYOZKYP36aJ5WLT/xEumYmeQ3BLxGtXf6UJo/WnXSb8J4r6
         7Nhg==
X-Gm-Message-State: APuU4Z+zuBF3wSA71R5V8i5nwD17qNK6NQPgVVia8UTsYGsTxMVV37Wg
	RH4GEkrNWHzOSB6YCzCvezKkIgsk5A1wMzfoNEPxrpShGymY+wfmpTX7NArYlOfIWZe9ALBOj1o
	gddsLlkLAHTGJ/iIgvn+YYWxOrJjBVCKNktjD
X-Gm-Gg: AZFdTZfgD2/SGbTLp7uvq7G4Y1BXRIbxM3fZyRBWxKHqqm09vEL425wwYV0griXANgF
	CYrs2p+p2lG0ewOazc+DI49JQlP5cKh4ILHPTL5yCFWkna538QYh3LLlKB+/oGl8ddg873iJNf/
	0FZ91Slr/GO50PGGhjqyI/ZazoAR8JX6VLU7f+uyHpIJ/PcdD7lfMxIpt7onIf3N3J356sxRbk8
	iiJQbohFIV6wS4ht843fv6iDVf7kcYwWG73+D9iZCKGZM5WbIAQ5zxrxgElnSNGbKNyD8rUvFiQ
	Eli0Kv7IOLPcXpI0eBbdYiDN93sGqfLASG8ei64kC7Xjb0o1NBqVEG5yD7jSAvAMH3AQ4zaTsLL
	vQBfcUnsT8ffmrVH3rgCsorSFrJaNgEjQ7n8dhRlVbmLN/WKwr3AnscVXnIrxjwiNm10=
X-Received: by 2002:a05:690c:4d41:b0:8b3:527b:d18f with SMTP id
 00721157ae682-8b520456090mr38907817b3.11.1795406209376; Sun, 22 Nov 2026
 19:56:49 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123024119.16154-1-laoar.shao@gmail.com> <sashiko-outbox-228569@kernel.org>
In-Reply-To: <sashiko-outbox-228569@kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 23 Nov 2026 11:56:13 +0800
X-Gm-Features: Aa3M54oMglN3bqLhJZ-1frdXYOAEnsKlrIa_hmlMxZKI1C4SyNpRQVJHxDpK1s4
Message-ID: <CALOAHbBQytiNG1+JQi0kDGRtkXzQR0Lua-DyeB1xq86HNBGASA@mail.gmail.com>
Subject: Re: [PATCH v2] livepatch: Avoid blocking tasklist_lock too long
To: sashiko-reviews@lists.linux.dev
Cc: jpoimboe@kernel.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, song@kernel.org, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 10:52=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] livepatch: broken current handling in
>   klp_try_complete_transition()
> --
>
> commit 9627aa0e09bd9a194e83552843dfca92987dfda2
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> livepatch: Avoid blocking tasklist_lock too long
>
> This commit splits the task iteration in klp_try_complete_transition() in=
to
> a first pass under rcu_read_lock() and a conditional second pass under
> tasklist_lock to reduce tasklist_lock hold times during livepatch
> transitions.
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
> > index ef70ff582da18..e5df13fa6fbde 100644
> > --- a/kernel/livepatch/transition.c
> > +++ b/kernel/livepatch/transition.c
> > @@ -444,12 +444,38 @@ void klp_try_complete_transition(void)
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
> > -     read_lock(&tasklist_lock);
> > -     for_each_process_thread(g, task)
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
> >               if (!klp_try_switch_task(task))
> >                       complete =3D false;
> > -     read_unlock(&tasklist_lock);
> > +     }
> > +     rcu_read_unlock();
> > +
> > +     /*
> > +      * If the first pass succeeded, grab the more heavyweight tasklis=
t lock
> > +      * to check current and any newly forked tasks.
> > +      */
> > +     if (complete) {
> > +             read_lock(&tasklist_lock);
> > +             for_each_process_thread(g, task)
> > +                     if (!klp_try_switch_task(task))
> > +                             complete =3D false;
> > +             read_unlock(&tasklist_lock);
> > +     }
>
> [Severity: Medium]
> Does deferring current to the second pass still call klp_check_stack() wi=
th
> preemption enabled on CONFIG_PREEMPT_RT?
>
> As the new comment in klp_copy_process() notes, tasklist_lock is a sleepi=
ng
> lock on CONFIG_PREEMPT_RT, so read_lock(&tasklist_lock) does not disable
> preemption.  When task =3D=3D current, klp_try_switch_task() calls
> klp_check_and_switch_task() directly instead of going through
> task_call_func(), so klp_check_stack() triggers
> lockdep_assert_preemption_disabled() and leaves the per-CPU klp_stack_ent=
ries
> array unprotected if current is preempted by a task that runs
> __klp_sched_try_switch().
>
> Skipping current in the first pass also leaves current unswitched wheneve=
r
> any other task fails to switch (complete =3D=3D false), and forces an
> unnecessary second pass under tasklist_lock when current itself cannot
> switch.  Disabling preemption around klp_check_and_switch_task(current, .=
..)
> in klp_try_switch_task() would avoid both issues and allow current to be
> handled in the RCU pass.

Makes sense.
Seems this is a pre-existing issue.

--=20
Regards
Yafang
