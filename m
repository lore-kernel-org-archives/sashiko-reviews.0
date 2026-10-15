Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43143E40F0
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 16:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081621; cv=pass; b=SiWhMPmUw1/gGJh6aYCDaJysh++DxlLEE3XSsKoKin2iSg+3+E7negrjh2CObv0FXsbshQDg+ZBZoLypwFNNJx7uz0PHecoqN9HTLemwznHRSoJ62h6P0L7uoGZ0wbWVsIqoJEPNwNOyJbO4Dw56RfR162uS2Pwc6V0AVYjVjEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081621; c=relaxed/simple;
	bh=N0D2+lxGxkgjYjD/xHOXk7G+ut4gcFiL1Be4Uuzrs5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=faft6t6EAKEJA8dI5h3+Uw1oS4gsE2hNo3OAdgIUGIFVW7jSH1YJmKkmHdVRf3HHB1ghCa8hLF6L5cmG3Vlw+Zf+1x5hQOwi6QH9hhwTMzaO+YYBGNonaOdOc2ZV60Na1mG2mIxWcDD9j+3+c0hapAqqWlFp/n/kbPy0ykadOOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Dd5TZB+y; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Dd5TZB+y"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso6088809a12.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 09:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792081605; cv=none;
        d=google.com; s=arc-20260327;
        b=LDXz447LxHYGj4tBcCNaYAkYf2+CE5A+lV8h5D1f4b8yWAWkoAXsoNpn6wbgXR06U5
         twv30/efvN2qzEz680VKWpV6aqMgneAmo2HJLZN2+jOPzb30Q7CMD3GWLuesMqSpAaXi
         hYRWIBK9APfLC22R7SIgmrptgqJg4emZKpfBuiP+fb4V210YdU2q+pUkqm2KplaU6Pou
         aeuLHpPxGAzXaagu9aDv9+Z5hZol0ZKSNQAe4Fe50v7hvH94Awo12UgnrVrdy4H8Y7uW
         iEHpP6rgCts3rmF8cqJnTxS8eaZebmoMT9iOXGfGwtMgbSYgcKwy3PSd5Gz1BpBx/Pcj
         vFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p/L6vStTTkLKkbTFW53DI+bTesyu/E9Cvyn6tkFsfkM=;
        fh=Olg9NPsFJ968eA8bLPY6Gzk7BnFPXl9lhiH4/GPXfsM=;
        b=lFPsRGW6BOnnc8WLbUfQo4tlqXgGh7iajXxDn16aFUJJFDqtAd4GCmXPCBWeoWdiGC
         aPTeblfLrY3tSI0nBWoNdoDIPDXXyOusv2kWlrcMk5Cd+y/tmCpAYolZ7UK3CdHyP/v2
         CvXLa8lpwi4AsIXT+S+Iksmn1vKONd/AWSMYEOqZY6AHF1n1Xk/OEzaXOmqvu0BRatrf
         OvEAvS1I5TCvz6XF9BhMDwhmlLcU3ChrGqWYty9gReJpMRG9mfOZ419hZ9a25FKzna2T
         0uCDBGA+j8bIQoyt8wKDD/xTilgOowLSvUZE4Nn1jC7v+JTynP1MWmR2teW8M3xBRUiF
         wlLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792081605; x=1792686405; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p/L6vStTTkLKkbTFW53DI+bTesyu/E9Cvyn6tkFsfkM=;
        b=Dd5TZB+yF4ukTKoLAqjVp5NtBrW8Hyqvmld1UB9rkGAd7/apX7c4qYC/Pa/vDpUti6
         m+ZJzl3JmfPiPn4K+jdbsfPoWPZWn0YoF2FZCGvCJYwOb7b6ooEnj0YOCrgGHo4G03hd
         x7SxTm1AY8BXaUgAUGnoVCDgAas/uBrqeuW5kGGBHnJVu4K7GJV7YmOdsvLuJrWCIlfG
         uRs1vZ1nwcmS1X/hc4bPiP20MKtpKl6CvSu+NuNHx5seRQxn1W2FCH89/1+oeWB6yeLT
         wVVVV2trG8t6Mp+ouwXcFYOXsJtDI1lvKQrvi5ZwzChu57180d4arzit86WPe4+pO2PK
         VQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792081605; x=1792686405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/L6vStTTkLKkbTFW53DI+bTesyu/E9Cvyn6tkFsfkM=;
        b=vxzSqpjZKlNPr4n/uzyL6NyifWCeFZvJw5vBB1rmyIgFLH9tDthp6r7XNuj0Tp4tqE
         sSBWUKY0EdK2uHGt4xuClCJt8XNKzPDQQ0kXCqz83F3SlRUNnY2NjSSAFwwyE49GZv1q
         yYm8SwzegARAIWHE2J5jCy14Mbq53iP9/SiZC3/XudXm1BWFg2uRmlrGqv98kQ5xWS2v
         hZDiEUMNn4UNJ7UHEUi+KpvkBXTTs2EpSd6h24x1HQSoAhXG+AWxDEsG0wIfUpFjw+n7
         CpKyK/7HfVAGWHtDwixtqSPzxwHTJKh0BNUcBHKTF4zEKf8aJ8xuO3aoMAV5RYA/UnTC
         K4sQ==
X-Gm-Message-State: AFq9FYKNLvL6IIhHT27ZhoZKnEksVFc9SjUw8Ms6z6/pncBTQbNHDfbf
	xVdYh41/DERH8udVWkUhyFSx703Z86HAJvNO9LJy627FavLeYQ1n6dW1/YOAcNBWizsJiSceQzC
	JxwhVaakeBjcC5jV5bwNa/KsA05m1JQTDgv7JKuG3cGs00anM7YEQz6I=
X-Gm-Gg: AYBFou2mFH1pZ1gwh1SPZT5HdC/3ypKQgoOferMNqBMrXizpLoOvkT8akAAp7IIemJw
	1CKy7kIXw4GsY7SSl5pvu2jYiuy1pQbbbSDRmPo0NqZfjnq7OphLtateVwuzhwTqNB1DaVf8DTg
	9rcI58rL7CA6mDIb6Q4OmoufWlpzJUsD3hBWgv19SQixijTZiiU7dqYXoV4ZmrF5MFic+YNGNdX
	K3awhn/o7D073WC9ffYxtfkYvxkuBJ82jDq41SNoLSVZs8QlCPHkPtQHS3GNNXVZMQj/e8pzMtL
	BbfOMXbYl0KBjk5oDMJVl9v6E4LbGYbMgHowgdWk22WJQiACRbhrmeernR/1mRhvq/5nOCdfS6h
	i48JAxq6ueA==
X-Received: by 2002:a05:6402:46d2:b0:6b1:c265:a5ad with SMTP id
 4fb4d7f45d1cf-6b1e0afc7a4mr7410229a12.32.1792081604585; Thu, 15 Oct 2026
 09:26:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015153331.1872641-1-pasha.tatashin@soleen.com>
 <20261015153331.1872641-3-pasha.tatashin@soleen.com> <sashiko-outbox-173092@kernel.org>
In-Reply-To: <sashiko-outbox-173092@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 15 Oct 2026 12:26:07 -0400
X-Gm-Features: AclHuK_yCJGAu6GoKfWJckPHB9PC9igV5tqeg2m4wPW2Hc_SYuuZdKBt7njfNgY
Message-ID: <CA+CK2bCCWkP+P6iv9BpJeMB_V0PppeaNcg6TeNzZtu_TtLJLxw@mail.gmail.com>
Subject: Re: [PATCH v1 2/8] x86/smp: Remove unnecessary WBINVD from mwait_play_dead()
To: sashiko-reviews@lists.linux.dev
Cc: kees@kernel.org, rppt@kernel.org, juri.lelli@redhat.com, 
	nik.borisov@suse.com, tglx@kernel.org, vschneid@redhat.com, 
	kprateek.nayak@amd.com, vincent.guittot@linaro.org, bp@alien8.de, 
	thorsten.blum@linux.dev, tony.luck@intel.com, david@kernel.org, 
	mingo@redhat.com, akpm@linux-foundation.org, seanjc@google.com, 
	ljs@kernel.org, zhangguopeng@kylinos.cn, dietmar.eggemann@arm.com, 
	mhocko@suse.com, vinicius.gomes@intel.com, tj@kernel.org, vbabka@kernel.org, 
	peterz@infradead.org, surenb@google.com, hpa@zytor.com, x86@kernel.org, 
	dmatlack@google.com, tim.c.chen@linux.intel.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, dave.hansen@linux.intel.com, rostedt@goodmis.org, 
	gmonaco@redhat.com, jgross@suse.com, mgorman@suse.de, graf@amazon.com, 
	liam@infradead.org, ridong.chen@linux.dev, longman@redhat.com, 
	bsegall@google.com, hannes@cmpxchg.org, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 11:44=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] x86/smp: memory corruption during suspend if package offline=
d at runtime
> - [High] x86/smp: offline CPUs miss wbinvd_on_all_cpus() flush causing da=
ta corruption
> --
>
> commit 2579aa1d01a44c8d96bb166fd2ce0dff4493a42a
> Author: Pasha Tatashin <pasha.tatashin@soleen.com>
>
> x86/smp: Remove unnecessary WBINVD from mwait_play_dead()
>
> The commit aims to avoid time-consuming WBINVDs during runtime CPU offlin=
ing
> by only executing it when cpuhp_tasks_frozen is set (i.e. system sleep).
>
> > diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> > index ba01a9e919b78..60a781dac9991 100644
> > --- a/arch/x86/kernel/smpboot.c
> > +++ b/arch/x86/kernel/smpboot.c
> [ ... ]
> > @@ -1426,15 +1422,21 @@ void __noreturn mwait_play_dead(unsigned int ea=
x_hint)
> >       md->status =3D CPUDEAD_MWAIT_WAIT;
> >       md->control =3D CPUDEAD_MWAIT_WAIT;
> >
> > -     wbinvd();
> > +     /*
> > +      * MWAIT C-states keep the caches coherent, so runtime CPU offlin=
e
> > +      * does not need to flush them. System sleep, however, may remove
> > +      * power from this package's caches while all of its CPUs are
> > +      * offline, and the flush done by the boot CPU before entering th=
e
> > +      * sleep state only covers the boot CPU's own package.
> > +      */
> > +     if (cpuhp_tasks_frozen)
> > +             wbinvd();
>
> [Severity: Critical]
> Could this result in memory corruption during a system suspend if an enti=
re
> package is offlined at runtime prior to the suspend?
>
> If a package is fully offlined at runtime (so cpuhp_tasks_frozen is false=
),
> its CPUs enter MWAIT with dirty caches. If the system later suspends,
> freeze_secondary_cpus() skips CPUs that are already offline:
>
> kernel/cpu.c:freeze_secondary_cpus() {
>         ...
>         for (cpu =3D nr_cpu_ids - 1; cpu >=3D 0; cpu--) {
>                 if (!cpu_online(cpu) || cpu =3D=3D primary)
>                         continue;
>         ...
> }
>
> Because these CPUs are skipped, they never awaken to check cpuhp_tasks_fr=
ozen
> and perform the flush. Since the sleep-entry cache flush on the boot CPU
> only covers its own package, won't the dirty cache lines of the un-flushe=
d,
> offlined package be permanently lost when power is removed?

I am not sure if this is actually feasible; nevertheless, I can add
wbinvd() when the the last CPU in the package (CPU that shares the
last level cache), enters mwait_play_dead(). That said, also my LLM
tells me that even:

> > +     if (cpuhp_tasks_frozen)
> > +             wbinvd();

that I have is not needed because:

1. Multi-socket x86 servers (where a non-boot package exists) do not
support ACPI S3 suspend-to-RAM.
2. When all cores of a package enter deep MWAIT (C6), hardware flushes
L1/L2 to the LLC on core C6 entry, and the package's power management
unit (PCU) flushes the LLC before removing LLC power in deep package
C-states (PC6+).

>
> [Severity: High]
> Does skipping the flush during runtime offline break the system-wide cach=
e
> flush guarantees of wbinvd_on_all_cpus()?
>
> If a package is completely offlined at runtime and retains dirty cache li=
nes
> in its LLC, wbinvd_on_all_cpus() will miss them entirely because it only
> targets online CPUs:
>
> arch/x86/lib/cache-smp.c:wbinvd_on_all_cpus() {
>         on_each_cpu(__wbinvd, NULL, 1);
> }
>
> If a system-wide non-coherent operation is later triggered (such as mappi=
ng
> memory as Uncacheable or persisting PMEM), the missing flush could lead t=
o
> data corruption or Machine Check Exceptions from dirty line evictions.
>
> Furthermore, during Kexec, offline CPUs are kicked out of MWAIT:
>
> arch/x86/kernel/smpboot.c:smp_kick_mwait_play_dead() {
>         ...
>         for_each_cpu_andnot(cpu, cpu_present_mask, cpu_online_mask) {
>                 ...
>                 WRITE_ONCE(md->control, newstate);
>         ...
> }
>
> Will this cause the offlined CPUs to carry unflushed dirty cache lines in=
to
> the new kernel's execution context?

Regarding carrying cachelines through kexec that Sashiko mentioned, my
LLM also says it does not make sense (and I agree with it):

1. Even before our patch, when smp_kick_mwait_play_dead() wakes an
offline CPU out of __mwait(), that CPU immediately writes to memory
(WRITE_ONCE(md->status, CPUDEAD_MWAIT_KEXEC_HLT)=E2=80=94dirtying its cache=
!)
and enters while (1) native_halt(); (smpboot.c:1461-1463) without
executing wbinvd().
2. Even more obviously, all CPUs that are online when kexec runs are
stopped via native_stop_other_cpus() =E2=86=92 stop_this_cpu(), which simpl=
y
executes native_halt() in a loop without wbinvd().

Pasha

>
> >
> >       while (1) {
> >               /*
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015153331.18=
72641-1-pasha.tatashin@soleen.com?part=3D2
