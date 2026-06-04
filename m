Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDBA4C6F0F
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 17:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780594083; cv=none; b=FU9jASPnFFpNxdKvtOmCW8bRss6P4hN5gb8W5oY2CCA3qvdEVBWYT4P4qfhp488oWx4hQnCZ2cnaWmHIqoYJeFOZxVLsr4W/HID+QlMTIaobT+fwvB0pLqh1ooXmOU5gimpkuqGh7FfAquWbBk+VrBQinXUlgW66fGjUz+HDDjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780594083; c=relaxed/simple;
	bh=M2T5ZxLA1JyjKgcvQpdxw8SCcHYr1mJ0zHofsSl1ww8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IvpGh4TbYs6R9bNOK4NGePpPkhBnqEFdFYRGKVKv4L0ApWCJ0dJ/uwcOAYtqwVEM3HahMCev6qheUgKRmaQ6JXW2w5Hio6YQHudGRnEtaGqF4BbzOJD1UsAgcg+U9+tPAaW9oE1xziu6Nru2ZoXlfMkST+ymh1+kkbWRvpJ15Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iZ1F0U2P; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iZ1F0U2P"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c85798977dcso698942a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 10:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780594082; x=1781198882; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VYJiLzugjQMK/35RUx1gXPZXJK9kZ1zLL4JhlYRYAi8=;
        b=iZ1F0U2PP8De2B1WL8/sXxPqqInxltkXrxk7u+coxT1U9EOdsnaPSgxUGmHHShrJBY
         qPUYkHRUEYEakV8yGngan6LHEwUgtMk04srL3zEt897dw36vsnKpdEhfQJeYbMUxS5jX
         ZiSzisu2RDou8gPYP04AaNw1OnkkbPB+wg3laSfxny7yf35chtTKrYelgcVkBK3ZSgIC
         vYzJpq9PzPHmmy72vtg2D/JrWrgv6o2rHzy6eq2426IldnCyIixLiMh6dRn/DNbZL45a
         b2pbs4HXH5cEbz4NXP6u4XAVORHydOCz4I9epkIEriHBsJdtVYMU+kPeZS7xVwrsME9x
         ZmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780594082; x=1781198882;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYJiLzugjQMK/35RUx1gXPZXJK9kZ1zLL4JhlYRYAi8=;
        b=cdGZDcCGZ9G0xRtSVD3ol8352KEa3hAb9+yDAJVKylUmwXTA/hJr2TpaZTBeOBnrQx
         RmNcWZD2+8eaC7HXifb8JnEdjqkTAvb9V66li8DWWTsRqDcGX1IBBT14JrS08I61pFBB
         RCIy80Iy6WjSbDa6VZAFONHuIi2DouFzWFqkzAXA/s0JyTFHOr5w3irm/IeB9aDMTM6j
         /qmPEnDQvGLGyBBTBy7OJ8pE7ZH/ZqY/NUDXxHMBoKzbIPNyUqtdyinrbIcQn/pzMOMr
         JJhFSQ3WjQwDze8IWlnENJOKU9rWbJ9XaLC2nrFnSgaJ/VKerO9lG67ev+O/PkYksXvU
         DD5A==
X-Gm-Message-State: AOJu0Ywmb3E6BekipSXUjq2BxprIu+sv1B3mChqeXDyWP0F4laPoS9SB
	iYTEHGui4Lrdnjjdl1nSa0VuVIcpZDryDtex+zbZf3ycIBCyYScbHRe72k+dRMF9/60RSnSZNSG
	ekeXXpoq7wWAojOeW7luNxLU+fid3vdJMSmG5URyPPdETOvNO1iQ/kNdAJ/TGyrOd8dCTuk+M9R
	zaLIa8yXHJ42um0NlSdUvnIyfqH3/V1aq/fzicQcZSBtv0NB73
X-Received: from pgww25.prod.google.com ([2002:a05:6a02:2c99:b0:c85:6d7c:2c15])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6113:b0:3b4:9168:d9e6
 with SMTP id adf61e73a8af0-3b4cd04029emr53452637.37.1780594081546; Thu, 04
 Jun 2026 10:28:01 -0700 (PDT)
Date: Thu, 4 Jun 2026 10:28:00 -0700
In-Reply-To: <20260604022125.A29011F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260604020143.748245-20-jrhilke@google.com> <20260604022125.A29011F00893@smtp.kernel.org>
Message-ID: <aiG1oPLl6kD5ygJT@google.com>
Subject: Re: [PATCH v5 19/21] KVM: selftests: Print vCPU affinity on timeout
 during IRQ test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Josh Hilke <jrhilke@google.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 04, 2026, sashiko-bot@kernel.org wrote:
> > +void kvm_print_vcpu_affinity(struct kvm_vcpu *vcpu, pid_t tid)
> > +{
> > +	int nprocs = get_nprocs();
> > +	bool first_range = true;
> > +	int i, start = -1;
> > +	cpu_set_t cpus;
> > +
> > +	kvm_sched_getaffinity(tid, sizeof(cpus), &cpus);
> > +
> > +	/*
> > +	 * Output format examples:
> > +	 * - Single CPU:  "vCPU 0 (TID 1234) affined to pCPU(s): 2"
> > +	 * - List:        "vCPU 0 (TID 1234) affined to pCPU(s): 0,2,4"
> > +	 * - Range:       "vCPU 0 (TID 1234) affined to pCPU(s): 0-7"
> > +	 * - Mixed:       "vCPU 0 (TID 1234) affined to pCPU(s): 0-3,8,10-12"
> > +	 */
> > +	printf("vCPU %u (TID %d) affined to pCPU(s): ", vcpu->id, tid);
> > +
> > +	for (i = 0; i <= nprocs; i++) {
> > +		/*
> > +		 * Iterate to nprocs (inclusive) to ensure that if the last pCPU
> > +		 * is part of a range, the 'else' block triggers one final time
> > +		 * to flush that range to stdout.
> > +		 */
> > +		if (i < nprocs && CPU_ISSET(i, &cpus)) {
> 
> [Severity: Medium]
> Does using get_nprocs() as the loop boundary risk silently truncating CPUs 
> on sparse topologies?
> 
> get_nprocs() returns the count of currently online CPUs, not the maximum 
> CPU ID. If a system has 4 online CPUs but their IDs are 0, 1, 2, and 7, 
> get_nprocs() will return 4.
> 
> This would cause the loop to terminate prematurely, completely ignoring 
> valid but higher-numbered CPU indices (like CPU 7) in the cpu_set_t mask.
> 
> Should this iterate up to CPU_SETSIZE instead to encompass the entire mask 
> capacity, similar to other helper functions like pin_task_to_random_cpu()?

I'm going to skip this one for now, too.
