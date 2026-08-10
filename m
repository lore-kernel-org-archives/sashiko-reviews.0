Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A253E1233
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370699; cv=pass; b=b8OHaf2YZLwZYJSTq+ClzsY5uKrJnqAmDt3di33+CwbMV2UpCupqqu4Y0VWMCMO/C16CLSY/2eoXh9o1IPnuDKUE+cj9IU0yixkNSpgnemDCRMQh+xjCAqjYb0TCiD/fB7jghiUQ8K5BgIp2Tt9oGbh4JWqWkZGHF9PipWwoGh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370699; c=relaxed/simple;
	bh=aQefb5KGUUtBew9fCgJ/HSm0at5w/RtJ4qdMArEgBms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dln2Q3BWyqGoJumDyHSKQD8mevUkz0egVfsA9X6tyY2TOVu1OH0r0lZb2Iy1IztCBD9ahQFspS5ezpLGvnkJuCjH2HoEu5r9xWFspetvLDGigv0ntEzTOc+qq7FCw7KCv+QZxEcgWzyfJzPQ/ok2FzvMl48ftcDVCkY5rb9dC8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXLAixZD; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXLAixZD"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2020421077so300552366b.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 07:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786370696; cv=none;
        d=google.com; s=arc-20260327;
        b=WzoYAZgDdpSS49my9+KzcL6SiY43ZubGIYGSJo/j2X1SeqYJIF/SsB692feiWtROha
         HC9IELZNJW7vmVl1z5fBzV1wI+MjuRK0ijwevhQo5fGuej4lirtbszKq/FZgvRkIywQA
         KuyLPAQ2yTo6hAniy+0oRzlSAAhN6stspExOU4QyC2ewq3bnm6zwVzv2bieHNmYZ7Omb
         aaCrSSdDfbDH7fzIIts9OjhC2C5r+DYVJZ5jlfQcxVOv8a6R3heIHPvtHseupQhujBv8
         V8tFgp52OXOnJrLwJzFCZpJhCuruh3MsoYNwRNwEKSpZtexGPkQ0LuJ/MTQAqpZZSXsX
         /CmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rXErR0QDrrFQK5fNUe5J6pmYbKM/4pwmkmKBefRuoz0=;
        fh=LQLdSW01h2ROUwNK2N5+UwHQ+4lE93qNu55uGrsD190=;
        b=qDGxi4vfrjivMmKL7+mCpGsu2D5YYNhpuAIl7xLg4iZVFZJb6HJGawaFjv1Ae7xpnG
         6fijql3OXUROulljOYsVbu1PPvm97csMSFFxhETMBGQ4E5BFJyqt/1BWeIRt+/rS6dz+
         jkO60cITNvSei8ccDXl1TEU72FjAVfMq6+HQO1147zrEvILUNIn9ji9JRtbvpzSm28GS
         zNoLxk7vw6nY9xn6JRBbtKZqR8+Al8vo8CTS6KzzhrLQ1PSztWPdAOt0NHz9K8g/fJh+
         4mKFz5Ic/EO+pTZxMVVMGKCrUfsdHyDB6uunm9s+JRYBzVFdzDWJkB+6k1QcBZ02KIVr
         ZAkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786370696; x=1786975496; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rXErR0QDrrFQK5fNUe5J6pmYbKM/4pwmkmKBefRuoz0=;
        b=kXLAixZDMvxsRF7fBxjEpTrjK+fqz3ydNLa7G/RNUX9yPkmon5V/zrNFr5qtpQrpOB
         mpm2YmY8Dz95mSdcAh+1ODy9RBY1b1G532KOOlxx4vovxj/GiNit0LJMiJYsBaQKCo8S
         Im/2LF7KgRTf62FVkDOpPLulHzovucw1+gquvfCBqMOcta5Gh/hcS7oJskmcamKiWq35
         Kjfb+56B3afyNidSfjdi2FmtkcmSAlqtVNR5gzMok9Ma9mmJtVXUzm/xfyfUq3yZ18cf
         PQ26QidN2UoWWNYQColDLauOMBpI4vZVr0njRaDC1190uCRCwAXqKyYgy/EgNN2DQ8i1
         nPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370696; x=1786975496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXErR0QDrrFQK5fNUe5J6pmYbKM/4pwmkmKBefRuoz0=;
        b=izPJatTotInP1qMCYkUW/kajsbdQwNlSsLgS4+CBXvwXuMlUKw+IMqkA5DvqDnsZXX
         4rqzEX7rKEzsDWW4OAey50R5B0BdL9pUsktU2P/MDQyf4G3h4EfyO/neQcQAaHZLLwJa
         gyDVcRjdMjktMmWyhfeY+w3NiC0FO2yn1v/GPS4gnvO5M9rmHujj01E3znZMhFYJWmnl
         mJv3R1ynTXEk0URoA6xcpc7/xxxHH6cHpukofUptxLtSBUYCeWg++/S7N5Kvvya/xYdT
         e6qGJS3ViU/+W1E2LyDo4yvxIEiTAvz1xUYMn8RLJm2RYtotvsPuHvQF16qFRlJhjsag
         zFog==
X-Gm-Message-State: AOJu0YyqloCR47qXdsZMg1pxE/x99WP2fux9Uj7Fogmt0jmoSNiq6B3N
	aKToSkpLeYd8e40HOK96UtF24k+48hg9axmC+O25dpzapKUQwxLIk/3xEC5ulI/pvhfBsz9nR4I
	QA4td9sFWGRyVz7dFtljEpsXhyOxRxVkUZFN27TI=
X-Gm-Gg: AR+sD13g1SHJ1hJCX0E7XXQNemPNsB/7tFBPqLjvAUXmmvg9a+Gea4EZ06KOJ2B94gD
	XZxpiXyesSpP+1RFlOsPPgzLmpWhZE/z8bAQB172PiaF+CuGgiXzQxfeABZ6dC8A5Y/KYc1jW/V
	dcTJmQ6ZMXqlCAVQil1CmIfTtUB7PSMGP6uAw2morHziIbj+xYdKwxm8WGfb6hyjQ9ei5UbaYGq
	hgP4CAW1IcItNY04pIzZK23bTz3IxQ6f7183dIZ7jQeEkUOpS6xdjItX1vWU/11zu8JqtnMe+FV
	xzCjpx79yKQOzZA0SVQKhfQBvHd2ALgP4uRCxnkBxLSmABK99nPbdM627hGjVY+kGLQ+yhg=
X-Received: by 2002:a17:907:8e96:b0:c12:83c9:d41 with SMTP id
 a640c23a62f3a-c20c67e6fd9mr99288466b.12.1786370696006; Mon, 10 Aug 2026
 07:04:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260810133540.1947118-1-puranjay@kernel.org> <20260810133540.1947118-2-puranjay@kernel.org>
 <20260810140306.C1D721F000E9@smtp.kernel.org>
In-Reply-To: <20260810140306.C1D721F000E9@smtp.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 10 Aug 2026 15:04:42 +0100
X-Gm-Features: AUfX_mzW0QQd2n7jimcEIfkUiJMD2Japtfg5KrPbI5Jksmx_wgWQIhzjSqo4ogE
Message-ID: <CANk7y0gUp5-Rqt-CCmfh1W5o2sMHW+Z=oGrjLYXdS81ZLE-TaA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] perf/core: Fix NULL pmu_ctx passed to pmu->sched_task()
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 3:03=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Per-CPU PMUs missing `sched_task` callbacks during context switc=
hes if a task context exists.
> --
>
> --- Patch [1]: [PATCH v7 1/3] perf/core: Fix NULL pmu_ctx passed to pmu->=
sched_task() ---
> commit 333df3e02c2d6b54e5bd528f91779820677d118e
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> perf/core: Fix NULL pmu_ctx passed to pmu->sched_task()
>
> perf_pmu_sched_task() returns early when cpuctx->task_ctx is set, and
> cpc->task_epc is only non-NULL while a task context is scheduled in on
> this CPU. This patch passes &cpc->epc instead, which is the CPU-wide
> context for this PMU, avoiding a NULL pointer dereference.
>
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index ba5bd6a78fe7b..c372213ffc883 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -3907,7 +3907,7 @@ static void __perf_pmu_sched_task(struct perf_cpu=
_pmu_context *cpc,
> >       perf_ctx_lock(cpuctx, cpuctx->task_ctx);
> >       perf_pmu_disable(pmu);
> >
> > -     pmu->sched_task(cpc->task_epc, task, sched_in);
> > +     pmu->sched_task(&cpc->epc, task, sched_in);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does the early return in
> perf_pmu_sched_task() skip callbacks for CPU-wide PMUs?
>
> If a system-wide PMU event is active (sched_cb_usage > 0), and a context
> switch occurs to or from a task with an active perf event (meaning
> cpuctx->task_ctx is set), perf_pmu_sched_task() returns early:
>
> kernel/events/core.c:perf_pmu_sched_task() {
>         ...
>         /* cpuctx->task_ctx will be handled in perf_event_context_sched_i=
n/out */
>         if (prev =3D=3D next || cpuctx->task_ctx)
>                 return;
>         ...
> }
>
> It seems to rely on perf_event_context_sched_out/in() to handle the
> callbacks. However, perf_ctx_sched_task_cb() only iterates over the task'=
s
> pmu_ctx_list:
>
> kernel/events/core.c:perf_ctx_sched_task_cb() {
>         ...
>         list_for_each_entry(pmu_ctx, &ctx->pmu_ctx_list, pmu_ctx_entry) {
>                 cpc =3D this_cpc(pmu_ctx->pmu);
>
>                 if (cpc->sched_cb_usage && pmu_ctx->pmu->sched_task)
>                         pmu_ctx->pmu->sched_task(pmu_ctx, task, sched_in)=
;
>         }
>         ...
> }
>
> If the task's perf event is for a different PMU (like a software event), =
the
> CPU-wide PMU won't be in ctx->pmu_ctx_list. Does this mean the CPU-wide
> PMU's sched_task() callback is completely skipped during the context swit=
ch,
> potentially corrupting hardware tracing or leaking branch records across =
tasks?
>
> >
> >       perf_pmu_enable(pmu);
> >       perf_ctx_unlock(cpuctx, cpuctx->task_ctx);


Next patch fixes this exact issue.
