Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2075B313E2B
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 14:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433056; cv=none; b=muxxOv3UzmwIeKzpNQxAkeq6YukE036lED7J5LK2mGyWbmquJe0jtjLgoWHW0/xM46QLFjQUJkWAGMVILKLTpJxvXBlkcpMSdROay355ySC2ZpAEEC/ebx4WWpGlquBJSCgvX2L1etsVvtbV2m4cZeWrFq61Tut2fVRIarRYLyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433056; c=relaxed/simple;
	bh=IJJeqWWOz8cYTacN6NYsMTZL3vplCvTu/9nq4A9sIOk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pxG7o2XvFQ0NVzRO+yMZTvXS26o5XitR9TSEC7ZLWesvui81osLPdk5xifP6Md6FuYIdTIwyTCL61tL1EBHMmyiwh9Zp0hoLGzXGUzkS0j6SBpe4Aq95GnJ9Ma6zHiu8v6foGFZBNcns+LTIKupgcAXuc11hMBCj+e3DCUQrq6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OcG+rEPI; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OcG+rEPI"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2cacf17c7e0so52819115ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 07:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783433054; x=1784037854; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TaRRPm7rRenJCz4WhvXhn/Su3WW8BYkGJwkilHjufHw=;
        b=OcG+rEPIEKNOxV6T4zNlNvUKP7UQbPfY9SAWMPqXqZriGd/xv9b2ikARm68W77OVoD
         bAA8rry95BUKzEEDqPOJbg9rHxv64hFNsHkfNOdN3qT1qybY88v6mpYjo66mKuXBBnyw
         Bf9OR1oEvyefmKMUf7+QXRJOkHEjpw0Qklbk6X2gM8k5SmZshi3iJW2AknHDvDtT8p66
         Oy0WQFeH0bQj1bQNWS6ipCydrD0OIxZFCc09mLp7B39+U+T2e5+C9udfZTydmeguCCOn
         BDmPss/DkrWEChfUuvHzb09zPmNCb25GbuOmyOKd7sOuOPKQLMd4bNYm1mMVhACV6mcc
         6w3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783433054; x=1784037854;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TaRRPm7rRenJCz4WhvXhn/Su3WW8BYkGJwkilHjufHw=;
        b=A5KX/1GtF/zaYHL5ya+O/3wf+s7dMPuQWILZo2jaQcOimViBIbeXqRawzPbMPabTA4
         GAG/tkTog9BQ+eRL3qsUhtoM8PKCY8yo7LkT0AOVzik6y/3D6ucdIA/7NKJyDKQp8HQ8
         apaI0UiRpxZeoQegiYLoSElxuX1gA+lebTMxIPyfsaBKG/deLEZeca6SIyS+c9abfwgL
         YrIMpj0JB/HT56if1XNDp65NLSsPzuJNzkVwW+Zrb8fDQE1dMUVfIcvUv+kwDQccpN1G
         CeNIn2vgK1VWEALVPKmvbfIrEgFE/JBgi0Cpm3W7fTcaUAXRksrgdQ2HIpVivI+Fwn4j
         OgXw==
X-Gm-Message-State: AOJu0YxlC1DYKa/e+ssN0PxgyUMH3gfli9Hfu9XI0zqLCpuNnKzVbVko
	gmMU2Mh8NYxLZVSKtGMzMoMv7RMNm5NJfzUu6WSzDUEHbM3goE78iYccT7sy9bwQZtNgwZlw04o
	j2V9L+1QA2h+RuP2IeyTjjWJxuz5OL5I6SIBoWGPPxyFMbs1NlPOEcNT24S98LhKrHkKiRKfeHg
	MAv2VwPa5drmA1KG/0r9JpyvjTRp8Z10gUK/i7mzsiKfXpIMPL
X-Received: from plrf2.prod.google.com ([2002:a17:902:ab82:b0:2ca:bb5b:3c6b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec85:b0:2c6:a012:6241
 with SMTP id d9443c01a7336-2ccbe3f7d69mr56668875ad.6.1783433054149; Tue, 07
 Jul 2026 07:04:14 -0700 (PDT)
Date: Tue, 7 Jul 2026 07:04:13 -0700
In-Reply-To: <20260706164913.3A7A91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260706163649.155548-1-hisamshar@gmail.com> <20260706164913.3A7A91F000E9@smtp.kernel.org>
Message-ID: <ak0HXd8HMyKDCU1U@google.com>
Subject: Re: [PATCH] KVM: selftests: Use KVM's task pinning APIs in steal_time
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Hisam Mehboob <hisamshar@gmail.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Jul 06, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Race condition causing intermittent test failure (ESRCH) due to late thread pinning
> --
> 
> commit 27b6bbfae99d5564cda41cbc7b8c36c7b9a4ed64
> Author: Sean Christopherson <seanjc@google.com>
> 
> KVM: selftests: Use KVM's task pinning APIs in steal_time
> 
> This commit updates the steal_time test to use KVM's task pinning APIs
> (pin_self_to_cpu and pin_task_to_cpu) to pin the vCPU and stealer threads
> to pCPU0. This removes the use of pthread_attr_setaffinity_np, allowing
> the test to build against non-glibc C libraries.
> 
> Link: https://lore.kernel.org/all/aLIroyJSWQ26wnY4@google.com/
> 
> > diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> > index 76fcdd1fd3cb4..19a97d6a36076 100644
> > --- a/tools/testing/selftests/kvm/steal_time.c
> > +++ b/tools/testing/selftests/kvm/steal_time.c
> [ ... ]
> > @@ -558,7 +552,9 @@ int main(int ac, char **av)
> >  
> >  		/* Steal time from the VCPU. The steal time thread has the same CPU affinity as the VCPUs. */
> >  		run_delay = get_run_delay();
> > -		pthread_create(&thread, &attr, do_steal_time, NULL);
> > +		pthread_create(&thread, NULL, do_steal_time, NULL);
> > +		pin_task_to_cpu(thread, 0);
> 
> [Severity: Medium]
> Could this introduce a race condition that causes intermittent test failures?
> 
> Since pthread_create is called before pinning, there is a small window
> where the child thread (do_steal_time) could execute and complete its very
> brief 200us run before the parent thread executes pin_task_to_cpu.
> 
> If the child thread exits before pin_task_to_cpu attempts to set its
> affinity, it will return ESRCH and trigger the TEST_ASSERT inside
> pin_task_to_cpu, abruptly aborting the test.
> 
> Is the explicit pin_task_to_cpu call necessary here?

Nope, which means we can simply drop the problematic pthread_attr_setaffinity_np(),
though I think it makes sense to add a sanity check that the worker did indeed
inherit the affinity, if only to document what's happening.

I'll send a v2.

Thanks for posting this Hisam!

> Since the main thread already called pin_self_to_cpu(0) earlier, the new
> thread created by pthread_create should automatically inherit the parent's
> CPU affinity mask.
