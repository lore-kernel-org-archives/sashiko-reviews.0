Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016903E717F
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 14:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782398825; cv=none; b=nrSh2mFMmG88C6MPBnFhJpA0+t2A6lNYB6i4eki/w6QC6zcXW92bqlpl9lamcINHHqT18EKh4pz4b1Fn3/z2EHc+yXjNqKriPo7UkDT8LAtlNhT/JwolZse8jDFBkvZkqMVoIk6KiRW/R5OBdqK3tvp8axWX6zaRsx8tsZK2mIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782398825; c=relaxed/simple;
	bh=S3+dkh2AAJ6V4XkIrQrgR8TKF7PKZWqSNP4fIsdZR1M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hRPDaL3LYUh3SpKQ2w7DTDCwJYEQtTaEcWZrjNMnd1RblCT+nU67DhX6ZjO87g2HFxuM64XMlJZlKhmOMNffYQLtWWCmSis2zFrKER2FUdJv8Nbz1gpm5gV/0rIm8yontC+vWqUsWUCZVHIcZIjNkuAU5tRkiJD9JO6sKVL/4oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vbrSBcee; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vbrSBcee"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bf55c3f44aso5996265ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 07:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782398822; x=1783003622; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5FjTW/9czr0/KEcw1u4AJo3uHAihN7mDKo0VNDm2rhM=;
        b=vbrSBceebxlm9XBYVcLcihPjOOn7hnnHXf2moTasvl5HKdE2S8kxeCarZ3DFXdQkCt
         2AT7W9gfedarHxAkyVAI3LGlm+VjLgnYOa1Uzo2qhOFLVJtxAO3/RIZWz5H4GdSvu2OJ
         kurFAvs1Q6E8+X5v2FNns2QBvIPIZqTGwHYMNYo6quRDt4MpK2F0zwk4pM11LcvTgRrd
         BKGV2/cj+4d4kZNOH3XdK68GaQ/CH6Qbm+gFk5v04PU6qaJuk+OGS7xUABeYwfe0+cq0
         IJDJVo0ztZSQm376M44BSKBjR+h4OKhpighmA4kwh0/rdJT7JeqqcD9Oo0dDaEwCAVNX
         PHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782398822; x=1783003622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5FjTW/9czr0/KEcw1u4AJo3uHAihN7mDKo0VNDm2rhM=;
        b=Fzfd9UGwqCr+fK5TcnagCx+zzFcpuHwWI2tc9FrgNI4CafVHbHLLOg27P2JqL+J9CS
         ryT6oyj8DZtnY5hDbU0ih8AIH5o2+NfP+EB3GNPp3N4/PDTRFCN6ZsY0RkfPnJcIeD4X
         UDt3/TRYEZKmPoDMa+hcteOfqI/sKNlC0SFtXHGoNmUxRhOKu9cfVOkFx+VikmonGc9O
         WsRe48d4HRTI6KNioFy3P+r0zFXWK7Ph6IVWLy7Gb+3n2lM5ciKrbML3UtUi+U9QnNtg
         pHOU6Y5ruBV6qYKLSwjJ2Jd7SrrDPJ2h0uPtq6Yqt8yUGgEEZc1pFn4HOp5uUOfGeHUw
         Yo3g==
X-Gm-Message-State: AOJu0Yx4velYOwtyWygkryOAY9PWFKcBQA6GqY9Hkj2XSQkYTXszJBBu
	JbRrEQddEqyEGDJPUGDUT61yGTWs49r1tURGIOPw7A7mJdykrOXmOrXgn5X8N451DAbkfXlQAYQ
	ctxemhipbVkrzABgbXdJAmVxNsbrMrja/Lq4YdjnqmLxmdpQdd0D3otNZ6viL01lRw9/roCtwdW
	wL42HF7tH6jv/P30X3ANduKX/Kc3NzjUrW0uxipEbEMh0CPeFQ
X-Received: from plrd20.prod.google.com ([2002:a17:902:aa94:b0:2c7:9ba8:5327])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:320a:b0:2bf:2ea3:af30
 with SMTP id d9443c01a7336-2c7c3d2ad10mr124561455ad.4.1782398821740; Thu, 25
 Jun 2026 07:47:01 -0700 (PDT)
Date: Thu, 25 Jun 2026 07:47:01 -0700
In-Reply-To: <20260625095846.EF9271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260625094047.255954-1-suryasaimadhu369@gmail.com> <20260625095846.EF9271F000E9@smtp.kernel.org>
Message-ID: <aj0_ZWALxEcvlUIy@google.com>
Subject: Re: [PATCH] KVM: SVM: handle wraparound of asid_generation
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: suryasaimadhu <suryasaimadhu369@gmail.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 25, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch claims to fix a 64-bit ASID generation wraparound, but provides an incomplete solution that only shifts the theoretical ABA vulnerability from generation 0 to generation 1, and fails to remove the corresponding FIXME comment.
> --
> 
> commit ecd299cb836eda8be32eeffedf37f3e076185761
> Author: suryasaimadhu <suryasaimadhu369@gmail.com>
> 
> KVM: SVM: handle wraparound of asid_generation
> 
> If asid_generation wraps around to 0, it matches the initial
> value of svm->current_vmcb->asid_generation (0), causing KVM
> to skip calling new_asid() and potentially reuse stale ASIDs.
> 
> Fix this by skipping 0 when incrementing asid_generation.
> 
> > diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> > index 24d59ccfa40d9..cfb9952f7c1f6 100644
> > --- a/arch/x86/kvm/svm/svm.c
> > +++ b/arch/x86/kvm/svm/svm.c
> > @@ -1794,7 +1794,8 @@ static void svm_update_exception_bitmap(struct kvm_vcpu *vcpu)
> >  static void new_asid(struct vcpu_svm *svm, struct svm_cpu_data *sd)
> >  {
> >  	if (sd->next_asid > sd->max_asid) {
> > -		++sd->asid_generation;
> > +		if (!++sd->asid_generation)
> > +			sd->asid_generation = 1;
> 
> [Severity: Medium]
> Does skipping generation 0 fully resolve the wraparound issue, or does it
> merely shift the theoretical ABA vulnerability to generation 1?
> 
> If a VMCB happens to sleep for an entire 2^64 generation cycle and wakes up
> when the generation counter reaches 1 again, wouldn't it incorrectly match
> the wrapped generation 1 and reuse a stale ASID?

Yeah, properly "fixing" this would require poking every vCPU in the system.

I don't see any value in trying to make this bit of code less ugly.  In practice,
the generation is never going to wrap.  Even if the CPU were able to increment
the generation every *cycle*, a CPU running at 6ghz would only overflow after
~97 years.

And Yosry's nSVM TLB flushing series completely eliminates the generation scheme:
https://lore.kernel.org/all/20260616004155.1435766-10-yosry@kernel.org
