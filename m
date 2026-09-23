Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4A73DAAA8
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 17:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184454; cv=none; b=KKlT0USOY8vNot5CNeGCufmdppPpWbkUdklXRnymUH3lGgmngEN8qi3HS3pUi1gi5iIfe+gFmyH7SJWaB2AWvO7rzmIn2cRtXWH6YqZzbk0Hi766N8PzedE/8CR9UGZz4BdCY2fdKHT+SEgacn/v9YQ5eLJX+2AtxsnI2UshHAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184454; c=relaxed/simple;
	bh=ohhh4GeReoXqlie8n4KfNmSMcuvcMAlJTHky9MGmbYg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JLFHrRQP56rX3TVavcYTf1GXZx2HjvvIn3c3EPuGb8TB7ped6BBk4PXM6zUCmtYfm0+yB9sdWEahFfQcAKklcec0Dji3t2oiOQuNQFk+fJNw1Hg7Cf0Aemo6ul57SmTUx0+lqFaiJgvRv+oU8tNP/gPi9ioNB+TwexxZw9ScR2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vicSno7I; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vicSno7I"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1028100a91.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790184451; x=1790789251; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ivQ/PauxsngIEfdEX/Gkp03t093uOowh/SUB9gD9AoA=;
        b=vicSno7I3bYj1+YaOI8lL+O7T9r0xbTY24rep2PchdcmoVKuvEDOQfX++EjZS/F9cS
         WLgWV2LdL9DBOJU6p7K4vRXMcEJ5vB1Sp4Ii63iOSSqHATWC11ZNgOB5b8sJFYJ7n8OB
         gKhJxJj08ugvpFNsUgU4jmxZBp0nB6A/rmIXs8EURqK/jufG80aRwGYcaHQyDn8SNS+j
         oaqEZlBQQJjwblv+o7SRyKcRmbzx6W81wJUbeECdfNcm99hEvynkgsev9KvE1x+BX0Ei
         pe+ETeWfugI0Z2X8w9bWyRHQZxTNJJXmCF4ZIIVurhX7OAPn3LHiell7au55p2HOKLdX
         yqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790184451; x=1790789251;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivQ/PauxsngIEfdEX/Gkp03t093uOowh/SUB9gD9AoA=;
        b=h2r7fkpZr49nNIPsj9dCSV78IPRrv+j7E/HONwzdujDJEUELBkgLVod05ZxvezApDb
         2rbdXAtQG2Z+dLPI5kdXmaU2W9U03+f0qRFcGNK8qgM72IC4JOZmzvldurnCwmkg/uY1
         ggNnr4Bj6W7HN3F12LUU09SzMpEjSMthVFbvROQnLkOxuruVUOXgtmIQT7mmwj5uQxb3
         DYu+3IpnLigCMeTvB/73f/Xj+oF1J5gJFrRloKm11Bbkv2y8fXqmQKCodHmu4o+u30rT
         efGrTLUerwW7IH+rfSrZs9Y80b4xdC+D3UMuJjGjxOgWLo86Pin8OpFMshVCtX9pe2aU
         6TUw==
X-Gm-Message-State: AFuF++mK2JzzqbdURoJjhElzcZVH2ta5w6W0BFq8ifqMAC6GoeMbRi3D
	KmQuYmdb06pm4zvkrh0kzrAFEopxhm09lgNIOZI/V8NsE2KmLJRVTN13/BrncE83+S5f4NYATRi
	GMdPsEzvHDEfAEi6pKMD+hgpxsW9yyebqlm/y/n8Rk39N5PabWGaVYjcLb/O8Q6IJ2VihYzvxhq
	h4UItYKDEE0ML/sFPRa03hTHZAD5g46uK2oeqXqRg0aE0fZNTB
X-Received: from pjbmr8.prod.google.com ([2002:a17:90b:2388:b0:3a0:8047:cc01])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4fcf:b0:3a0:352d:4cb5
 with SMTP id 98e67ed59e1d1-3a07e565a13mr3239733a91.13.1790184450511; Wed, 23
 Sep 2026 10:27:30 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:27:29 -0700
In-Reply-To: <20260923165349.CAAF01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260923163721.1584779-1-seanjc@google.com> <20260923163721.1584779-2-seanjc@google.com>
 <20260923165349.CAAF01F000FF@smtp.kernel.org>
Message-ID: <arQMARDUTSjbWpMX@google.com>
Subject: Re: [PATCH 1/2] KVM: SEV: Free have_run_cpus during VM destruction
 even if VM is no longer SEV
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 23, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] kvm: double free of sev->have_run_cpus on initialization failure
> --
> 
> commit 35fcc7370ece167eff16a7738a6c47e4815c1ae4
> Author: Sean Christopherson <seanjc@google.com>
> 
> KVM: SEV: Free have_run_cpus during VM destruction even if VM is no longer SEV
> 
> Unconditionally free SEV's "have run CPUs" cpumask in the VM destroy path,
> i.e. even for what appear to be non-SEV VMs, as an SEV VM becomes a non-SEV
> VM if its state is intra-host migrated.
> 
> > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > index 63e8cfa9bf559..c9242c936a401 100644
> > --- a/arch/x86/kvm/svm/sev.c
> > +++ b/arch/x86/kvm/svm/sev.c
> > @@ -2981,13 +2981,17 @@ void sev_vm_destroy(struct kvm *kvm)
> >  	struct list_head *head = &sev->regions_list;
> >  	struct list_head *pos, *q;
> >  
> > +	/*
> > +	 * Free the mask even if the VM is not *currently* an SEV VM, as it may
> > +	 * have been an SEV VM prior to intra-host migration.
> > +	 */
> > +	free_cpumask_var(sev->have_run_cpus);
> 
> [Severity: Critical]
> Can this cause a double free of sev->have_run_cpus?
> 
> If a user issues a KVM_SEV_INIT ioctl and __sev_guest_init() fails after
> allocating the cpumask, the error path in __sev_guest_init() frees the
> mask but leaves the pointer intact:
> 
> arch/x86/kvm/svm/sev.c:__sev_guest_init() {
>     ...
> e_free:
> 	free_cpumask_var(sev->have_run_cpus);
>     ...
> }
> 
> Because free_cpumask_var() receives the mask by value, the pointer remains
> dangling. When the user later closes the VM file descriptor,
> kvm_destroy_vm() calls sev_vm_destroy().
> 
> Prior to this patch, the early return on !sev_guest(kvm) prevented the second
> free. By moving free_cpumask_var() before the !sev_guest(kvm) check, won't
> we unconditionally double free the dangling pointer?

Ugh, what a pain.  Ideally, free_cpumask_var() would nullify the pointer.  But
for a KVM-only "fix", it's easy enough to do the mask allocation last so that
there's no need to unwind and figure out how to nullify the pointer when it's
off-"stack".

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 96b4ed220eaf..4cbd38a48c5a 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -545,16 +545,16 @@ static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
 	if (ret)
 		goto e_free_asid;
 
-	if (!zalloc_cpumask_var(&sev->have_run_cpus, GFP_KERNEL_ACCOUNT)) {
-		ret = -ENOMEM;
-		goto e_free_asid;
-	}
-
 	/* This needs to happen after SEV/SNP firmware initialization. */
 	if (snp_active) {
 		ret = snp_guest_req_init(kvm);
 		if (ret)
-			goto e_free;
+			goto e_free_asid;
+	}
+
+	if (!zalloc_cpumask_var(&sev->have_run_cpus, GFP_KERNEL_ACCOUNT)) {
+		ret = -ENOMEM;
+		goto e_free;
 	}
 
 	INIT_LIST_HEAD(&sev->regions_list);
@@ -566,7 +566,8 @@ static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
 	return 0;
 
 e_free:
-	free_cpumask_var(sev->have_run_cpus);
+	if (snp_active)
+		snp_guest_req_cleanup(kvm);
 e_free_asid:
 	argp->error = init_args.error;
 	sev_asid_free(sev);
