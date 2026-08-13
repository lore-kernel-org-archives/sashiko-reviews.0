Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145D432E6B4
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 04:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786594606; cv=pass; b=MVJu4exO4V5wTw4VQ7DkFkFpOs9AEBi0Abp4mMWx24exz57JuZh4ZJoCq5tRcleK2HV1WwF6tawVzwvU88qR+OOb4mxb9rr+sbTPu0s5UM+BOzTWAuuhNpXCsqX85LP8tvKV3aPbaHdOHZ9nTwAywT60YBtDxI9nrkRdHJ4QmZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786594606; c=relaxed/simple;
	bh=kyvju2B3kVRFWxtt3UBGqzSAAkahmS3D2grt7G1bekA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u83rfOozLWbHJZ/6DI3cbBuZtug0wXtsg0/vV58y/GvCEqSI80f4E7zHUZtBmPyJUZqbKncYI/5vvSGdhvKHIYqA++udp4SMYVoBWUdAgbViaMjQdafWUQ4w5HIMe2Ouqu5Z4bZ8V85vYYfizEh/7QyYZJBlMNx46gSAY4YBMU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wxc+payK; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wxc+payK"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-667923d86a7so927984d50.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 21:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786594604; cv=none;
        d=google.com; s=arc-20260327;
        b=U7DIAwnPViPbPTpR54d8tlU5Ua9rHB1qMAxK+wXDkfHLSa42Oi87ohW/EXVagkfmRw
         pXvLWtwwDFWkx53XH/ypJGxqjIfFNRjnex6EUReDbTLBvkmTfWeio/xWipT9Wsy/5D9N
         0P/PJnakbQAWl9SmVmX2JnvTEo0TLPOiR6/AdllyhuzCYGoH3Ojlpb6JrobV2PUfxH57
         kUMCKbd9sHT1RH1Dkn/jyfuzwEMVYsv+1mUEI/F0QAsgCRPGDJaNkMr0JJwoN5geZjrF
         vTgt74qd+BwF4kKlJeRUERXuQwUpo0Q57crUgToh8V2AUDBo9nX2aaV0gs032rn22hKi
         oZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hj+aZ+4yYhvsPaAhIqtP1+VT7SwFhpMGkiPhnjwuFe4=;
        fh=nqphhD1P8K1WKXaIQRKZ0UgWTbqJHCEI7dwObfIwAhA=;
        b=ji0nj2VF56FZjE47DgQ7dxFdtwLCd7DgqACXW1Fx8IIxX9YFZGbBOvsFwc2qRel0cs
         byLwv5rfVOmyMbt/M2/T8Ro2JAaWcz1H2NYpU8HnDV9h5qBC0e07e7Ot5QVUaXnBdPaT
         hNTb6PzCCL6zhiT1GWjZiJMTd0Nuwe9T9tOc8C6XQVlgxjwuw4Rbow0XLFGr6Ho2KP6B
         febyfmCfTr0SrKwPCSsK4HR/jtOq5xM3JoUv+o5wGHsKe+zJFhABGKPR/dR565CG54T3
         bBXMMcZDrToaC6lhnbCRxdvltPBjrPKJIsy0Z2e8oJangNxQATNMDPzZ9g62EfQpkpg1
         /mFQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786594604; x=1787199404; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hj+aZ+4yYhvsPaAhIqtP1+VT7SwFhpMGkiPhnjwuFe4=;
        b=Wxc+payKX6TZQwSdJo6Faov9UHM5M+PcT4IDjBEd/LwLmaTFQo3NKIDmmTI34PQOZe
         HhHOhNjaBjVmxrjV8AQxytegmxIKdqPsNNkLmKr61Cx2qWU3gI3ceSsLSN/Ibi5CkWCS
         itvUsg+b/AKujrktvOwz4Yc/QXBbb0uKSd9WNYTO0uhPysYNXXASgEeOwXVh2SqMnWWU
         gi1+AVIlk8d1hv78GrfvTfotmDNfAj1zl0Sq79ixaJRffAEqg0GL/YzSxr1DmhoR/rz2
         YYmVtKjEbvZ12d/dnq6HL8Eoys4iqhzJbf1h5dSuNVUiPuW4R9GUZ+oiv+9+AIFvnlcW
         Z/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786594604; x=1787199404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hj+aZ+4yYhvsPaAhIqtP1+VT7SwFhpMGkiPhnjwuFe4=;
        b=i7jo6rU3G2zlKZJzsfL+nTdDYR/dDVKDabWeG+bCmIIAMMuBIciJHobCqJzzYTz6cb
         wW5CxSTiY9WdU8S9iReDFyrOMF8we1RU05xTSRfNWIrYqYYoyfNlxhWoS4fWk8nT+Aij
         Z1QgmK2sEPDOhy6rXojLej1mKPtN3OYwylbM/vzlXqgkWxn6sfRNRsS/VD85HRKVpS9t
         LVXTZ5h7SuFRE7sV1JJGNlVa/P/saESrVTSgh9GCJ3o6ngG9E1WTAC0YAKXx+gMAo3q5
         HL2OqKoQhMdCcUBzwGcdDYMYnRWlozUwprbJHhDRNqjiHaZwKMYlqd4+6ynEH3frq+WA
         T5TA==
X-Gm-Message-State: AOJu0YwkDrtT6N2x/I5tGWhAMtnC85OhayAj/gVPsIEEx01vOWMSSqBe
	3GeXFwZt2ujicSHBC34CtY8jTDwzVARuBcEAjWbxASIzbcgL+oUI1zI5xV/AFzziRus8tvu1R7+
	JQmiDnBS+qPWT9TpFFvIromUyzx29Gjg=
X-Gm-Gg: AR+sD139XSrtHIKZXG1NNl+hlqr6A7mheebhWJoCGZ8XzfHudOVie8KXXiNi3h3ln31
	af5TOSdZs05Zqt6Oihppuf67d47LCB1T7jT+2lLq8YhJDYLW0BGf3U1QryeRjsGo8+gcVq+aWrm
	YzwhfFa5KAd7VUJvBvh9NmfhE2h2QNsmpVUSr1GIY+5fXxHcB731WN4Huep+c0zPuKYa4FMOaTr
	vCzH+eDVeFyy7+K/ExNfKPM6lqLu7CCl7ysASa14ebLbnL4lxyq515LHn7ydC9Brt71SkZLeCbW
	f/92gUpQEAOcpJbiKy3WfSim+sXasVnO74mES+TfkDtfhPQlVBZpwXIatOXGp2Br2k05yGJnJOg
	5stwapp0RXQIsaGspTSRvlmozSOnpPiV7VouKB4TGDk9v
X-Received: by 2002:a05:690e:2584:b0:668:a17:daed with SMTP id
 956f58d0204a3-66c54c49056mr818130d50.21.1786594604022; Wed, 12 Aug 2026
 21:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811235331.10044-1-kartikey406@gmail.com> <20260812000859.654FC1F00A3A@smtp.kernel.org>
 <anxMXBwCX0HCYgxr@krava>
In-Reply-To: <anxMXBwCX0HCYgxr@krava>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Thu, 13 Aug 2026 09:46:31 +0530
X-Gm-Features: AUfX_mwfqzym4wGlqOQexfSsnhGUEHmMvw1zBvwX7sKbdWrWjMFru5WvJUuewL8
Message-ID: <CADhLXY5QdvPjyK+X0q4S4wF71CTt-RQ76fHt_W=x-BmVka9LAQ@mail.gmail.com>
Subject: Re: [PATCH] perf/bpf: Fix data race in __perf_event_overflow
To: Jiri Olsa <olsajiri@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 4:05=E2=80=AFPM Jiri Olsa <olsajiri@gmail.com> wrot=
e:
>
> On Wed, Aug 12, 2026 at 12:08:58AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to consider:
> >
> > Pre-existing issues:
> > - [High] Lockless TOCTOU race in perf_event_alloc() causes NULL pointer=
 dereference or Use-After-Free during BPF program inheritance.
> > - [Medium] Incomplete fix for data races and missing memory barriers in=
 BPF attach/detach paths.
> > - [Medium] Time-of-Check to Time-of-Use (TOCTOU) race drops valid perf =
events during concurrent BPF detach.
> > --
> >
> > --- Patch [1]: [PATCH] perf/bpf: Fix data race in __perf_event_overflow=
 ---
> > commit f63a2be5ceb79a2a8bb0263ba6723f7bf4ae763d
> > Author: Deepanshu Kartikey <kartikey406@gmail.com>
> >
> > perf/bpf: Fix data race in __perf_event_overflow
> >
> > This patch addresses a data race where __perf_event_overflow() concurre=
ntly
> > reads event->prog without lock protection while perf_event_detach_bpf_p=
rog()
> > writes it to NULL. It fixes the race by introducing READ_ONCE() and
> > WRITE_ONCE() in the respective read and write paths.
> >
> > Reported-by: syzbot+651d2774bd1d8395595f@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D651d2774bd1d8395595f
> > Fixes: f11f10bfa1ca ("perf/bpf: Call BPF handler directly, not through =
overflow machinery")
> > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> >
> > > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > > --- a/kernel/events/core.c
> > > +++ b/kernel/events/core.c
> >
> > [ ... ]
> >
> > > @@ -10766,7 +10767,8 @@ static int __perf_event_overflow(struct perf_=
event *event,
> > >     if (event->attr.aux_pause)
> > >             perf_event_aux_pause(event->aux_event, true);
> > >
> > > -   if (event->prog && event->prog->type =3D=3D BPF_PROG_TYPE_PERF_EV=
ENT &&
> > > +   prog =3D READ_ONCE(event->prog);
> > > +   if (prog && prog->type =3D=3D BPF_PROG_TYPE_PERF_EVENT &&
> > >         !bpf_overflow_handler(event, data, regs))
> > >             goto out;
> >
> > [Severity: Medium]
> > This isn't a bug introduced by this patch, but does the independent sec=
ond
> > read in bpf_overflow_handler() create a time-of-check to time-of-use ra=
ce?
> >
> > If a concurrent detach sets event->prog to NULL between the READ_ONCE()=
 here
> > in __perf_event_overflow() and the second READ_ONCE() inside
> > bpf_overflow_handler():
> >
> > bpf_overflow_handler() {
> >     prog =3D READ_ONCE(event->prog);
> >     if (prog) {
> >         ...
> >     }
> >     return 0;
> > }
> >
> > Wouldn't bpf_overflow_handler() evaluate prog as NULL and return 0? The
> > caller __perf_event_overflow() evaluates !0 as true and executes goto o=
ut,
> > which unconditionally drops the perf sample.
> >
> > Should the already-validated prog pointer be passed directly to
> > bpf_overflow_handler()?
>
> seems legit
>
> >
> >
> > > diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> > > --- a/kernel/trace/bpf_trace.c
> > > +++ b/kernel/trace/bpf_trace.c
> > > @@ -2018,7 +2018,7 @@ void perf_event_detach_bpf_prog(struct perf_eve=
nt *event)
> > >
> > >  put:
> > >     prog =3D event->prog;
> > > -   event->prog =3D NULL;
> > > +   WRITE_ONCE(event->prog, NULL);
> > >
> > >  unlock:
> >
> > [Severity: Medium]
> > This is a pre-existing issue, but does this incomplete fix leave other =
data
> > races in the attach and detach paths?
> >
> > Other functions like perf_event_set_bpf_handler(),
> > perf_event_free_bpf_handler(), and perf_event_attach_bpf_prog() still
> > perform plain writes to event->prog without WRITE_ONCE().
>
> was wondering the same, the perf_event_detach_bpf_prog is called for
> tracing events (tracepoint/kprobe/uprobe) the perf event release goes
> through perf_event_free_bpf_handler, check perf_event_free_bpf_prog
>
> jirka
>
> >
> > Additionally, does this need release and acquire semantics? If the writ=
es to
> > event->prog and event->bpf_cookie in the attach paths are reordered by =
the
> > CPU, could the NMI handler read a valid event->prog but a stale or
> > uninitialized event->bpf_cookie?
> >
> > [Severity: High]
> > This is also a pre-existing issue, but does the lockless access in
> > perf_event_alloc() create a use-after-free or NULL pointer dereference
> > during BPF program inheritance?
> >
> > During fork, perf_event_alloc() inherits the BPF program:
> >
> > perf_event_alloc() {
> >     ...
> >     if (parent_event->prog) {
> >         struct bpf_prog *prog =3D parent_event->prog;
> >         bpf_prog_inc(prog);
> >         ...
> >     }
> > }
> >
> > Since this accesses parent_event->prog locklessly, can a concurrent
> > bpf_perf_link_release() clear the pointer? If the compiler reloads the
> > pointer after the check, bpf_prog_inc() would dereference NULL.
> >
> > Even if it is optimized to a single read, perf_event_alloc() is not ins=
ide
> > an RCU read-side critical section. Could a concurrent detach finish its=
 RCU
> > grace period and free the BPF program, causing bpf_prog_inc() to write =
to
> > freed memory?
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811235331.=
10044-1-kartikey406@gmail.com?part=3D1
> >


Thank you for the thorough review!

On the three issues raised:

[1] TOCTOU in bpf_overflow_handler():

You are correct. The second READ_ONCE() inside bpf_overflow_handler()
creates a TOCTOU race. If a concurrent detach sets event->prog to NULL
between the two reads, bpf_overflow_handler() returns 0, causing
__perf_event_overflow() to drop the perf sample via goto out.

I will fix this by passing the already-validated prog pointer directly
to bpf_overflow_handler() instead of having it re-read event->prog.

[2] Incomplete fix - other write paths:

Thanks Jirka for pointing out that perf_event_free_bpf_handler() is
used for handler-based events (tracepoint/kprobe/uprobe). You are
right that my fix is incomplete.

I will extend the fix to also add WRITE_ONCE() in:
- perf_event_free_bpf_handler()
- perf_event_set_bpf_handler()
- perf_event_attach_bpf_prog()

[3] Lockless access in perf_event_alloc() - UAF:

Agreed. The lockless access to parent_event->prog in
perf_event_alloc() during fork can lead to NULL pointer dereference or
use-after-free if a concurrent detach clears and frees the prog.

I will fix this by using READ_ONCE() to capture the pointer atomically
before the NULL check.

I will send a v2 patch addressing all three issues.

Thanks

Deepanshu
