Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1CF348465
	for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821507; cv=none; b=WwBnI2N9jkwlKTpqOk1WsfiI/W3KNVst6xkTUISMDWYwBWWSkYz8hh0vUkwo88KXyL26SeSkFReUkIe27pFWEl0Qis7h520ioAa5K7JoKnc/Nce3m8LfKaCHnBy4tayeAvjP6IwZz8VRO/m+5kEW+VAWCpzr10SCNksDour6I9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821507; c=relaxed/simple;
	bh=lx4MOuPt2kP7MGAbn5bWo4Ms1Qte1SBmSD75PUOM2gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FOnCN4U47swNZMYz9hb2aVE2p08+XHL5XDyyfPburyDE21WqaVRVSeouf/aIA8q3xaeARzpwZhmilY8ZNvct2+2YcfXUIS4mgtXV70BtteiufiUApqAqazVbN9LNXXdJYL1CGm2OeGl0FYxc0zTVF8eTX92qSqxArDnGZlkacME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QI7DPiwj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QI7DPiwj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787821499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mLLq8yOxwzR5S4mcnBaUPftModHZoRx/qzRb/ATZRCA=;
	b=QI7DPiwjzMVlyY8DD4ks7FmfgbkSggSzSuRUKeZkoRJG4CcDDsjj+6moSyQbfAjDjdVSJf
	BZofiNp4fhP8Ww4i6WDG3RsJQtYbKs9gUR/NuXe5ylEyfMkTaxsRVNPIIovPCGH/mD/rwm
	MNLuU7Pv569stAAwueSjKA62hE0Javg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-4eo4tKcLOAqSDFPCs-NfwQ-1; Thu, 27 Aug 2026 05:04:57 -0400
X-MC-Unique: 4eo4tKcLOAqSDFPCs-NfwQ-1
X-Mimecast-MFC-AGG-ID: 4eo4tKcLOAqSDFPCs-NfwQ_1787821496
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c213d5fb55aso214432566b.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 02:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821496; x=1788426296;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLLq8yOxwzR5S4mcnBaUPftModHZoRx/qzRb/ATZRCA=;
        b=qyquGVrZ+Mqm9qQ62bs1SIa2oAMjWKfMBnQcMycn7poQJGgq1CU31T6z99RkCgRNf1
         kIK1Fl0WwxLxpehMHw/raML5WImq0ybZ2f20+Me5pti4Hw7NastyNVowL5B8CDJdnFLT
         gjmOhVre9L2bBfxJUheZzqaYFkDMZOAw3L5KK/pQRdqjsgJsbW5dTsy1swDayYC8XTTn
         3VFoMsjzZvRopHxFwGQUKr8WMGvWVk+p/c+YpCmjeMbL7+/EgUgISvbisJ9wASBc31NY
         769Ds6pcemFGvAQpsTagn26kqQV7WuGfPHlkD1kWxH0YqhuptsKnVEokVU45L6fTji7p
         O0qA==
X-Forwarded-Encrypted: i=1; AHgh+Ros/pLtG94x0X9gWDYLh+GtWbWHykX64zPoiUEap/XCh8t3Yb14aV63i+DpfKhH183uFbZg364H72Mzddd108Y=@lists.linux.dev
X-Gm-Message-State: AFuF++lppRRMcUv+NQsJNaMOyuQ4ANGOUdnwak0qnkjzmOLCNhBBCaNm
	Q0+ZK8rELN7nmbAlLdv0YoSqa9Gp8/b/uFI355R6gmz/ikSsuap2VurCwCbz3j/amMag3vOLwJf
	prhOnow1gIDcKdxg6MJpqdMx0EDOnd8wh/ToYG+uxik4fU+QSRaUKMJgiXxp6IwfJLLSoj1o7Pi
	21bozZAn8R+eOfjSypL7N16DfmvlioFzCUp5qpI1Tqz70Mud1T0V2X8Hs=
X-Gm-Gg: AR+sD13AYjOtscNWEJk2I7Nshv24q4Z4KuzVJU1+f3VKZOAEkcdMJcgbEpMj8MnXlSw
	0CdGjMlobpUYg5t02r20qcq6j1HuWPw8u7N+6zR7N5F1bhOLE1ly8Izy9UIvIfqzg8xR2IOCEsL
	8zXe5UXvgJ1Cqfamo1H8EIfkOjZG1fJoKImDVrTXZXXpFDTuVX74ysSVbI
X-Received: by 2002:a17:907:3e26:b0:c12:83c9:d41 with SMTP id a640c23a62f3a-c250c595aaamr1332874566b.12.1787821495964;
        Thu, 27 Aug 2026 02:04:55 -0700 (PDT)
X-Received: by 2002:a17:907:3e26:b0:c12:83c9:d41 with SMTP id
 a640c23a62f3a-c250c595aaamr1332868566b.12.1787821495442; Thu, 27 Aug 2026
 02:04:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824211544.3984835-1-crwood@redhat.com> <20260824211544.3984835-2-crwood@redhat.com>
 <20260824213037.F41B11F000E9@smtp.kernel.org> <20260826153132.1333fac6@gandalf.local.home>
 <588ce7912915573ccba7439d7e50a90d7941c764.camel@redhat.com>
In-Reply-To: <588ce7912915573ccba7439d7e50a90d7941c764.camel@redhat.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Thu, 27 Aug 2026 11:04:44 +0200
X-Gm-Features: AcwNN1UNmFxRU8e_F0pysLHFjW-g2Nsy76t0iEs7XkgqngUUF9dD7UYeAqSVmKk
Message-ID: <CAP4=nvTZ3ZKf23j=P_=ZpMD7AHvnHOK=f0W=Aa+1Af-zBrBVYw@mail.gmail.com>
Subject: Re: [PATCH 1/4] tracing/osnoise: Per-cpu mutex and fd detachment
To: Crystal Wood <crwood@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, sashiko-bot@kernel.org, 
	sashiko-reviews@lists.linux.dev, linux-trace-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZPqp_L-f95PV0_kvbGWna4dAHmj90ySqtayxFImTjZQ_1787821496
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

st 26. 8. 2026 v 23:21 odes=C3=ADlatel Crystal Wood <crwood@redhat.com> nap=
sal:
>
> On Wed, 2026-08-26 at 15:31 -0400, Steven Rostedt wrote:
> > On Mon, 24 Aug 2026 21:30:37 +0000
> > sashiko-bot@kernel.org wrote:
> >
> > > [Severity: High]
> > > Can holding osn_var->lock while calling kthread_stop() cause a deadlo=
ck?
> > >
> > > kthread_stop() blocks waiting for the target kthread to exit. However=
, if
> > > the kthread is currently handling a migration request in
> > > osnoise_migration_pending() (shown slightly earlier in the diff), it =
will
> > > attempt to acquire this same osn_var->lock before it can clear its st=
ate and
> > > exit:
> >
> > This code has a lot of nastiness in the locking with regard to the thre=
ad.
> > I haven't looked deeply at your patch, but the fact that Sashiko pointe=
d
> > out a possible deadlock I think you may be hitting the mess I was hitti=
ng.
> >
> > Have you looked at this thread: https://lore.kernel.org/all/20240820130=
001.124768-1-tglozar@redhat.com/
>
> That thread is about user fd sync, which is what this patch is trying to
> address.
>
> This particular deadlock is with kernel threads, in a corner case of
> getting migrated even though we try to pin them to one cpu.  We can get
> rid of this migration code and just have stop_kthread() take care of it,
> adding a get/put_task_struct() so that it's OK for the thread to die
> early.  This way we can also handle any other abnormal thread exits.
>
> I'll respond to the rest of the Sashiko comments soon.
>
> >
> > It has some tests I ran along with tracing that detected issues. Of cou=
rse,
> > everything needs to be run with lockdep enabled too.
>
> I did run with lockdep (and some custom hacky state tracking) but
> forcing migration is a hole in my test coverage.
>
> Is there a particular test you're suggesting?
>
> -Crystal

The race window is practically really small. I had success of
reproducing the migration deadlock in a virtual machine with a bash
script [1] that deliberately slows down the kernel/osnoise tracer with
perf, ftrace, and bpftrace hooks:

[root@cs9 tglozar]#
/home/tglozar/dev/linux/tools/tracing/rtla/osnoise_migration_race.sh
13 10000
cpu=3D13 mask=3D0,1,2,3,4,5,6,7,8,9,10,11,12 iters=3D10000 stop=3Dnop
iter 1 ok (kpid 265080)
iter 2 ok (kpid 265086)
...
iter 422 ok (kpid 267814)
*** hang iter 423  kthread=3D267821  affiner=3D267823  stopper=3D267827
    cat /proc/267821/stack /proc/267827/stack
    do not rmdir instances/ or write current_tracer/online; reboot
[root@cs9 tglozar]# cat /proc/267821/stack; echo -------; cat /proc/267827/=
stack
[<0>] timerlat_main+0x266/0x3f0
[<0>] kthread+0xe6/0x120
[<0>] ret_from_fork+0x1be/0x250
[<0>] ret_from_fork_asm+0x1a/0x30
-------
[<0>] kthread_stop+0x6b/0x180
[<0>] stop_kthread+0x86/0xc0
[<0>] stop_per_cpu_kthreads+0xf/0x40
[<0>] osnoise_workload_stop.part.0+0xc/0xa0
[<0>] timerlat_tracer_reset+0x9/0x40
[<0>] tracing_set_tracer+0x14d/0x300
[<0>] tracing_set_trace_write+0x7f/0xe0
[<0>] vfs_write+0xf8/0x410
[<0>] ksys_write+0x65/0xe0
[<0>] do_syscall_64+0xc1/0x460
[<0>] entry_SYSCALL_64_after_hwframe+0x76/0x7e

[1] https://gitlab.com/-/snippets/6045758

Note that any path that is calling kthread_stop() can trigger the
deadlock (together with the migration), that is, both making the CPU
offline and stopping the osnoise tracer. Sashiko flagged the former,
my reproducer used the latter (the script can do both).



Tomas

