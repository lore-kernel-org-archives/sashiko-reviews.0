Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768749;
	b=bkrlHd1u5YRT6digLi3PgH5wSOM7XuXqstCAZQjouXye9kzhbc8vYnXrWcNQbM8POH/F
	 jb1zVZKxL5CLiqtuokXMlpkOcJWzTboGK1EP0zRmMgd7s72PEsJMWLA/WM+aHHdjwU8HI
	 SzJWBppyQvRmvdi9dG0D9d7/39KhjtUykWiQRiGSLdBzSokog69ii4yvYqBKM/4C8CNXG
	 iIK1JsSp4tSLSI43AeoC6/TUm4T6UeC2/t/FXZ8KhqEO0lTJrjzAaCk9hBUeQ8I/U2jA4
	 0r7at9T6JlbiEq8DwQEVWdmOLpLEsYLn7yMmfab+u+P8wCLMK1yEgI7j9G6K7NpJHvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=u6uT+2Bkvv4y7LHLfpq7KqJWTqLIyrtx0un1wUCzN+0=;
	b=f0itJTfh6WnK+V9dD73epN9t5U1c2sKF10Ve6a15yWV2roiMaw1Lee7/BP9xwtRwsRw7
	 VZ6Lunra3g1hsj2kobFAAXIR824NKG0lTsX7YznQnB1QolHWvrKLK51+7EquzdHUzGhGJ
	 X4SFbNcAkuonURcufyIWyXCWKnYEO6ybyD4Mi2kqF3WUOe7O8T2nxnYrnMMK8J0NfVcfo
	 ZeyVOJYBh1rxoyYKn0smpO8u58BwcXcnluOf/pJ9NLwl5kAvoj/JJdXU2O5A0PiWMaZ8m
	 Nh2ZRJmh0OsaMQ06+l3WfbSMr0ZmWlCqBbyy2/cxGRQhR6c+2Ab9eY43MDpdOICEmfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ltl1+qB0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52A5606A31F
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 15:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C52A5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ltl1+qB0
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c468bd799ecso137260066b.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 08:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792768747; cv=none;
        d=google.com; s=arc-20260327;
        b=XWFruZ1bB21x3M4tOVWf7xYxpXCK3Zl6Y4koWjNRjWzffPNjC7mSD6xt+CLxLhKO/Y
         k0o2DzgJt69F+aDtD0hkg7xqm7I9A0ME+/tQEQF6wQWWStGeY+ceKIW12SCu2lkgD8Jf
         UrUasT+uoeNmPxTLPUBRkVlH+J+v46U3/Clf3h9S4ogwgzVQ4oBRh/CQItCOw1FGHMd1
         vjBc/EncNyme4n5j0TO2QrnU2dlD8HHhrOzCVqHHLP/eu0/B63eqcc/vCgUfm2Bx7y/L
         pOfyE5A9RmOrTOKrtWkFjSY4FJ7myrn5ZoPj8uANskepgtiP027NGv2YxaBvQbznjjwI
         4nqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u6uT+2Bkvv4y7LHLfpq7KqJWTqLIyrtx0un1wUCzN+0=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=SCSF1+63hSU99VRyzc2xtNT/ySeVqcGTnrpt/m9n8+CQxdVgC8zyUMuXJFQ6AHt8Zz
         z9d/R7TQfhkiYerXZNbNziyXuQRSRHg9rUJeFMPwsmb6gbKSgpkZb6V+hpPKpJy2+gng
         9O7Nz+C2zpYNwnUvb3Xusk+3nOuqA8hefme9KH4ma9JBI5vB4xGtMSjR2wdlmy7ldHcA
         nKj9GPuzNfBqu3Df2pOS7fQdsThKSOK7HJvcjgLLn4UWGQOrDZYwddzA97SoDGKwFslh
         B2tgSrpUGHrHooBX/7tjnFL4simQwA0hhTq3QcLv1AYb9WQO20Vhbh2r3KoNtpX2Y03V
         v/3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792768747; x=1793373547; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6uT+2Bkvv4y7LHLfpq7KqJWTqLIyrtx0un1wUCzN+0=;
        b=ltl1+qB0JUCLpQLqsmxc0w3QAeylnCDOSjykLuYi65CJKTU72IsYTT5lA/fF0WUu4T
         nNyPL/iFW561l4E/0QHjYPcezmyS2FGxHaYvfCq6SIue7Q2Pl+rLO97h2nULT70m0uBS
         0Q2YeG0Qv682jStHvIgF810yLC5Q7qvBLFhXVsfjRxEm//UYKtZfUP5t8AR/qjTLOvF/
         WJGTm5sdWwHZY89N87mkkKZFHJAR58pLIBtIKSl+M3wObL3dbgUNJ286vp7Pi3gvi3Gp
         2I/rND52sIt2yNivTP81os9tmXETij5l0IqmrKuinI6pIIfPxWYsupMzt9pcTHWTtrJY
         kPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768747; x=1793373547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6uT+2Bkvv4y7LHLfpq7KqJWTqLIyrtx0un1wUCzN+0=;
        b=j32EaBvOO1E0G2qO4oIzplyRPOEkMZMqI403TzvBIOnc0RnIkN971ufWr6rmKzl1/s
         BusaBDksLZ+PKqctDfKHrd+IAefm1YxDx0pl+BDD+jj7MuQWZXVUrlIjCfkH2EkzwR9G
         nG5qSEsB1PzpfGr8JsKX7ewA9GPv381OP0NUjnJpyf5ZjIL23Xza9TqqSGNOKVb3viA2
         JFcUGY218AZVsrA7PpBQKdPveLGINPlCk0GF1vF3e42NJQulA9nY8SxBEs5ylS/plc0v
         5wT0/Ut/XjgJFpRDaFLP3A71TlHdWMpxJTofYJgLJdQcrvwbZr55AytGkxVN+Qg2OdDO
         ONgg==
X-Gm-Message-State: AFq9FYLaqBt2MOPHsp7BS9YWujLNrAckgsyPQmA5eOOrgp5WmaTUJ6QA
	7YLQJh0qC9YaP4Vad3FpDfAtAAg7UEUtIRXQeaCEF2NX6NhozC78m3Zze1WqL4qzpQ4Dj7k5Omh
	LVcgH4l8Q4A37lfL5Lli96kQkB49w6/Vd0QtyDeRaWGnc
X-Gm-Gg: AYBFou2ms8BQxozmvq8xzcqlNkOfHZj7g6h6Fj+Ms7VaAmFJglZVWXfnEoBE4xRZ9Br
	MAyn8i1WQyM/tuo++lZE/efPKJmVbCJh8TKae+VKj0XreDnQS843o1/+mt83Uog6w0MOgszQaFb
	rLW5CCTKdmBOHQhQce1YPy8Ni+CL+458egWzfwFTAz2aku88UzGd+QvxHGVkwVgMyuFUslPwRsp
	fiMSfCfXgOFblptsLiEDBhr27x7+stUHlz805WE29JQ3ki2fy3O0G0xv0Ri87mPvf4Twgjff6MH
	Ryb6e7TKKdWgiv2+aQnOb+tU4ZI0jLdTE1QhJs3DCoag7LRrXvEbyFMqDU2YOk3c7OXbqqMtQu7
	r8ynl0Tz7aCV7E+Qvi314HD0BpxqXrx9IWbuT/7H6eieGVDeUjCK5
X-Received: by 2002:a17:907:3f21:b0:c26:1649:47ad with SMTP id
 a640c23a62f3a-c46a942fd16mr354947966b.35.1792768746855; Fri, 23 Oct 2026
 08:19:06 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023124157.75524-1-puranjay@kernel.org> <sashiko-outbox-182810@kernel.org>
In-Reply-To: <sashiko-outbox-182810@kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 23 Oct 2026 16:18:52 +0100
X-Gm-Features: AclHuK_Rbmo7Ro6pTjXlkfAHO3a3wIhqADp6mC6QJTt3bJ2PjzxSLO5fGQVAMg0
Message-ID: <CANk7y0jNvokRcBSFvg3UwYhAS1MkEa_KwH0FfJSD62-xLKPEYQ@mail.gmail.com>
Subject: Re: [PATCH] perf/x86/amd/lbr: Freeze LBR on PMI only when kernel
 branches are recorded
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 2:01=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] perf/x86/amd/lbr: cleared lbr_select in amd_pmu_lbr_del() forc=
es PMI freeze
> --
>
> commit 2fc471183ee73ff1339b34a8c3b4d4e03264c10b
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> perf/x86/amd/lbr: Freeze LBR on PMI only when kernel branches are recorde=
d
>
> This commit skips setting DEBUGCTLMSR_FREEZE_LBRS_ON_PMI on CPUs with
> X86_FEATURE_AMD_LBR_PMC_FREEZE when LBR_SELECT suppresses branches into t=
he
> kernel.
>
> > diff --git a/arch/x86/events/amd/lbr.c b/arch/x86/events/amd/lbr.c
> > index a55646fcb8465..7ec50380ac81d 100644
> > --- a/arch/x86/events/amd/lbr.c
> > +++ b/arch/x86/events/amd/lbr.c
> > @@ -392,7 +392,7 @@ void amd_pmu_lbr_sched_task(struct perf_event_pmu_c=
ontext *pmu_ctx,
> >  void amd_pmu_lbr_enable_all(void)
> >  {
> >       struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
> > -     u64 lbr_select, dbg_ctl, dbg_extn_cfg;
> > +     u64 lbr_select =3D 0, dbg_ctl, dbg_extn_cfg;
> >
> >       if (!cpuc->lbr_users || !x86_pmu.lbr_nr)
> >               return;
> > @@ -405,7 +405,12 @@ void amd_pmu_lbr_enable_all(void)
> >
> >       if (cpu_feature_enabled(X86_FEATURE_AMD_LBR_PMC_FREEZE)) {
> >               rdmsrq(MSR_IA32_DEBUGCTLMSR, dbg_ctl);
> > -             wrmsrq(MSR_IA32_DEBUGCTLMSR, dbg_ctl | DEBUGCTLMSR_FREEZE=
_LBRS_ON_PMI);
> > +             /* Freeze unless the filter suppresses branches into the =
kernel */
> > +             if (lbr_select & LBR_KERNEL)
> > +                     dbg_ctl &=3D ~DEBUGCTLMSR_FREEZE_LBRS_ON_PMI;
> > +             else
> > +                     dbg_ctl |=3D DEBUGCTLMSR_FREEZE_LBRS_ON_PMI;
> > +             wrmsrq(MSR_IA32_DEBUGCTLMSR, dbg_ctl);
> >       }
>
> [Severity: Medium]
> Can DEBUGCTLMSR_FREEZE_LBRS_ON_PMI still be set for user-only branch-stac=
k
> events when more than one branch-stack event is scheduled on the same CPU=
?
>
> When two user-only branch-stack events are added via amd_pmu_lbr_add(),
> cpuc->lbr_users is incremented to 2 and cpuc->lbr_select is set to 1.
>
> If one of those events is subsequently removed or scheduled out via
> x86_pmu_del() -> amd_pmu_del_event() -> amd_pmu_lbr_del(), cpuc->lbr_sele=
ct
> is unconditionally cleared even though another branch-stack event remains
> active:
>
> arch/x86/events/amd/lbr.c:amd_pmu_lbr_del() {
>         if (!x86_pmu.lbr_nr)
>                 return;
>
>         if (has_branch_stack(event))
>                 cpuc->lbr_select =3D 0;
>
>         cpuc->lbr_users--;
> }
>
> When amd_pmu_lbr_enable_all() then runs with cpuc->lbr_users =3D=3D 1 and
> cpuc->lbr_select =3D=3D 0:
>
>         if (cpuc->lbr_select) {
>                 lbr_select =3D cpuc->lbr_sel->config & LBR_SELECT_MASK;
>                 wrmsrq(MSR_AMD64_LBR_SELECT, lbr_select);
>         }
>
> the if (cpuc->lbr_select) block is skipped, leaving the local lbr_select =
at
> 0 (and also leaving MSR_AMD64_LBR_SELECT zeroed after a context switch ca=
lls
> amd_pmu_lbr_sched_task() -> amd_pmu_lbr_reset()).
>
> Wouldn't (lbr_select & LBR_KERNEL) then evaluate to false and re-enable
> DEBUGCTLMSR_FREEZE_LBRS_ON_PMI despite the remaining active event
> suppressing kernel branches?

The behaviour is real, but it is not a regression: it is what
amd_pmu_lbr_del() does today. It clears lbr_select while other
branch-stack events remain, so LBR_SELECT is not reprogrammed.
amd_pmu_lbr_reset() on sched-in can also leave it zeroed, which
allows kernel branches. Clearing the freeze in that state would let
the PMI handler's own branches into the LBR, so it has to stay set,
as it does without this patch.

Restoring the benefit means tracking the shared filter properly in
lbr_del(), which is a separate change.
