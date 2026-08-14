Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC333655CA
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 15:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720340; cv=none; b=KX3T8RY4paNy8kFmotOFIe7zN5i7E7SzfclSxhOzRPfBWHQDgkYuBJzljBlknjmbhoUkpJCEjb38NVhsSzcjmBPtYbBBmz5MNpOMPn6BAWWJRSGvnM4JfFohrEgC22cBtzuRqBKu8SYJY1pV0JXCIRxVC/5WeKq/7Tccv1kpamg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720340; c=relaxed/simple;
	bh=YjXhgCp1V1fmC5SGOF9Nbi3GqMHa7js2NpIkRFDwBpw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TLFfd4fe1AsH0fG2vK51UJXsTBkyBdoXj277uSRmlFs466j2t6/M4Tpy3oVQYZ3kAuPzgg5n4jufxNYDKN0AmLUIitkhZHMmCCvPpfYRJXZhLl4/qZkrCB7osDXcRqRdyRknJNMafnzY6GnQ1O5juzknv4ez7tj82RM50Y7EKRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=onvmVddc; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="onvmVddc"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848474825ffso1395834b3a.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 08:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786720339; x=1787325139; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VugEXRUe1z3zOvPoCSjijw2ROSlM1mXqh6A8QGXQXY=;
        b=onvmVddcEjuIXFzf+pkwLvr9iMCkt4ZdLaL8Ug9U5bTaudEPA1VXilbPuCdD6m4Umo
         hAId2/iZ4Ms5fA3PMHl2pk9lN0+mb7anPih31Ol9ROhM+J0dRA1LOxxKvtI5YrOOQcMu
         7JQjCwkjPAUMjiCudDEB8NwUHlv3y83AcDx0dPypctiFClN44S2Ml2pjOlaffwnm/5Gv
         zj03n76r18TQZbeiJAX0GsXSgzmlDy6hRowaIFa3tBznvtnjmU8cj3EnLxD84/+eqSoJ
         9M9hy326zuiLQ5aLKvU6+2vbmTb/YzpEyuu+6Q0nI/baYMAPGDYjmfozBpg0k/72o19D
         6eDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786720339; x=1787325139;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VugEXRUe1z3zOvPoCSjijw2ROSlM1mXqh6A8QGXQXY=;
        b=hyG6xyD6dJlZAr6xGpsJcc+Xzj2DILrZmLZxgMwgQy4cVOYOwCK09L6GscVyggfGE3
         iTU1+f0Y68W5+s8Nk3Ph9iVP/4m6/nx508d5DyvxNRZdYz1Ik4607ZYSgiE0fAtf03Y3
         d68F+uRTAFV5xAB0/4lATwKbD6l1TJgcXhITenH6dwRaF4iPuyH4eI+B0H6VCho4kITm
         7Ji7OqVSIqSnu3LmbrZiWGanR1UD4uhxdGgghbifHtojYIhilSWcPHk8M0RigZnu3iRO
         PsRmexoNYU4hJdJUwzv33KwWRBfdE8/9dRricUoZFvnr15suA/jSlEsx5mZnFCfA8tb4
         qiSw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4jIj1DLke+opOProRgjdNj1Wo/4DU22J8C1DbGeoYTqqY59eFQ6/6VT0pfaWtxa61kHyo16P/j4n/C6Ht7Qo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMIcXXsukzu0jFTAbQAfY9RIS8+Xu5JNCUJ8/jYqGUSi9yHPyP
	m292Wh89sQEGY6OJ4cS4gWrHpO+Qjk2mBfz0hvuWmlOCgAyD2FL7Xy5KHTGR4GWGnb4bTypNPPk
	hv5vVqg==
X-Received: from pfej18.prod.google.com ([2002:aa7:8d12:0:b0:846:5d01:2319])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b8d:b0:848:7bcf:9a9a
 with SMTP id d2e1a72fcca58-84fdc60896bmr5484760b3a.1.1786720338211; Fri, 14
 Aug 2026 08:12:18 -0700 (PDT)
Date: Fri, 14 Aug 2026 08:12:17 -0700
In-Reply-To: <eddf28d4-c211-41fb-b0a3-586e5afde030@intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260812080229.2481439-1-xiaoyao.li@intel.com>
 <20260812080229.2481439-4-xiaoyao.li@intel.com> <20260812082306.11E8B1F000E9@smtp.kernel.org>
 <8b05ead1-ef2c-472f-a613-bcd1a65b64e1@intel.com> <138969948dac13369ddebd72bf523dda4dda6b85.camel@intel.com>
 <an5W5XC97HK229MX@google.com> <eddf28d4-c211-41fb-b0a3-586e5afde030@intel.com>
Message-ID: <an8wUfZ9JxvEhtHS@google.com>
Subject: Re: [PATCH v3 3/4] KVM: TDX: Don't assume exit_reason[31:16] as all-0
 in tdx_to_vmx_exit_reason()
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 14, 2026, Xiaoyao Li wrote:
> On 8/14/2026 7:44 AM, Sean Christopherson wrote:
> > On Wed, Aug 12, 2026, Rick P Edgecombe wrote:
> > > Side note. I really dislike how tangled this area is for something that seems
> > > like it should be much more straightforward. Deriving partially I think from the
> > > overloading of the TDVMCALL leafs with the exit reasons. So we have things like:
> > > ...
> > > 	case EXIT_REASON_EPT_VIOLATION:
> > > 		return EXIT_REASON_EPT_MISCONFIG;
> > > ...
> > 
> > I peeked at that code again, and FWIW I still think swizzling the exit_reason for
> > TDVMCALL is the least awful solution.  If we don't do that, then we'll have to
> > update every single use of the exit_reason to demux TDVMCALL into the "real" exit
> > reason, which will be a mess.
> 
> I'm not sure if you read my idea[1]?
> 
> I think there is only one place KVM cares about the exit_reason TDVMCALL,
> just the
> 
> 	case EXIT_REASON_TDCALL:

No, the massaged exit_reason is also subtley consumed via trace_kvm_exit().

It's also consumed by tdx_complete_emulated_msr():

	if (vmx_get_exit_reason(vcpu).basic == EXIT_REASON_MSR_READ)

and by tdx_interrupt_allowed()

	return vmx_get_exit_reason(vcpu).basic != EXIT_REASON_HLT ||
	       !to_tdx(vcpu)->vp_enter_args.r12;

and by tdx_protected_apic_has_interrupt():

	if (vmx_get_exit_reason(vcpu).basic != EXIT_REASON_HLT ||
	    to_tdx(vcpu)->vp_enter_args.r12)
		return false;

> in tdx_handle_exit().
> [1]
> https://lore.kernel.org/all/646f9595-459f-4224-b4e5-4ec2eecc0bc6@intel.com/
> > And once we track the exit_reason separately from vp_enter_ret, IMO it all becomes
> > more logical and easier to follow.  vp_enter_ret holds the information about why
> > VP.ENTER returned/exited, while exit_reason holds information about why the _guest_
> > exited.  Obviously it's imperfect since we're still fudging EXIT_REASON_EPT_MISCONFIG,
> > but again, I think that's a better alternative than demuxing exit_reason in multiple
> > locations.
> 
> The question do we really need to swizzle EXIT_REASON_TDCALL to other exit
> reasons ahead? why cannot them just be handled in the central handler for
> EXIT_REASON_TDCALL?

Because as above, it's not as central as you think.  If we want to not swizzle
the exit_reason, then IMO the only sane way to do that is to not track exit_reason
for TDX vCPUs, i.e. move vcpu_vt.exit_reason back to vcpu_vmx and force TDX to
always demux vp_enter_ret every time.

> I think there will be more problems when TDX can exit with the reasons that
> are currently swizzled from the TDVMCALL. e.g., when EPT_MISCONFIG can
> happen on private memory.
