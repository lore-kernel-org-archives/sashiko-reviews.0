Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575633E16BA
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 22:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778885027; cv=none; b=shpIUm6Et9wtTl1aYhlZRzTjsbA8MFGsz+Arrd3fmBnBycWr4fxd5lTm24qaz7SlSRp6JJWvEvegQA+iStCZRPOzsfiIbte8fGuxDGkJphG80061hK30Z4natO5ldi6E9O5pUG7AUDBrEqGnPcWfLr4NuJ/jJ6jTQx5eNYzEHtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778885027; c=relaxed/simple;
	bh=QiBbUKhvE7WnBe23cJ9tSwIwO99nU6YwAlMSO3Yo/oo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=enkIJl6qjLoxhMua4msbeGIkTaipMIbdm7CW+Cp4okJwc0ssDkn4T3oSiNnu7qRE16oUkdmIWdMLXa1UxV1++GbAAK1DBwRLhj7VR7Bb0No8NrwDNsWNu7iGROwTRcUxGjAFT3pb+buW9RECCCsWJdyPBwml5cBDWXZuQSVIc7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V97bKA3P; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V97bKA3P"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82fa366fb79so470891b3a.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 15:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778885026; x=1779489826; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R2Qo4C0wZvSfbRBCVUm7E3jAs9zIx+Oehl/wA7M+yCc=;
        b=V97bKA3PnR0vpXHdi3mM4mpebqZx0Aci02FRvPWugdpV5Ayrl7YAivCvSD/AIi6utX
         +eWpwJFtBrQNdJrWNUEnC7IOGe22Vv6FaAgLQm92uuPkdfKV4RYD+plZkWtLGJWriaLm
         2oZ4pZaHhcCfCR3N6zrTvn7SIYgaoSjFTw9Sa3xhWSPN+w8EW/kuM6aGgcgcCnnKzbgB
         Hlyo5kEcxIwgC+QXQh7OByUMNKwoekAUCdaEg5e3Yc9Fl0k7ulhQlwdBEVU/FxveR0vC
         XxJyG+NyETBlpNXnGIpOV+pkT/fNjl6MWb/wJag8+onHnzOF778EshSM/0gBUUb3nS0P
         LxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778885026; x=1779489826;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R2Qo4C0wZvSfbRBCVUm7E3jAs9zIx+Oehl/wA7M+yCc=;
        b=ElEHyJ75xRV/1jevgz6tltwTRWpQNVlvsbXtQLYEBXBezMwMQ3V5wgORCMfFA1d4TP
         jvpV0P3+hSZ/Fnz0TG7etDzB/escw2sQRZ+B7WkNMyhXA7vXoAzoD6w1NUfaA/JrrS2r
         Z/kRez3tgXPTJahhZSSIOtrZrhYJXX1MhwQON3X8y23gGu6oOACy5tWsNt35g6klHx6N
         WfiYScPyhd+WsiXai3CfY3UakRtCwMMHPc7xf8etGgiKdJ1c8QtJ/C+TMJl3IOBPT2Wu
         rE3hoJL4tYyMIgbEwJxxEJvgdomhdPFl2f6GtW/vGH0s8RSgcagcM5BtiFlLFktkcCsd
         RF4g==
X-Gm-Message-State: AOJu0YwQC/YAhrDRX3UptqhNQcpN+0q+8wVg3kv3pH43iJvNGERxupKb
	+QJMiId1kJYlqfcl2oQURE1onhqQejt7Pem6huhJc80ImGGeHOznCV2zz3/SMXigl6E9dX1BVzm
	/eAJGmBw9lgF+/NVq6Fwb+k5r3mN5epiiguyuyS5FSsKZmFsxtANf3zZDePtWrMzgsGwcgH5haT
	+xR6QdTXgrUsvQc45NK7xzhfRAUk32GCCO6KcJfwR2SVflmBo2
X-Received: from pfbgs18.prod.google.com ([2002:a05:6a00:4d92:b0:82f:8956:e620])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a586:b0:837:e9cc:d474
 with SMTP id d2e1a72fcca58-83f33c31a31mr7229268b3a.2.1778885025341; Fri, 15
 May 2026 15:43:45 -0700 (PDT)
Date: Fri, 15 May 2026 15:43:44 -0700
In-Reply-To: <20260515194803.1D898C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-16-seanjc@google.com> <20260515194803.1D898C2BCB0@smtp.kernel.org>
Message-ID: <agehoBgq8hX3hCIF@google.com>
Subject: Re: [PATCH v3 15/41] x86/xen/time: Nullify x86_platform's sched_clock
 save/restore hooks
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 15, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
> > index 3d3165eef8214..21d366d01985e 100644
> > --- a/arch/x86/xen/time.c
> > +++ b/arch/x86/xen/time.c
> > @@ -568,6 +568,12 @@ static void __init xen_init_time_common(void)
> >  	xen_sched_clock_offset = xen_clocksource_read();
> >  	static_call_update(pv_steal_clock, xen_steal_clock);
> >  	paravirt_set_sched_clock(xen_sched_clock);
> > +	/*
> > +	 * Xen has paravirtualized suspend/resume and so doesn't use the common
> > +	 * x86 sched_clock save/restore hooks.
> > +	 */
> > +	x86_platform.save_sched_clock_state = NULL;
> > +	x86_platform.restore_sched_clock_state = NULL;
> 
> Does setting these hooks to NULL lead to an unconditional pointer dereference
> regression during suspend, hibernation, or kexec operations in Xen guests?
> 
> Looking at save_processor_state() and __restore_processor_state() in
> arch/x86/power/cpu.c, the hooks are called directly without being checked
> for NULL first:
> 
> arch/x86/power/cpu.c:save_processor_state() {
> 	__save_processor_state(&saved_context);
> 	x86_platform.save_sched_clock_state();
> }
> 
> arch/x86/power/cpu.c:__restore_processor_state() {
> 	...
> 	do_fpu_end();
> 	tsc_verify_tsc_adjust(true);
> 	x86_platform.restore_sched_clock_state();
> 	...
> }
> 
> Will operations that trigger a generic CPU state save or restore on a Xen
> guest execute a call on these NULL pointers, causing a kernel panic
> regression? Should these instead be assigned to an empty stub function to
> safely bypass them?

/facepalm

Yes.  I suspect past me carried over the Xen changes before I understood why
it's safe on Xen (Xen uses a unique PV suspend/resume flow).

Playing nice with NULL x86_platform.{save,restore}_sched_clock_state pointers
is the obvious fix.  The other option would be to wire up nop callbacks, but I
don't see any value in doing so.  I really don't want to leave the callbacks
wired up to tsc_{save,restore}_sched_clock_state() (unless it turns out VMware
actually needs them).

Regardless, this definitely highlights that VMware guests need to be tested. :-/
